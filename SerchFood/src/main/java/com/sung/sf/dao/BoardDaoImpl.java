package com.sung.sf.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.sung.sf.dto.BoardDto;
import com.sung.sf.util.SqlSessionLocator;

public class BoardDaoImpl implements BoardDao {
	SqlSession session = SqlSessionLocator.getSession();
//게시판 등록
	@Override
	public void write(BoardDto dto) {
		session.insert("board_write", dto);
		session.commit();
		
	}
//게시판 리스트
	@Override
	public List list() {
		List<BoardDto> list = new ArrayList<BoardDto>();
		list = session.selectList("board_list", list);
		return list;
	}
	
	
	
	//게시판 출력
	

	
}
