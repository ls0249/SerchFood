package com.sung.sf.dao;

import org.apache.ibatis.session.SqlSession;

import com.sung.sf.dto.RatingDto;
import com.sung.sf.util.SqlSessionLocator;

public class RatingDaoImpl implements RatingDao {

	SqlSession session = SqlSessionLocator.getSession();
	
	public void starPoint(RatingDto dto) {
		session.insert("starpoint", dto);
		session.commit();
	}
	
}
