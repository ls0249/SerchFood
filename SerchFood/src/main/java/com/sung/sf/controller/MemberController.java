package com.sung.sf.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sung.sf.dao.MemberDao;
import com.sung.sf.dto.MemberDto;

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
	//로그인폼
	@RequestMapping(value="/member_loginform.sf", method=RequestMethod.GET )
	public ModelAndView loginform(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
		
	}
	
	
	//로그인 처리
	/*@RequestMapping(value="/member_login.bo", method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		//db값 가져오기
		String user_id;
		String user_pw;
		
		user_id=memberDao.memberid("id");
		user_pw=memberDao.memberpw("pw");
		
		
		//파마미터값 가져오기
		String id =request.getParameter("id");
		String pw =request.getParameter("password");
		
		//값비교하기
		
		if(id.equals(user_id)&&pw.equals(user_pw)) {//입력값과 데이터값이 일치한다면
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("user_id", id);
			request.getSession().setAttribute("user_id", map);
			session.setAttribute("user_id", id);
			return new ModelAndView("redirect:loginsuccess");
		}else {
			return new ModelAndView("redirect:longinfail"); 
		}
	} */
	
	@RequestMapping(value="/member_login.sf", method=RequestMethod.POST)
	public ModelAndView loginActionform(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		String userId = request.getParameter("id");
		String userPw = request.getParameter("password");
		
	//	System.out.println((String)memberDao.memberid("id"));
		System.out.println(userId+userPw);
		
		boolean sign = memberDao.login(userId, userPw);
		if(sign) {
			session.setAttribute("userid",userId);
			return new ModelAndView("redirect:inter_s.sf");
		}else{
			return new ModelAndView("redirect:inter_f.sf");
		}
	}
	
	@RequestMapping(value="/member_logout.sf", method=RequestMethod.POST)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)	{
		session.invalidate();
		 return "redirect:/member_loginform.sf";
	}
	
	
	//회원가입
	@RequestMapping(value="/member_join.sf", method=RequestMethod.GET)
	public ModelAndView joinform(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("join");
		
		return mav;
	}
	
	
	@RequestMapping(value="/member_idcheck.sf", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String idcheck(HttpServletRequest request, HttpServletResponse response) {
		
		
		String id = request.getParameter("id");
		String getid =memberDao.findById(id);
		System.out.println(getid +id);
		return getid;
		}
	
	
	@RequestMapping(value="/member_emailcheck.sf",  method = {RequestMethod.GET, RequestMethod.POST},produces = "application/json")
	public boolean emailcheck(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
	int num = new Random().nextInt(100000)+1000;//난수생성
	System.out.println(num+"난수생성");
	
	String joinCode =String.valueOf(num);//String으로 변환하여 joinCode 생성
	System.out.println(joinCode+"조인코드");
	
	session.setAttribute("joinCode", joinCode);
	
	String title="회원가입 인증 코드입니다";
	System.out.println(title +"제목");
	
	StringBuilder sb = new StringBuilder(); 
	String text=joinCode;
	System.out.println(text +"내용");
	
	sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");
	System.out.println(sb.append("귀하의 인증 코드는 " + joinCode + " 입니다."));
	
	String email=request.getParameter("email");
	System.out.println(email +"받는이메일");
	
	return memberDao.send(title, sb.toString(), "rkswlxo1178@gmail.com", email);
	
	}
	
	@RequestMapping(value="/member_numbercheck.sf",  method = {RequestMethod.GET, RequestMethod.POST},produces = "application/json")
	public boolean numbercheck(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		//입력된 값
		boolean numbercheck_flag =false;
		String emailcheck=request.getParameter("emailcheck");
		if(((String)session.getAttribute("joinCode")).equals(emailcheck)) {
			numbercheck_flag=true;
		}
		System.out.println(numbercheck_flag);
		return numbercheck_flag;
	

	}
	@RequestMapping(value="/member_join.sf", method=RequestMethod.POST)
	public ModelAndView join(HttpServletRequest request, HttpServletResponse response) {
		
		MemberDto dto = new MemberDto();
		String name =request.getParameter("name");
		String jumin =request.getParameter("jumin");
		String  id =request.getParameter("id");
		String  pw =request.getParameter("pw");
		String  pw2 =request.getParameter("pw2");
		String email =request.getParameter("email");
		String adress =request.getParameter("road");
		String phone =request.getParameter("phone");
		String phone2 =request.getParameter("phone2");
		
		dto.setName(name);
		dto.setJumin(jumin);
		dto.setId(id);
		dto.setPw(pw);
		dto.setPw2(pw2);
		dto.setEmail(email);
		dto.setAdress(adress);
		dto.setPhone(phone);
		dto.setPhone2(phone2);
		
		memberDao.join(dto);
		
		ModelAndView mav =new ModelAndView("redirect:member_list.sf");
		return mav;
		
	}
	
}

/*	@RequestMapping(value="/member_join.bo", method=RequestMethod.POST)
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
 		*/
		/*@RequestMapping(value="/member_we.bo", method=RequestMethod.GET)
		protected ModelAndView jqgrid(HttpServletRequest request, HttpServletResponse response) throws Exception {	
	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("we");
		return mav;
		}	*/
	
		/*ModelAndView mav = new ModelAndView();
		mav.setViewName("join");
		return mav;*/
