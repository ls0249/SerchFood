<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>

	<div align="center">
		<h1>회원가입</h1>
		<p>
		<form action="member_join.bo" method="post">
		<table border="1">
				<tr align="center">
					<th>ID</th>
					<td><input type="text" name="id"/></td>
				</tr>
				<tr align="center">
					<th>비밀번호</th>
					<td><input type="password" name="password"/></td>
				</tr>
				<tr align="center">
					<th>이름</th>
					<td><input type="text" name="name"/></td>
				</tr>
				<tr align="center">
					<th>전화번호</th>
					<td><input type="text" name="phone"/></td>
				</tr>
				<tr align="center">
					<th>성별</th>
					<td>
						<select class="form-control" name="gender">
							<option value="남자">남자</option>
							<option value="여자">여자</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan=4 align="center">
						<input type="submit" value="회원가입"/>
					</td>
				</tr>
		</table>
		</form>
		</p>
	</div>

</body>
</html>