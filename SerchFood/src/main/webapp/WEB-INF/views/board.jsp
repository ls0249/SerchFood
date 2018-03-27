<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판목록</title>

</head>
<body>
	<div align="center">
		<h1>게시물 리스트</h1>
		<p>
		<table border="1">
			<tr align="center">
				<th>번호</th>
				<th>날짜</th>
				<th>작성자</th>
				<th>제목</th>
				<th>내용</th>
			
			</tr>
			<c:forEach var="board_list" items="${board_list}">
				<tr align="center">
					<td>${board_list.seq}</td>
					<td>${board_list.date_auto}</td>
					<td>${board_list.user_auto}</td>
					<td>${board_list.title}</td>
					<td>${board_list.contents}</td>
				<tr>
			</c:forEach>
		</table>
		</p>
	</div>
<input type="button" name="boardwrite" id="boardwrite" value="글쓰기" Onclick="location.href='board_form.bo'"></input>
</body>
</html>