<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${ctx }/resource/js/jqgrid/css/ui.jqgrid.css"/>
<script type="text/javascript" src="<c:url value='/src/main/webapp/jqgrid/jquery.jqGrid.min.js'/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table id="list"></table>
	<form action="member_we.sf" method="post">
<script>
$funtion(){
	$("#list").jqgrid({
		url: "/member_list.sf",
		datatype:
	})	
}



</script>
</form>
</body>
</html>