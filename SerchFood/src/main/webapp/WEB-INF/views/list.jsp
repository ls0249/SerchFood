<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가입자 리스트</title>
<a href="/member_join.bo">가입</a>
</head>
<body>
	<div align="center">
		<h1>가입자 리스트</h1>
		<p>
		<table border="1">
			<tr align="center">
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>성별</th>
			</tr>
			<c:forEach var="member_list" items="${member_list}">
				<tr align="center">
					<td>${member_list.id}</td>
					<td>${member_list.password}</td>
					<td>${member_list.name}</td>
					<td>${member_list.phone}</td>
					<td>${member_list.gender}</td>
				<tr>
			</c:forEach>
		</table>
		</p>
	</div>
</body>
</html>