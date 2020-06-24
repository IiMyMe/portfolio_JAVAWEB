<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<jsp:useBean id="dbm" class="mem.DBM"/>
<% request.setCharacterEncoding("utf-8"); %>
<% String userID = request.getParameter("userID"); %>
<% boolean b = dbm.checkId(userID); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id 중복 검사</title>
</head>
<body>
<b><%=userID %></b>
<%
	if(b){
%>
		는(은) 이미  사용중인 아이디 입니다.<p/>
		<a href="#" onclick = "opener.document.regForm.userID.focus(); window.close();">닫기</a>
		<!-- opener : window.open으로 현재 창을 호출한 부모 페이지 -->
<%
	} else {
%>
		는(은) 사용 가능 합니다.<p/>
		<a href="#" onclick = "opener.document.regForm.userPassword.focus(); window.close();">닫기</a>
<%	} %>
</body>
</html>