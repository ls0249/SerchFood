package com.sung.sf.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sung.sf.dao.RatingDao;
import com.sung.sf.dto.RatingDto;

@Controller
public class RatingController {
	
	@Autowired
	RatingDao dao;

	@RequestMapping(value = "/starPoint.sf", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView starPointRating(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		RatingDto dto = new RatingDto();
		
		float starpoint = Float.parseFloat(request.getParameter("starPoint"));
		String title = request.getParameter("title");
		String userid = (String) session.getAttribute("userid");
		System.out.println("별점은?" + starpoint);
		System.out.println("음식점명은? " + title);
		System.out.println("id? " + userid);
		
		dto.setCategory(title);
		dto.setTitle(title);
		dto.setUserid(userid);
		dto.setStarpoint(starpoint);
		
		dao.starPoint(dto);
		
		return mav;
	}
}
