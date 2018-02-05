package com.sung.sf.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sung.sf.dto.MemberDto;
import com.sung.sf.util.SqlSessionLocator;

public class MemberDaoImpl implements MemberDao {

	SqlSession session = SqlSessionLocator.getSession();
	
	
	public void join(MemberDto dto) {
		session.insert("member_join", dto);
		session.commit();
	}
	@Override
	public List memberList() {
		List<MemberDto> list = new ArrayList<MemberDto>();
		list = session.selectList("member_list");
		return list;
	}
	@Override
	public boolean findById(String id) {
		String findId = this.session.selectOne("member_findId",id);
		if(findId == null) {
			return true;
		}
		return false;
	}
	@Override
	public boolean login(String userId, String userPw) {
		String checkPw = this.session.selectOne("member_login", userId);
		if(checkPw == null) {
			return false;
		}else if(checkPw.equals(userPw)) {
			return true;
		}
		return false;
	}

}
