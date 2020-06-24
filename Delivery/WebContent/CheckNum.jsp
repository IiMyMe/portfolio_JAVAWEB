<%@page import="mem.*"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="user" class="mem.Mem" scope="page" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>번호 확인</title>
</head>
<body>
	<%
	    String userID = request.getParameter("userID");
	
	    PrintWriter script = response.getWriter();
	    DBM dbm = new DBM();
		String result = dbm.search(userID);
		
		if(result == null){
			script.println("운송장 번호가 없습니다.");
		}else{
			script.println("운송장 번호는 \'"+result+"\' 입니다.");
		}
		
	%>
	<p></p>
	<input type="button" value="돌아가기" onclick="location.href = 'RMain.html?userID=" + userID + "'" />
</body>
</html>