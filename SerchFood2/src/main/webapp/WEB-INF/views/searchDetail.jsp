<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="net.sf.json.JSONObject" %>
<%  int blockBegin=((Integer)request.getAttribute("blockBegin")).intValue();		// pageBlock의 시작값
	int blockEnd=((Integer)request.getAttribute("blockEnd")).intValue();			// pageBlock의 마지막값
	int nowpage=((Integer)request.getAttribute("page")).intValue();					// 현재 page값
	int endpage=((Integer)request.getAttribute("endPage")).intValue();				// 마지막 page값
	int display=((Integer)request.getAttribute("display")).intValue();				// 블로그 리스트를 나타낼 display값 
	int mapx = (Integer)request.getAttribute("mapx"); 								//
	int mapy = (Integer)request.getAttribute("mapy");								// 검색 category의 detail을 보여주기 위한 mapx, mapy값
	String category = ((String)request.getAttribute("category")).toString();		// 검색 category값 
	String blogCategory = ((String)request.getAttribute("blogCategory")).toString();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- 스타일 -->
    <link href="../assets/css/bootstrap-ko.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 20px;
        padding-bottom: 40px;
      }

      /* 전체 내용을 감쌈 */
      .container-narrow {
        margin: 0 auto;
        max-width: 700px;
      }
      .container-narrow > hr {
        margin: 30px 0;
      }

      /* 핵심 마케팅 문구와 가입 버튼 */
      .jumbotron {
        margin: 60px 0;
        text-align: center;
      }
      .jumbotron h1 {
        font-size: 72px;
        line-height: 1;
      }
      .jumbotron .btn {
        font-size: 21px;
        padding: 14px 24px;
      }

      /* 부수적인 마케팅 내용 */
      .marketing {
        margin: 60px 0;
      }
      .marketing p + h4 {
        margin-top: 28px;
      }
    </style>
    <!-- <link href="../assets/css/bootstrap-responsive.css" rel="stylesheet"> -->

    <!-- IE6~8에서 HTML5 태그를 지원하기위한 HTML5 shim -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

    <!-- 파비콘과 앱 아이콘 -->
    <!-- <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="../assets/ico/favicon.png"> -->
    
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/3-col-portfolio.css" rel="stylesheet">
    
    <!-- StarPoint CSS -->
    <link rel="stylesheet" type="text/css" media="screen" href="/jun/resources/css/star.css"/>
    
  </head>

  <body>

    <div class="container-narrow">

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
        
        <p style=color:white;>${userid} 님 환영합니다.</p>
        
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
      <hr>

      <div class="jumbotron">
        <h1>대단하고 어마어마한 마케팅 문구!</h1>
        <p class="lead">그리스의 천문학자. 알렉산드리아 도서관에서 일했으며, 세계에서 제일 먼저 지동설을 믿은 사람으로 전해지고 있다. 또한 기하학을 응용하여 태양이나 달의 크기를 처음으로 계산하였다.</p>
      </div>

      <hr>
      <c:set var="mapx" value='<%=mapx%>' />
      <c:set var="mapy" value='<%=mapy%>' />
      
      <div class="row-fluid marketing">
      <c:forEach items="${searchResult}" var="result">
      <c:if test="${result.mapx eq mapx && result.mapy eq mapy}">
        <div class="span6">
          <h1>${result.title}</h1><br><br>
          <li>카테고리 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${result.category}</li><br>
          <li>주소(구)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${result.address}</li><br>
          <li>도로명주소<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${result.roadAddress}</li><br>
          <address><li>전화번호<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${result.telephone}</li></address>
        </div>
        </c:if>
	  </c:forEach>
      <hr>
      
      <strong><h3>평점</h3></strong><br>
      <div class="row">
      	<div class="starRev">
  			<span class="starR1 on" id="starL1">별1_왼쪽</span>
  			<span class="starR2" id="starR1">별1_오른쪽</span>
  			<span class="starR1" id="starL2">별2_왼쪽</span>
  			<span class="starR2" id="starR2">별2_오른쪽</span>
  			<span class="starR1" id="starL3">별3_왼쪽</span>
  			<span class="starR2" id="starR3">별3_오른쪽</span>
  			<span class="starR1" id="starL4">별4_왼쪽</span>
  			<span class="starR2" id="starR4">별4_오른쪽</span>
  			<span class="starR1" id="starL5">별5_왼쪽</span>
  			<span class="starR2" id="starR5">별5_오른쪽</span>
		</div>
	</div>
      <hr>
      
      <strong><h3>다른 주변 식당</h3></strong><br>
      <div class="row">
		<c:forEach items="${menuResult}" var="menu">
		<c:if test="${menu.mapx > mapx-500 && menu.mapx < mapx+500 && menu.mapy > mapy-500 && menu.mapy < mapy+500 && menu.mapx ne mapx}">
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="./search_detail.sf?category=${menu.title}&blogCategory=<%=blogCategory %>&mapx=${menu.mapx}&mapy=${menu.mapy}">${menu.title}</a>
              </h4>
              <p class="card-text">${menu.description}</p>
            </div>
          </div>
        </div>
        </c:if>
        </c:forEach>
      </div> 
      <hr>
      <!-- /.row -->
      
      
      <div class="row-fluid marketing">
      <strong><h3>추천 블로그</h3></strong><br>
      <c:forEach items="${blogResult}" var="result">
      <c:if test="${result eq null}">
      	추천 블로그가 없습니다.
      </c:if>
        <div class="span6">
        	<table border = "0">
        	<tr>
        		<td style = font-size:20px;><a href="${result.link}">${result.title}</a></td>
            	<td rowspan="2" style="width:190px; border-left:1px solid gray; text-align:left"> 
            		&nbsp;Date : ${result.postdate}<br><br>
            		&nbsp;Link : 네이버 블로그<br><br>
            		&nbsp;By : <a href="${result.bloggerlink}">${result.bloggername}</a> </td>
        	</tr>
        	<tr>
        		<td><br><dd>${result.description}</dd></td><hr>
        	</tr>
    		</table>
        </div>
	  </c:forEach>
      <hr>

    </div> <!-- /container -->
    
    <!-- Pagination -->
      
      <ul class="pagination justify-content-center">
        <li class="page-item">
        <%if(nowpage == 1) {%>
       		<a class="page-link" onclick="alert('첫 번쨰 페이지 입니다.');" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        <%} else { %>
          <a class="page-link" href="./search_detail.sf?category=<%=category %>&blogCategory=<%=blogCategory %>&page=<%= nowpage-1 %>&start=<%=((nowpage-1)*10)-9%>&mapx=<%=mapx%>&mapy=<%=mapy%>" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
         <%} %>
        </li>
        
        <%for(int i = blockBegin; i <= blockEnd; i++){ %>
        <li class="page-item">
        		<%if(i==nowpage){ %>
          		<a class="page-link" href="./search_detail.sf?category=<%=category %>&blogCategory=<%=blogCategory %>&page=<%= i %>&start=<%=(i*10)-9%>&mapx=<%=mapx%>&mapy=<%=mapy%>"><%= i %></a>

          		<%}else{ %>
				<a class="page-link" href="./search_detail.sf?category=<%=category %>&blogCategory=<%=blogCategory %>&page=<%= i %>&start=<%=(i*10)-9%>&mapx=<%=mapx%>&mapy=<%=mapy%>"><%= i %></a>
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
          <a class="page-link" href="./search_detail.sf?category=<%=category %>&blogCategory=<%=blogCategory %>&page=<%= nowpage+1 %>&start=<%=((nowpage+1)*10)-9%>&mapx=<%=mapx%>&mapy=<%=mapy%>" aria-label="Next">
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
    <!-- Star -->
	<script>
	$('.starRev span').click(function(){
		 $(this).parent().children('span').removeClass('on');
		 var up = $(this).addClass('on').prevAll('span').addClass('on');
		 var title ='<%=category%>'
		 
		   checkStar(up, title);
		 
		  return false;
		});
	</script>
	
	<script>
	function checkStar(up, title){
		console.log(up.index());
		var starPoint = 0.5;
		
		if(up.index() == -1) starPoint = starPoint; 
		else if(up.index() == 0) starPoint=starPoint*(up.index()+2);
		else if(up.index() == 1) starPoint=starPoint*(up.index()+2);
		else if(up.index() == 2) starPoint=starPoint*(up.index()+2);
		else if(up.index() == 3) starPoint=starPoint*(up.index()+2);
		else if(up.index() == 4) starPoint=starPoint*(up.index()+2);
		else if(up.index() == 5) starPoint=starPoint*(up.index()+2);
		else if(up.index() == 6) starPoint=starPoint*(up.index()+2);
		else if(up.index() == 7) starPoint=starPoint*(up.index()+2);
		else if(up.index() == 8) starPoint=starPoint*(up.index()+2);
		console.log(starPoint);
		
		
		var param = {"starPoint":starPoint, "title":title};
		
		$.ajax({
			type:"post",
			url:"./starPoint.sf",
			data:param
			}).done(function(data){
				});
	};
	</script>
	
    <!-- 자바스크립트
    ================================================== -->
    <!-- 페이지를 빨리 읽어들이도록 문서 마지막에 배치 -->
    <!-- <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/bootstrap-transition.js"></script>
    <script src="../assets/js/bootstrap-alert.js"></script>
    <script src="../assets/js/bootstrap-modal.js"></script>
    <script src="../assets/js/bootstrap-dropdown.js"></script>
    <script src="../assets/js/bootstrap-scrollspy.js"></script>
    <script src="../assets/js/bootstrap-tab.js"></script>
    <script src="../assets/js/bootstrap-tooltip.js"></script>
    <script src="../assets/js/bootstrap-popover.js"></script>
    <script src="../assets/js/bootstrap-button.js"></script>
    <script src="../assets/js/bootstrap-collapse.js"></script>
    <script src="../assets/js/bootstrap-carousel.js"></script>
    <script src="../assets/js/bootstrap-typeahead.js"></script> -->

  </body>
</html>