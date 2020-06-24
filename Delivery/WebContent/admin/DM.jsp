<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dbm" class="mem.DBM"/>
<%
	String userID = (String)request.getParameter("userID");
	boolean b = dbm.deleteData(userID);
	if(b){
%>
		<script>
			alert("삭제 성공");
			location.href = "dbm.jsp";
		</script>	
<% } else { %>
		<script>
			alert("삭제 실패!\n");
			history.back();
		</script>	
<%
	}
%>