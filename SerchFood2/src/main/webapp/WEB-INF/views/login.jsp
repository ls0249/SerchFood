<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script>
//로그인 처리하기 









</script>





<title>로그인</title>
</head>
<body>
	<div align="center">
		<h1>로그인</h1>
		<p>
		<form action="member_login.sf" method="post">
		<table border="1">
				<tr align="center">
					<th>ID</th>
					<td><input type="text" name="id"/></td>
				</tr>
				<tr align="center">
					<th>비밀번호</th>
					<td><input type="password" name="password"/></td>
				</tr>
				<tr>
					<td colspan=4 align="center">
						<input type="submit" value="로그인"/>
						<input type="button" value="회원가입" onClick="location.href='member_join.sf'"/>
						
					</td>
				</tr>
		</table>
		</form>
		</p>
	</div>

</body>
</html>