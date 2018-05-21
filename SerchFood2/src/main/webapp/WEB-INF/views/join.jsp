<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap core CSS-->
  <link href="${pageContext.request.contextPath}/resources/vendor/login/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/resources/vendor/login/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/login/sb-admin.css" rel="stylesheet">

<script>
//주소찾기
$(function() { $("#postcodify_search_button").postcodifyPopUp(); });
//ajax로 자바 스크립트 처리
$(document).ready(function(){
	$("#id").keyup(function(event){
		if($("#id").val().length!=0){
			$.ajax({
				url :"./member_idcheck.sf",
				type: "post",
				data : { "id" : $("#id").val()}
			}).done(function(data){
				console.log(data);
				if(!data){ 	
					$("#msgid").text("사용이 가능합니다");
					$("#msgid").css("color","green");
					}
				else{
					$("#msgid").text("중복된 ID가 있습니다.");
					$("#msgid").css("color","red");
					}
				}); 
		}else{
			$("#msgid").text("ID를 입력하세요");
			$("#msgid").css("color","red");
		}
		
	});
	
//ajax로 비밀번호 유효성 검사
$("#pw").keyup(function(event){
	if(!$("#pw").val().match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)){
		$("#msgpw").text("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력해주세요.");
		$("#msgpw").css("color","red");
	} else if($("#pw").val().length<17 && $("#pw").val().length>7) {
		$("#msgpw").text("사용이 가능합니다");
		$("#msgpw").css("color","green");
	} else {
		$("#msgpw").text("비밀번호는 8~16자리를 입력해주세요");
		$("#msgpw").css("color","red");
		}
	});

$("#pw2").keyup(function(event){
	if($("#pw2").val() == $("#pw").val()) {
		$("#msgpw2").text("사용이 가능합니다");
		$("#msgpw2").css("color","green");
	} else {
		$("#msgpw2").text("비밀번호가 일치하지 않습니다");
		$("#msgpw2").css("color","red");
	}
});

$("#checkid").click(function(){
	$.ajax({
		type:"post",
		url:"./member_numbercheck.sf",
		data:{"emailcheck":$("#emailcheck").val()}
		}).done(function(data){
				check(data);
			});
});

});

function tossemail(){
	var e =$("#email").val()
	$.ajax({
		type:"post",
		url:"./member_emailcheck.sf",
		data:{email:$("#email").val()}
		}).done(function(data){
		});
	
};


function check(data){
	$.ajax({
		type:"get",
		url:"./member_numbercheck.sf",
		data:{"emailcheck":$("#emailcheck").val()},
		success:function(data) {
			console.log(data);
			if(data == true) {
				$("#msgemailck").text("인증되었습니다.");
				$("#msgemailck").css("color","green");
			}
			else {
				$("#msgemailck").text("인증번호가 다릅니다.");
				$("#msgemailck").css("color","red");
			}
		},
		error:function(error) {
			console.log(error);
		}
	});
	
		
};
		
</script>

<title>회원가입창</title>

</head>

