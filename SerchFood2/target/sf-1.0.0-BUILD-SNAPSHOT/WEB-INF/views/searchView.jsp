<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색 결과</title>
</head>
<body>
	<div align="center">
		<h1>검색 결과</h1>
		<p>
		<table border="1">
			<tr align="center">
				<th>검색 결과 수</th>
				<c:forEach var="search_list" items="${search_list}">
					<th>${search_list.display}</th>
				</c:forEach>
			</tr>
			
			
			<tr align="center">
				
				<th>업체 카테고리</th>
				<th>업체명</th>
				<th>업체 바로가기</th>
				<th>업체 설명</th>
				<th>전화번호</th>
				<th>업체 주소</th>
				<th>업체 신주소</th>
				<th>좌표x</th>
				<th>좌표y</th>
				
			</tr>
			
			<c:forEach var="search_list" items="${search_list}">
					
				<tr align="center">
					
					<td>${search_list.category}</td>
					<td>${search_list.title}</td>
					<td>${search_list.link}</td>
					<td>${search_list.description}</td>
					<td>${search_list.telephone}</td>
					<td>${search_list.address}</td>
					<td>${search_list.roadaddress}</td>
					<td>${search_list.mapx}</td>
					<td>${search_list.mapy}</td>
				<tr>
			</c:forEach>
		</table>
		</p>
	</div>
</body>
</html>