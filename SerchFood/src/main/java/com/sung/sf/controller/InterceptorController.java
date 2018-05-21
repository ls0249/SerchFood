package com.sung.sf.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sung.sf.dao.MemberDao;

@Controller
public class InterceptorController {

	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value="/inter_s.sf", method=RequestMethod.GET)
	public ModelAndView loginsuccess(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("loginsuccess");
		return mav;
		
	}
	
	@RequestMapping(value="/inter_f.sf", method=RequestMethod.GET)
	public ModelAndView loginfail(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("loginfail");
		return mav;
		
	}
}
