<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dbm" class="mem.DBM"/>
<jsp:useBean id="bean" class="mem.MemBean"/>
<jsp:setProperty name="bean" property="userID"/>
<jsp:setProperty name="bean" property="userName"/>
<jsp:setProperty name="bean" property="userPassword"/>
<jsp:setProperty name="bean" property="userEmail"/>
<%
	String userID = request.getParameter("userID");
	boolean b = dbm.modifyData2(bean);
	if(b){
%>
	<script>
		alert("수정 성공\n로그아웃 됩니다");
		location.href="../index.jsp";
	</script>	
<% } else { %>
	<script>
		alert("수정 실패!\n관리자에 문의바람");
		history.back();
	</script>	
<%
	}
%>