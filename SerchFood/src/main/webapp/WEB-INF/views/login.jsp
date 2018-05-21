<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>로그인</title>

<!-- Bootstrap core CSS-->
  <link href="${pageContext.request.contextPath}/resources/vendor/login/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/resources/vendor/login/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/login/sb-admin.css" rel="stylesheet">
  
</head>
<body class="bg-dark">

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Login</div>
      <div class="card-body">
        <form action="member_login.sf" method="post">
          <div class="form-group">
            <label for="exampleInputEmail1">ID</label>
            <input class="form-control" id="exampleInputEmail1" type="text" name="id" aria-describedby="emailHelp" placeholder="Enter email">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input class="form-control" id="exampleInputPassword1" type="password" name="password" placeholder="Password">
          </div>
          
          <input type="submit" class="btn btn-primary btn-block" value="로그인"/>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="./member_join.sf">회원가입</a>
        </div>
      </div>
    </div>
  </div>

	
<!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/resources/vendor/login/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/login/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/resources/vendor/login/jquery-easing/jquery.easing.min.js"></script>
</body>
</html>