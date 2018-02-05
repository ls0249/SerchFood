package com.sung.sf.dao;

import java.util.List;

import com.sung.sf.dto.MemberDto;

public interface MemberDao {

	//가입자리스트 가져오기
	public List memberList();
	
	//로그인시 가입자 확인
	public boolean findById(String id);
	
	//로그인
	public boolean login(String userId, String userPw);
	
	//회원가입하기
	public void join(MemberDto dto);
	
}
