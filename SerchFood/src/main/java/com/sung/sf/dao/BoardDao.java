package com.sung.sf.dao;

import java.util.List;

import com.sung.sf.dto.BoardDto;

public interface BoardDao {
	
	//게시판 내용 출력문
	public void write(BoardDto dto);
	
	public List list();
	
	public List board_read(int seq);
	
	public void update(BoardDto dto);
	
	public void delete(BoardDto dto);
}
