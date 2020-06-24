<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- id 세션 확인 -->
<c:set var="id" value="${sessionScope.idKey}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 로그인</title>
<script src="../js/script.js"></script>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById("btnLogin").onclick = funcLogin;
		document.getElementById("btnHome").onclick = funcHome;
	}

	function funcLogin() {
		if (loginForm.id.value === "") {
			alert("아이디 입력");
			loginForm.id.focus();
		} else if (loginForm.passwd.value === "") {
			alert("비밀번호 입력");
			loginForm.passwd.focus();
		} else {
			loginForm.action = "loginproc.jsp";
			loginForm.method = "post";
			loginForm.submit();
		}
	}

	function funcHome() {
		location.href = "guest_index.jsp";
	}
</script>
</head>
<body>

	<form name="loginForm">
		<table>
			<tr>
				<td colspan="2">** 사용자 로그인 **</td>
			</tr>
			<tr>
				<td>아이디 :</td>
				<td><input type="text" name="id" />
			</tr>
			<tr>
				<td>비밀번호 :</td>
				<td><input type="text" name="passwd" />
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="로 그 인"
					id="btnLogin" /> <input type="button" value="홈페이지" id="btnHome" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>