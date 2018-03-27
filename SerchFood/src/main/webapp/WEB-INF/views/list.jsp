<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="net.sf.json.JSONObject" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="/jun/resources/css/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="/jun/resources/css/ui.jqgrid.css"/>
<link rel="stylesheet" type="text/css" href="/jun/resources/css/ui.multiselect.css"/>

<script type="text/javascript" src="/jun/resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/jun/resources/js/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="/jun/resources/js/jquery.jqGrid.min.js"></script>
<%
	String jdata = request.getAttribute("member_list").toString();
	System.out.print("###"+jdata);
	
%>
<script type="text/javascript"> 
        $(document).ready(function () {
        	var cnames = ['아이디', '비밀번호', '이름', '전화번호', '성별'];
        	//var obj = JSON.parse(jdata);
            $("#jqGrid").jqGrid({
                url:'/jun/grid_list.sf',
                datatype: 'local',
                data: <%= jdata %>,
                /* jsonReader : {
            	     root: "member_list",
            	     page: 1,
            	     total: 1,
            	     //records: "records",
            	     repeatitems: false,
            	   }, */
                colNames: cnames,
                colModel: [
                	{name: 'id', index: 'id', width: 100, align:"center" },
                	{name: 'password', index: 'password', width: 100 },
                    {name: 'name', index: 'name', width: 100, editable:true },
                    {name: 'phone', index: 'phone', width: 100 },
                    {name: 'gender', index: 'gender', width: 100 }
                ],
                
                height: "auto",
                rowNum: 10,
                rowList:[10,20,30],
                pager: "#jqGridPager",
                rownumbers: true,
                viewrecords: true,
                gridview: true,
                loadError:function(xhr, status, error) {
                    alert(error);
      			 },
                caption:"MemberList",
                
                cellEdit:true,
                cellsubmit:'remote',
                cellurl:'/jun/grid_update.sf',
                beforeSubmitCell : function(rowid, cellname, value) {   // submit 전

                    return {"id":rowid, "cellName":cellname, "cellValue":value}

               },
               afterSubmitCell : function(res) {    // 변경 후
                   var aResult = $.parseJSON(res.responseText);
                   var userMsg = "";
                   if((aResult.msg == "success")) {
                       userMsg = "데이터가 변경되었습니다.";
                   }
                   return [(aResult.msg == "success") ? true : false, userMsg];
               }

            });
        });
        
</script>


<title>가입자 리스트</title>
<!-- <a href="/member_join.bo">가입</a> -->

</head>

<body>

	<div class="row">
		<div>
			<table id="jqGrid"></table>
			<div id="jqGridPager"></div>
		</div>
	</div>
	
	<%-- <div align="center">
		<h1>가입자 리스트</h1>
		<p>
		<table border="1">
			<tr align="center">
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>성별</th>
			</tr>
			<c:forEach var="member_list" items="${member_list}">
				<tr align="center">
					<td>${member_list.id}</td>
					<td>${member_list.password}</td>
					<td>${member_list.name}</td>
					<td>${member_list.phone}</td>
					<td>${member_list.gender}</td>
				<tr>
			</c:forEach>
		</table>
		</p>
	</div> --%>
	


</body>
</html>