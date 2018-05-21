package com.sung.sf.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sung.sf.dto.SearchDto;
import com.sung.sf.util.SqlSessionLocator;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Repository
public class SearchDaoImpl implements SearchDao {
	
	SqlSession session = SqlSessionLocator.getSession();
	
	//검색된 값을 리스트로 출력
	@Override
	public List searchList(String searchCategory) {
		List<SearchDto> list = new ArrayList<SearchDto>();
		list = session.selectList("search_list", searchCategory);
		return list;
	}
	
	//검색값이 DB에 저장되어 있는지 확인
	@Override
	public boolean search(String searchCategory) {
		List<SearchDto> searchmenu = new ArrayList<SearchDto>();
		searchmenu = session.selectList("search_food", searchCategory);
		
		
		if(searchmenu.isEmpty()) {		//리스트에 값이 담기지 않으면
			return false;
		}
		return true;					//리스트에 값이 있다면
	}
	
	//랜덤 메뉴 추천
	@Override
	public String randomSearch() {
		String randomfood = this.session.selectOne("random_search");
		return randomfood;
	}
	
}