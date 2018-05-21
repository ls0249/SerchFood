<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="net.sf.json.JSONObject" %>

<%
	int blockBegin=((Integer)request.getAttribute("blockBegin")).intValue();	// pageBlock의 시작값
	int blockEnd=((Integer)request.getAttribute("blockEnd")).intValue();		// pageBlock의 마지막값
	int nowpage=((Integer)request.getAttribute("page")).intValue();				// 현재 page값
	int endpage=((Integer)request.getAttribute("endPage")).intValue();			// 마지막 page값
	String category = ((String)request.getAttribute("category")).toString();	// 검색 category값
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
    <meta name="author" content="">
    
    <link rel="stylesheet" type="text/css" media="screen" href="/jun/resources/css/jquery-ui.css"/>
	<link rel="stylesheet" type="text/css" media="screen" href="/jun/resources/css/ui.jqgrid.css"/>
	<link rel="stylesheet" type="text/css" media="screen" href="/jun/resources/css/ui.multiselect.css"/>
	
	<script type="text/javascript" src="/jun/resources/js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="/jun/resources/js/i18n/grid.locale-kr.js"></script>
	<script type="text/javascript" src="/jun/resources/js/jquery.jqGrid.min.js"></script>
    
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/3-col-portfolio.css" rel="stylesheet">

	
	<title>검색 결과</title>
	
</head>
<body>
<!-- Navigation -->
	<c:if test="${empty userid}">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="main.sf">밥먹고 합시다</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="main.sf">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    </c:if>
    
    <c:if test="${!empty userid}">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="main.sf">밥먹고 합시다</a>
        
        <p style=colro:white;>${userid} 님 환영합니다.</p>
        
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="main.sf">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    </c:if>
    
    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading -->
      <br><br><br>
        <h4><li>총 ${search.total}개의 검색결과가 있습니다.</li></h4>
      <br>
      <div class="row">
		<c:forEach items="${search.items}" var="food" begin="0" end="${search.display}">
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="./search_detail.sf?category=${food.title}&blogCategory=<%=category %>&mapx=${food.mapx}&mapy=${food.mapy}">${food.title}</a>
              </h4>
              <p style=color:black; class="card-text">${food.description}</p>
              <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
            </div>
          </div>
        </div>
        </c:forEach>
      </div> 
      <!-- /.row -->
      
      <!-- Pagination -->
      
      <ul class="pagination justify-content-center">
        <li class="page-item">
        <%if(nowpage == 1) {%>
       		<a class="page-link" onclick="alert('첫 번쨰 페이지 입니다.');" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        <%} else { %>
          <a class="page-link" href="./search_list.sf?category=<%=category %>&page=<%= nowpage-1 %>&start=<%=((nowpage-1)*10)-9%>" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
         <%} %>
        </li>
        
        <%for(int i = blockBegin; i <= blockEnd; i++){ %>
        <li class="page-item">
        		<%if(i==nowpage){ %>
          		<a class="page-link" href="./search_list.sf?category=<%=category %>&page=<%= i %>&start=<%=(i*10)-9%>"><%= i %></a>
          		<%}else{ %>
				<a class="page-link" href="./search_list.sf?category=<%=category %>&page=<%= i %>&start=<%=(i*10)-9%>"><%= i %></a>
				<%} %>
        </li>
        <%} %>
		
		<%if(nowpage >= endpage) {%>
		<li class="page-item">
          <a class="page-link" onclick="alert('마지막 페이지 입니다.');" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>	
		<%}else { %>
        <li class="page-item">
          <a class="page-link" href="./search_list.sf?category=<%=category %>&page=<%= nowpage+1 %>&start=<%=((nowpage+1)*10)-9%>" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
        <%} %>
      </ul>
      	
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; 밥먹고합시다</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
  </body>
  	
</html>