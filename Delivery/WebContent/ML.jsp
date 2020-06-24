<%@page import="mem.Mem"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dbm" class="mem.DBM" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<script src="../js/script.js?ver=0.2"></script>
</head>
<body>
	<table style="width: 80%">
		<tr style="background-color: rgb(220, 220, 220);">
			<th>아이디</th>
			<th>배송번호</th>
			<th>배송상태</th>
			<th>수정</th>
		</tr>
		<%
		ArrayList<Mem> list = dbm.getMemberAll();
			for(Mem mem : list) {
	%>
		<tr>
			<td><%=mem.getUserID() %></td>
			<%if(mem.getWaybillNumber()==null){ %>
			<td>주문하지 않음</td>
			<%}else{	%>
			<td><%=mem.getWaybillNumber() %></td>
			<%} %>
			<%if(mem.isDeliveryStatus()==true){	%>
			<td>배송 완료</td>
			<%}else{ %>
				<%if(mem.getWaybillNumber()==null){%>
				<td>주문하지 않음</td>
				<%} else {%>
				<td>배송전 또는 배송중</td>
				<%}%>
			<%}%>
			<td><a
				href="javascript:admin_modify_member('<%=mem.getUserID() %>')">수정</a></td>
		</tr>
		<%
		}
	%>
	</table>
	<input type="button" value="돌아가기" onclick="location.href='AMain.html'"/>
	<form action="MP.jsp" name="mp" method="post">
		<input type="hidden" name="id">
	</form>
</body>
</html>