<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dbm" class="mem.DBM"/>
<%
	String userID = (String)request.getParameter("userID");
	boolean b = dbm.deleteData(userID);
	if(b){
		session.removeAttribute("idKey");
%>
		<script>
			alert("탈퇴 성공");
			location.href = "../index.jsp";
		</script>	
<% } else { %>
		<script>
			alert("탈퇴 실패!\n관리자에 문의바람");
			history.back();
		</script>	
<%
	}
%>