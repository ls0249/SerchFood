package com.sung.sf.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	//집에가자
	//게시판 리스트
	@RequestMapping(value="/board_list.sf", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView Boardlist(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView ();
		List<BoardDto> list = Boarddao.list();
		mav.addObject("board_list",list);
		mav.setViewName("board");
		return mav;
		
	}
	//게시판 글쓰는 폼
	@RequestMapping(value="/board_form.sf", method=RequestMethod.GET)
	public ModelAndView boardform(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("write");
		return mav;
		
	}
	//게시판 글쓰기고 저장하기
	@RequestMapping(value="/board_write.sf", method=RequestMethod.POST)
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
		
		ModelAndView mav = new ModelAndView("redirect:board_list.sf");
		return mav;
		
	}
	
	@RequestMapping(value="/board_updateform.sf", method=RequestMethod.GET)
	public ModelAndView Boardupdateform(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		
		BoardDto dto = new BoardDto();
		String num = request.getParameter("seq");
		//int sequnce = dto.getSeq();
		System.out.println(num);
		int seq= Integer.parseInt(num);
		System.out.println(seq);
		
		//Boarddao.board_read(seq);
		ModelAndView mav = new ModelAndView();
		List<BoardDto> list = Boarddao.board_read(seq);
		mav.addObject("board_num",list);
		mav.setViewName("writeupdate");
		
		
		
		return mav;
		
		
	}
	
	@RequestMapping(value="/board_update.sf", method=RequestMethod.POST)
	public ModelAndView Boardupdate(HttpServletRequest request, HttpServletResponse response) {
		
		BoardDto dto = new BoardDto();
		
		String num = request.getParameter("num");
	
		int seq= Integer.parseInt(num);
		String title =request.getParameter("title");
		String contents=request.getParameter("content");
		
		dto.setSeq(seq);
		dto.setTitle(title);
		dto.setContents(contents);
		
		Boarddao.update(dto);
		
		ModelAndView mav = new ModelAndView("redirect:board_list.sf");
		return mav;
		
	}
	
	@RequestMapping(value="/board_delete.sf", method=RequestMethod.POST)
	public ModelAndView Boarddelete(HttpServletRequest request, HttpServletResponse response) {
		
		BoardDto dto = new BoardDto();
		
		String num = request.getParameter("num");
		int seq= Integer.parseInt(num);
		dto.setSeq(seq);
		System.out.println("삭제부분" + seq);
		Boarddao.delete(dto);
		
		ModelAndView mav = new ModelAndView("redirect:board_list.sf");
		return mav;
	
	}
}
