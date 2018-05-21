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
	@Override
	public List board_read(int seq) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		list=session.selectList("board_num", seq);
		return list;
	}
	@Override
	public void update(BoardDto dto) {
		session.update("borad_update", dto);
		session.commit();
	}
	@Override
	public void delete(BoardDto dto) {
		session.delete("board_delete", dto);
		session.commit();
	}
	
	
	
	//게시판 출력
	

	
}
