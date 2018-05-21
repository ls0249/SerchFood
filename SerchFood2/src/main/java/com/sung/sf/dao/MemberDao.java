package com.sung.sf.dao;

import java.util.List;

import com.sung.sf.dto.MemberDto;

public interface MemberDao {

	//가입자리스트 가져오기
	public List memberList();
	
	//로그인시 가입자 확인
	public String findById(String id);
	
	//로그인
	public boolean login(String userId, String userPw);
	
	//회원가입하기
	public void join(MemberDto dto);
	
	//이메일 체크시 보내는 것 들
	public boolean send(String title, String text, String from, String to);
	
	public String memberid(String id);
	
	public String memberpw(String pw);
	
	//title:제목
	//text:내용 여기에 이메일 인증 코드가 들어가야지
	//from:보내는 메일 주소
	//to:받는 메일 주소
	//filePath:첨부 파일 경로 없으면 null
	
	
	
}
