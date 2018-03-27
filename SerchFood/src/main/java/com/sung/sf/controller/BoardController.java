package com.sung.sf.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sung.sf.dao.BoardDao;
import com.sung.sf.dto.BoardDto;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDao Boarddao;
	
	//게시판 리스트
	@RequestMapping(value="/board_list.bo", method=RequestMethod.GET)
	public ModelAndView Boardlist(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView ();
		List<BoardDto> list = Boarddao.list();
		mav.addObject("board_list",list);
		mav.setViewName("board");
		return mav;
		
	}
	//게시판 글쓰는 폼
	@RequestMapping(value="/board_form.bo", method=RequestMethod.GET)
	public ModelAndView boardform(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("write");
		return mav;
		
	}
	//게시판 글쓰기고 저장하기
	@RequestMapping(value="/board_write.bo", method=RequestMethod.POST)
	public ModelAndView Boardwrite(HttpServletRequest request, HttpServletResponse response) {
		
		BoardDto dto = new BoardDto();
		
		String date_auto=request.getParameter("date");
		String user_auto=request.getParameter("user");
		String title =request.getParameter("title");
		String contents=request.getParameter("content");
		
		dto.setDate_auto(date_auto);
		dto.setUser_auto(user_auto);
		dto.setTitle(title);
		dto.setContents(contents);
		
		Boarddao.write(dto);
		
		ModelAndView mav = new ModelAndView("redirect:board_list.bo");
		return mav;
		
	}
	
}
