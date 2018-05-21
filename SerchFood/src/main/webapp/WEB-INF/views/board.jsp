<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>  
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
				<th>상세보기</th>
			
			</tr>
			
			<c:forEach var="board_list" items="${board_list}">
				<tr align="center">
					<td>${board_list.seq}</td>
					<td>${board_list.date_auto}</td>
					<td>${board_list.user_auto}</td>
					<td>${board_list.title}</a></td>
					<td>${board_list.contents}</td>
					<td><a href="board_updateform.sf?seq=${board_list.seq}">상세보기</td>
					<!-- <td><input type="button" name="boardupdate" id="boardupdate" value="상세보기" Onclick="ssesionid()"></input></td>
 -->
					<%-- <script>
					function ssesionid(){
					var user_id = "<%=(String)session.getAttribute("userid")%>"
					var board_id ="${board_list.user_auto}"
					var list_seq="${board_list.seq}"
					if(user_id == board_id){
						location.href="board_updateform.sf"
						}
					
					else{
						alert('아이디가 다릅니다.');
						location.href="board_list.sf";

						}
					}
					</script>		 --%>
			</c:forEach>
		
		
		
		</table>
		</p>
		
	</div>
<input type="button" name="boardwrite" id="boardwrite" value="글쓰기" Onclick="location.href='board_form.sf'"></input>
	

















</body>

</html>