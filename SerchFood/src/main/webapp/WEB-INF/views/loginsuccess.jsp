<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>환영합니다</title>
</head>
<body>
<form action="/member_logout.bo"  method="post">
로그인성공
아이디:<% out.println(session.getAttribute("userid")); %><br/>
<input type=submit value="로그아웃"/>
</form>
</body>
</html>