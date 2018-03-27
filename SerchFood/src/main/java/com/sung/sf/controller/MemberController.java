package com.sung.sf.controller;

import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.util.JSONPObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.sung.sf.dao.MemberDao;
import com.sung.sf.dto.MemberDto;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDao memberDao;
	
	//가입자 리스트 확인
	@RequestMapping(value="/member_list.sf", method=RequestMethod.GET)
	protected ModelAndView listBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		
		ModelAndView mav = new ModelAndView();
		
		List<MemberDto> list = memberDao.memberList();
		
		mav.addObject("member_list", list);
		mav.setViewName("list");
		return mav;
	}
	//로그인
	@RequestMapping(value="/member_login.sf", method=RequestMethod.GET)
	public ModelAndView loginform(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("login");
		System.out.println("<<<<" + "로그인폼 진입" + ">>>>");
		
		return mav;
	}
	
	@RequestMapping(value="/member_login.sf", method=RequestMethod.POST)
	public ModelAndView loginActionform(HttpServletRequest request, HttpServletResponse response) {
		
		String userId = request.getParameter("id");
		String userPw = request.getParameter("password");

		System.out.println(userId+userPw);
		
		boolean sign = memberDao.login(userId, userPw);
		if(sign) {
			return new ModelAndView("check");
		}else{
			return new ModelAndView("fail");
		}
	}
	
	//회원가입
	@RequestMapping(value="/member_join.sf", method=RequestMethod.GET)
	public ModelAndView joinform(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("join");
		
		return mav;
	}
	
	@RequestMapping(value="/member_join.sf", method=RequestMethod.POST)
	public ModelAndView joinAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MemberDto dto = new MemberDto();
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		
		boolean checkId = memberDao.findById(id);

		if(checkId) {
			
			dto.setId(id);
			dto.setPassword(password);
			dto.setName(name);
			dto.setPhone(phone);
			dto.setGender(gender);
		
			memberDao.join(dto);
		
			return new ModelAndView("redirect:member_list.sf");
			}else {
				
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script language='javascript'>");
	            out.println("alert('아이디가 중복되었습니다.');");
	            out.println("</script>");
	            out.flush();

				return new ModelAndView("join");
			}
		}
	@RequestMapping(value="/grid_list.sf", method=RequestMethod.GET)
	protected ModelAndView gridlist(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		ModelAndView mav = new ModelAndView();
		
		List<MemberDto> list = memberDao.memberList();
		HashMap<String, Object> map = new HashMap<String, Object>();
		JSONObject obj = new JSONObject();
		
		map.put("list", list);
		obj.putAll(map);
		
		JSONArray jarray = (JSONArray)obj.get("list");
		/*JSONParser jparser = new JSONParser();
		jparser.
		*/
		mav.addObject("member_list", jarray);
		mav.setViewName("list");
		return mav;
	}
	
	@RequestMapping(value="/grid_update.sf", method=RequestMethod.GET)
	protected ModelAndView gridupdate(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		ModelAndView mav = new ModelAndView();
		MemberDto dto = new MemberDto();
		
		String name = request.getParameter("name");
		
		dto.setName(name);
		
		memberDao.join(dto);
		
		return new ModelAndView("redirect:grid_list.sf");
	}

}
