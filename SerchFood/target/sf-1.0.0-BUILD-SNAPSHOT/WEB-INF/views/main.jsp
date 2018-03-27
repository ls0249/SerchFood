<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인</title>
</head>

<script type="text/javascript">

	function random_win() { //크기 width400 height300 팝업창
		window.open("./randomSearch.sf", "메뉴랜덤추천", "width=400, height=300");
	}	

</script>

<body>
	<div align="center">
		<h1>음식을 검색하세요</h1>

		<input type="button" value="메뉴 랜덤 추천 " onclick="random_win()">

		<p>
		<form action="main.sf" action="search_list.sf" method="post">
			<table border="1">
				<tr align="center">
					<th>검색</th>
					<td><input type="text" name="category" /></td>
					<td colspan=4 align="center"><input type="submit" value="검색" />
					</td>
				</tr>
			</table>
		</form>
		</p>
	</div>
</body>
</html>