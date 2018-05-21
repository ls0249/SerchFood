<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가입자 리스트</title>
<a href="/member_join.sf">가입</a>
<a href="board_form.sf">글쓰기</a>
</head>
<body>
	<div align="center">
		<h1>가입자 리스트</h1>
		<p>
		<table border="1">
			<tr align="center">
				<th>번호</th>
				<th>이름</th>
				<th>주민등록번호</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>비밀번호 확인</th>
				<th>email</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>핸드폰번호</th>
				
			</tr>
			<c:forEach var="member_list" items="${member_list}">
				<tr align="center">
					<td>${member_list.seq}</td>
					<td>${member_list.name}</td>
					<td>${member_list.jumin}</td>
					<td>${member_list.id}</td>
					<td>${member_list.pw}</td>
					<td>${member_list.pw2}</td>
					<td>${member_list.email}</td>
					<td>${member_list.adress}</td>
					<td>${member_list.phone}</td>
					<td>${member_list.phone2}</td>
				<tr>
			</c:forEach>
		</table>
		</p>
	</div>
</body>
</html>