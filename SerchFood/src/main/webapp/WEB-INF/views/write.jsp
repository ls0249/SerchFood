<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="board_write.sf" method="post">
	<%
   Date dNow = new Date( );
   SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
	%>
	날짜<input type="text" id="date" name="date" value= <% out.println(ft.format(dNow)); %>></input><br>
	작성자<input type="text" id="user" name="user" value=<% out.println(session.getAttribute("userid")); %>></input><br>
	제목<input type="text" id="title" name="title" placeholder="제목을 입력해주세요"></input><br>
	내용<textarea name="content" id="contents" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>

	<input type="submit" value="등록하기"></input>
	</form>









</body>
</html>