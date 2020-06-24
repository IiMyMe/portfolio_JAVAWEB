<%@page import="mem.Mem"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="membermanager" class="mem.DBM"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 회원관리</title>
<script src="../js/script.js?ver=0.2"></script>
</head>
<body>
	<table style="width: 80%">
		<tr style="background-color: rgb(220, 220, 220);">
			<th>아이디</th><th>회원명</th><th>이메일</th><th>전화</th><th>수정</th>
		</tr>
	<%
		ArrayList<Mem> list = membermanager.getMemberAll();
		for(Mem mem : list){
	%>
			<tr>
				<td><%=mem.getUserID() %></td>
				<td><%=mem.getUserPassword() %></td>
				<td><%=mem.getWaybillNumber() %></td>
				<td><%=mem.isDeliveryStatus() %></td>
				<td><a href="javascript:admin_modify_member('<%=mem.getUserID() %>')">수정</a></td>
			</tr>
	<%
		}
	%>
	</table>	
	
	<form action="member_modify_admin_form.jsp" name="modifyFrm" method="post">
		<input type="hidden" name="id">
	</form>
</body>
</html>