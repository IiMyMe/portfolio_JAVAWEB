<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그아웃</title>
</head>
<body>
	<%
		session.invalidate();
	%>
	
	<script>
		location.href="Main.html";
	</script>
</body>
</html>