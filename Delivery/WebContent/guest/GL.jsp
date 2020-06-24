<%@page import="mem.MemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dbm" class="mem.DBM"/>

<%
	String userID = request.getParameter("userID");
	MemDto dto = dbm.getData(userID);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" />
<title>Insert title here</title>
<script src="../js/script.js?ver=2"></script>
<script type="text/javascript">
window.onload = function(){
	document.getElementById("btnModify").onclick = memberModify;
	document.getElementById("btnModifyCancel").onclick = memberModifyCancel;
	document.getElementById("btnDelete").onclick = function(){
		memberDelete("<%=dto.getUserID()%>");
	}
}
/* window.onload = function BC() {
	script.println("location.href = 'RMain.html?userID=" + user.getUserID() + "'");
} */
</script>
</head>
<body>
<br>
<center>
	<table class="table">
	<tr>
		<td align="center" valign="middle">
			<form name="regForm" method="post" action="GE.jsp">
				<table border="1">
					<tr align="center" style="background-color: blue">
						<td colspan="2"><b style="color: white">회원 정보 수정</b></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="userName" size="15" value="<%=dto.getUserName() %>"></td>
					</tr>
					<tr>
						<td width="16%">아이디</td>
						<td width="57%">
							<%=dto.getUserID()%>
							<input type="hidden" name="userID" value="<%=dto.getUserID() %>" />
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="userPassword" size="15" value="<%=dto.getUserPassword() %>"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="userEmail" size="27" value="<%=dto.getUserEmail() %>"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="수정완료" id="btnModify" />
							&nbsp;&nbsp;
							<!-- <input type="button" value="수정취소" onclick="BC()" /> -->
							<input type="button" value="수정취소" id="btnModifyCancel" />
							<!-- <input type="button" value="회원탈퇴" id="btnDelete" /> -->
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
	</table>
</center>
</body>
</html>