<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="net.sf.json.JSONObject" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="screen" href="/jun/resources/css/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="/jun/resources/css/ui.jqgrid.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="/jun/resources/css/ui.multiselect.css"/>

<script type="text/javascript" src="/jun/resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/jun/resources/js/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="/jun/resources/js/jquery.jqGrid.min.js"></script>

<%	String jdata = request.getAttribute("food").toString();
	System.out.print("###"+jdata);
%>
<script type="text/javascript"> 
        $(document).ready(function () {
        	var cnames = ['업체 카테고리', '업체명', '링크', '업체 설명', '전화번호', '업체 주소' , '업체 신주소'];
            $("#jqGrid").jqGrid({
                url:'/jun/main.sf',
                //mtype: "GET",
                datatype: "local",
                data: <%= jdata%>,
               jsonReader : {
            	     total: "total",
            	     page: "start",
            	     records: "display",
            	     repeatitems: false
            	   },
                colNames: cnames,
                colModel: [
                	{name: 'category', index: 'category', width: 100, align:"center" },
                	{name: 'title', index: 'title', width: 100 },
                    {name: 'link', index: 'link', width: 100 },
                    {name: 'description', index: 'description', width: 100 },
                    {name: 'telephone', index: 'telephone', width: 100 },
                    {name: 'address', index: 'category', width: 100},
                    {name: 'roadAddress', index: 'roadAddress', width: 100 }
                ],
                
                height: "auto",
                rowNum: 10,
                rowList:[10,20,30],
                rownumbers: true,
                viewrecords: true,
                gridview: true,
                pager: "#jqGridPager",
                loadError:function(xhr, status, error) {
                    alert(xhr);
      			 },
                caption:"SeeBar"
            });
            
        });
        
</script>

<title>검색 결과</title>
</head>
<body>
		<div class="row">
		<div>
			<table id="jqGrid"></table>
			<div id="jqGridPager"></div>
		</div>
	</div>

	<%-- <div align="center">
		<h1>검색 결과</h1>
		<p>
		<table border="1">
			<tr align="center">
				<th>검색 결과 수</th>
				<c:forEach items="items" var="food" >
					<th>${items.display}</th>
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
			
			<c:forEach items="${items}" var="food" >
					
				<tr align="center">
					<td>${food.category}</td>
					<td>${food.title}</td>
					<td>${food.link}</td>
					<td>${food.description}</td>
					<td>${food.telephone}</td>
					<td>${food.address}</td>
					<td>${food.roadAddress}</td>
					<td>${food.mapx}</td>
					<td>${food.mapy}</td>
				<tr>
			</c:forEach>
		</table>
		</p>
	</div> --%>
</body>
</html>