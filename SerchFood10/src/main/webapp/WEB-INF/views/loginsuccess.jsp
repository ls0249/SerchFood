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
<form name="myform"  method="post">
로그인성공
아이디:<% out.println(session.getAttribute("userid")); %><br/>
<input type=button onclick="mysubmit(1)" value="로그아웃"/>
<input type=button onclick="mysubmit(2)" value="글목록보기"/>
</form>
<script>

function mysubmit(index){
	
	if(index==1){
		document.myform.action="member_logout.sf";
	}
	if(index==2){
		document.myform.action="board_list.sf";
	}
	  	document.myform.submit();
}

</script>




</body>
</html>