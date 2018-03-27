<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="board_write.bo" method="post">
	
	날짜<input type="text" id="date" name="date"></input><br>
	작성자<input type="text" id="user" name="user" ></input><br>
	제목<input type="text" id="title" name="title" placeholder="제목을 입력해주세요"></input><br>
	내용<textarea name="content" id="contents" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>

	<input type="submit" value="등록하기"></input>
	</form>









</body>
</html>