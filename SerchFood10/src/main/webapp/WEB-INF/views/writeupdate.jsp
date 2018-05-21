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
	
	
   <form name='myForm' method='post'>
   
   <%
   Date dNow = new Date( );
   SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
   %>
   <%-- <table border="1">
   <tr align="center">
   <th>날짜</th>
   <th>작성자</th>
   <th>제목</th>
   <th>내용</th>
   </tr>
   
   <tr align="center">
   <th><% out.println(ft.format(dNow)); %></th>
   <c:forEach var="board_num" items="${board_num}">
   <th>${board_num.user_auto}</th>
   <th>${board_num.title}</th>
   <th>${board_num.contents}<th>
   </c:forEach>
   </tr>
   
   </table> --%>
   날짜<input type="text" id="date" name="date" value= <% out.println(ft.format(dNow)); %>></input><br>
   <c:forEach var="board_num" items="${board_num}">
   번호<input type ="text" id="num" name="num" value="${board_num.seq}"></intput></br>
   작성자<input type="text" id="user" name="user" value="${board_num.user_auto}"></input><br>
   제목<input type="text" id="title" name="title" value="${board_num.title}"></input><br>
   내용<textarea name="content" id="contents" rows="4" cols="80" placeholder="${board_num.contents}"></textarea>
   </c:forEach>
   
   
 <!--  수정하기 버튼은 세션과 현재 아이디가 같을 때 생성 -->
   <%
   String sessionid = (String)session.getAttribute("userid");
   %>
   <c:set var="sessionid" value="<%=sessionid%>"></c:set>
   <% System.out.println(sessionid); %>
   
   <c:forEach var="board_num" items="${board_num}">
   <%-- <c:set var="id" value="${board_num.user_auto}"></c:set> --%>
   <c:if test ="${board_num.user_auto eq sessionid}">
 
  <input type="button" value="수정하기" onclick='mySubmit(1)' />
  <input type="button" value="삭제하기" onclick='mySubmit(2)' />

   </c:if>
   </c:forEach>
    
   </form>
   
   
   <script>
   function mySubmit(index) {
	    if (index == 1) {
	      document.myForm.action='board_update.sf';
	    }
	    if (index == 2) {
	      document.myForm.action='board_delete.sf';
	    }
	    document.myForm.submit();
	  }
   </script> 
   
   
   
   
   
   
   
   
   
   
   
</body>
</form>
</html>