<body class="bg-dark">
  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">밥먹고합시다 회원가입</div>
      <div class="card-body">
      
        <form action="member_join.sf"  method="post">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputName">아이디</label>
                <input class="form-control" id="id" name="id" type="text"  placeholder="아이디">
              </div>
              <div class="col-md-6">
              	<br> <span id="msgid"></span>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputPassword1">비밀번호</label>
                <input class="form-control" id="pw" name="pw" type="password" placeholder="Password">
              </div>
              <div class="col-md-6">
                <label for="exampleConfirmPassword">비밀번호 확인</label>
                <input class="form-control" id="pw2" name="pw2" type="password" placeholder="Confirm password">
                <span id="msgpw2"> </span>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputName">이름</label>
                <input class="form-control" name="name" type="text"  placeholder="이름">
              </div>
              <div class="col-md-6">
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputName">주민번호</label>
                <input class="form-control" name="jumin" type="text"  placeholder="주민번호">
              </div>
              <div class="col-md-6">
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputName">전화번호</label>
                <input class="form-control" name="phone" type="text"  placeholder="전화번호">
              </div>
              <div class="col-md-6">
              	<label for="exampleInputName">핸드폰번호</label>
                <input class="form-control" name="phone2" type="text"  placeholder="핸드폰번호">
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputName">주소</label>
                <input class="postcodify_address form-control" name="road" type="text"  placeholder="주소">
                <input class="postcodify_details form-control" type="text" name="detail" placeholder="상세주소">
                <input class="postcodify_extra_info form-control" type="hidden" name="Refer">
                <input class="postcodify_postcode5 form-control" type="hidden" name="addrnum">
              </div>
              <div class="col-md-6">
              	<br><br><br><input type="button" class="btn btn-secondary" id="postcodify_search_button" VALUE="주소찾기">
              </div>
            </div>
            </div>
          </div>
          
          <!-- <input type="text" name="addrnum" class="postcodify_postcode5 form-control" placeholder="우편번호" /><br />
			 <input type="text" name="road" class="postcodify_address form-control" placeholder="도로명주소" /><br />
			 <input type="text" name="Refer" class="postcodify_extra_info form-control" placeholder="참고항목" /><br />
			 <input type="text" name="detail" class="postcodify_details form-control" placeholder="상세주소" /><br /> -->
          
          
          <div class="form-group">
          	<div class="form-row">
          		<div class="col-md-6">
            		<label for="exampleInputEmail1">이메일</label>
            		<input class="form-control" id="email" name="email" type="email" placeholder="이메일">
            	</div>
            	<div class="col-md-6">
            		<br><input class="btn btn-secondary" type="button" name="emailcheckbutton" onClick="tossemail()" id="emailid" value="이메일 보내기"><br>
            	</div>
            </div>
          </div>
          <div class="form-group">
          	<div class="form-row">
          		<div class="col-md-6">
            		<input class="form-control" id="emailcheck" name="emailcheck" type="text" placeholder="인증번호">
            	</div>
            	<div class="col-md-6">
            		<input class="btn btn-secondary" type="button" name="numbercheck" id="checkid" value="인증번호 확인"> <span id="msgemailck"></span>
            	</div>
            </div>
          </div>
          
          <input class="btn btn-primary btn-block" type="submit" value="회원가입">
        </form>
        
        <div class="text-center">
          <a class="d-block small mt-3" href="./member_loginform.sf">로그인</a>
        </div>
      </div>
    </div>
  </div>

<!-- <form action="member_join.sf"  method="post">
    <table width="940" style="padding:5px 0 5px 0; ">
      <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
    
      <tr>
         <th> 이름</th>
         <td><input type="text" name="name"  ></td>
       
      </tr>
      
     
      <tr>
         <th>주민등록번호</th>
         <td><input type="text" name="jumin"> 
       
       </tr>
      
     
      
  
       <tr>
         <th>아이디</th>
         <td>
        	 <input id="id" name="id" type="text" > <span id="msgid"></span>
         </td>
      </tr>
      
      
       <tr>
         <th>비밀번호</th>
         <td><input type="password" name="pw" id="pw"> <span id="msgpw"></span>
       </tr>
       <tr>
         <th>비밀번호 확인</th>
         <td><input type="password" name="pw2" id="pw2"> <span id="msgpw2"> </span></td>
       </tr>
       
      	
        <tr>
          <th>이메일</th>
          <td>
             <input type="text" name="email" id="email" placeholder="이메일 주소를 적어주세요">
             <input type="button" name="emailcheckbutton" onClick="tossemail()" id="emailid" value="이메일 보내기"><br>
           	 <input type="text" name="emailcheck" id="emailcheck" placeholder="인증번호를 입력해주세요">
           	 <input type="button" name="numbercheck" id="checkid" value="인증번호 확인"> <span id="msgemailck"></span>
          </td>
        </tr>
        
        <tr>
           <th>주소</th>
           <td>
          
          	 <input type="text" name="addrnum" class="postcodify_postcode5 form-control" placeholder="우편번호" /><br />
			 <input type="text" name="road" class="postcodify_address form-control" placeholder="도로명주소" /><br />
			 <input type="text" name="Refer" class="postcodify_extra_info form-control" placeholder="참고항목" /><br />
			 <input type="text" name="detail" class="postcodify_details form-control" placeholder="상세주소" /><br />		
			 <input type="button" class="btn btn-secondary" id="postcodify_search_button" VALUE="주소찾기"> 
           </td>
         </tr>
         
         <tr>
         <th>전화번호</th>
           <td><input type="text" name="phone">
            
            </td>
        </tr>
        <tr>
          <th>핸드폰 번호</th>
           <td><input type="text" name="phone2">
          
           </td>
          </tr>
 
     
           <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
           <tr>
             <td colspan="2" align="center">
               <input type="submit" value="회원가입">
               <input type="reset" value="취소">
            </td>
           </tr>
           </table>
         
          </form> -->
          
  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/resources/vendor/login/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/resources/vendor/login/jquery-easing/jquery.easing.min.js"></script>
 </body>
</html>
