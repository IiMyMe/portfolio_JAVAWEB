<%@page import="mem.MemDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dbm" class="mem.DBM" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" />
<title>배송목록</title>
<script src="../js/script.js?ver=0.2"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">

<style type="text/css">
#button {
	width: 125px;
	height: 30px;
	padding: 8px;
	margin-left: 0%;
	background-color: blue;
	color: white;
	border-radius: 15px;
}

table {
	width: 100%;
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid black;
	padding: 5px;
}

#title {
	background-color: blue;
	color: white;
}
</style>
</head>
<body>
	<table>
		<tr id="title">
			<th>이름</th>
			<th>아이디</th>
			<th>이메일</th>
			<th>운송장번호</th>
			<th>배송상태</th>
			<th>수정</th>
		</tr>
		<%
			ArrayList<MemDto> list = dbm.getGuestAll();
			for (MemDto mem : list) {
		%>
		<tr>
			<td><%=mem.getUserName()%></td>
			<td><%=mem.getUserID()%></td>
			<td><%=mem.getUserEmail()%></td>
			<%
				if (mem.getWaybillNumber() == null || mem.getWaybillNumber().equals("null")) {
				%>
				<td>주문하지 않음</td>
				<%
					} else {
				%>
				<td><%=mem.getWaybillNumber()%></td>
				<%
					}
				%>
			<%
				if (mem.isDeliveryStatus() == true) {
			%>
			<td>배송 완료</td>
			<%
				} else {
			%>
			<%
				if (mem.getWaybillNumber() == null || mem.getWaybillNumber().equals("null")) {
			%>
			<td>주문하지 않음</td>
			<%
				} else {
			%>
			<td>배송전 또는 배송중</td>
			<%
				}
			%>
			<%
				}
			%>
			<td><a
				href="javascript:courier_modify_member('<%=mem.getUserID()%>')">수정</a></td>
		</tr>
		<%
			}
		%>
	</table>
	<input type="button" id="button" value="돌아가기"
		onclick="location.href='CMain.html'" />
	<form action="EDI.jsp" name="modifyFrm" method="post">
		<input type="hidden" name="userID">
	</form>
</body>
</html>