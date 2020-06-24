<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dbm" class="mem.DBM"/>
<jsp:useBean id="bean" class="mem.MemBean"/>
<jsp:setProperty name="bean" property="userID"/>
<jsp:setProperty name="bean" property="userName"/>
<jsp:setProperty name="bean" property="userPassword"/>
<jsp:setProperty name="bean" property="userEmail"/>
<jsp:setProperty name="bean" property="courier"/>
<jsp:setProperty name="bean" property="waybillNumber"/>
<jsp:setProperty name="bean" property="deliveryStatus"/>
<%
	boolean b = dbm.modifyData(bean);
	if(b){
%>
	<script>
		alert("수정되었습니다");
		location.href="dbm.jsp"
	</script>
<%	} else { %>
	<script>
		alert("수정 실패!");
		history.back();
	</script>	
<%	} %>
