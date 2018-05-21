<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오늘의 메뉴</title>
</head>
<body>
	<div align="center">
		<h1> [ 오늘의 메뉴 추천  ] </h1>
		<p>
		<table border="1">
				<tr align="center">
					<td>${random_search}</td>
				<tr>
		</table>
		</p>
	</div>
</body>
</html>