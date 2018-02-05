package com.sung.sf.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sung.sf.dao.MemberDao;
import com.sung.sf.dto.MemberDto;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDao memberDao;
	
	//가입자 리스트 확인
	@RequestMapping(value="/member_list.bo", method=RequestMethod.GET)
	protected ModelAndView listBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		
		ModelAndView mav = new ModelAndView();
		
		List<MemberDto> list = memberDao.memberList();
		
		mav.addObject("member_list", list);
		mav.setViewName("list");
		return mav;
	}
	//로그인
	@RequestMapping(value="/member_login.bo", method=RequestMethod.GET)
	public ModelAndView loginform(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("login");
		System.out.println("<<<<" + "로그인폼 진입" + ">>>>");
		
		return mav;
	}
	
	@RequestMapping(value="/member_login.bo", method=RequestMethod.POST)
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
	@RequestMapping(value="/member_join.bo", method=RequestMethod.GET)
	public ModelAndView joinform(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("join");
		
		return mav;
	}
	
	@RequestMapping(value="/member_join.bo", method=RequestMethod.POST)
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
		
			return new ModelAndView("redirect:member_list.bo");
			}else {
				
	            PrintWriter out = response.getWriter();
	            response.setContentType("text/html; charset=UTF-8");
	            out.println("<script language='javascript'>");
	            out.println("alert('아이디가 중복되었습니다.');");
	            out.println("</script>");
	            out.flush();

				return new ModelAndView("join");
			}
		}

}
