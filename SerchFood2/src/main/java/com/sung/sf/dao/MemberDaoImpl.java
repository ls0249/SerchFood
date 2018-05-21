package com.sung.sf.dao;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.sung.sf.dto.MemberDto;
import com.sung.sf.util.SqlSessionLocator;

public class MemberDaoImpl implements MemberDao {
	SqlSession session = SqlSessionLocator.getSession();
	//메이븐에 라이브러리를 추가해서 객체 생성
	private JavaMailSender javaMailSender;
	@Autowired
	 public void setJavaMailSender(JavaMailSender javaMailSender) {
	    this.javaMailSender = javaMailSender;
	}
	

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
	/*@Override
	public boolean findById(String id) {
		String findId = this.session.selectOne("member_findId",id);
		if(findId == null) {
			return true;
		}
		return false;
	}*/
	
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
	
	@Override
	public String findById(String id) {
		String idcheck = this.session.selectOne("member_findId", id);
		return idcheck;
	}
	
	//메일을 보내는 메소드
	@Override
	public boolean send(String title, String text, String from, String to) {
		//title:제목
		//text:내용 여기에 이메일 인증 코드가 들어가야지
		//from:보내는 메일 주소
		//to:받는 메일 주소
		
	
		//MimeMessage javamail에 있는 타입 , 보내는 사람, 받는 사람, 제목, 내용과 같이 메일과 관련된 내용을 지정
		//createMimeMessage MimeMessage의 객체를 생성
		try {
			MimeMessage message = javaMailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");	
		//내용을 보낸다
			helper.setSubject(title);
			helper.setText(text,true);
			helper.setFrom(from);
			helper.setTo(to);
		
		//helper에 다 담았다.
		
		//보내기
			javaMailSender.send(message);
			return true;
		}catch(MessagingException e){
			System.out.println(e);
			e.printStackTrace();
			return false;
		}
			
	}


	@Override
	public String memberid(String id) {
		String memberid =session.selectOne(id);
		return memberid;
	}


	@Override
	public String memberpw(String pw) {
		String memberpw = session.selectOne(pw);
		return memberpw;
	}
	
}
