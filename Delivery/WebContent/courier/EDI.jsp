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
	document.getElementById("btnModify").onclick = courier_modify_member_action;
	document.getElementById("btnModifyCancel").onclick = courier_modify_member_cancel;
}
</script>
</head>
<body>
<br>
<center>
	<table class="table">
	<tr>
		<td align="center" valign="middle">
			<form name="modifyFormAdmin" method="post" action=ED.jsp>
				<table border="1">
					<tr align="center" style="background-color: blue">
						<td colspan="2"><b style="color: white"><%=dto.getUserName() %>님의 정보 수정</b></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><%=dto.getUserName() %></td>
					</tr>
					<tr>
						<td width="16%">아이디</td>
						<td width="57%">
							<%=dto.getUserID()%>
							<input type="hidden" name="userID" value="<%=dto.getUserID() %>" />
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><%=dto.getUserEmail() %></td>
					</tr>
					<tr>
						<td>운송장번호</td>
						<td><input type="text" name="waybillNumber" size="20" value="<%=dto.getWaybillNumber() %>"></td>
					</tr>
					<tr>
						<td>배송상태</td>
						<td>
							<input type="radio" name="deliveryStatus" value="false"><%="배송중 또는 배송전" %> 
							<input type="radio" name="deliveryStatus" value="true"><%="배송완료" %> 
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="수정완료" id="btnModify" />
							&nbsp;&nbsp;
							<input type="button" value="수정취소" id="btnModifyCancel" />
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