<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="dbm" class="mem.DBM" />
<jsp:useBean id="mem" class="mem.Mem" />
<jsp:setProperty property="*" name="mem" />

<%
	boolean b = dbm.modifyData(mem);
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