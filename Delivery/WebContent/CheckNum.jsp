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
<title>��ȣ Ȯ��</title>
</head>
<body>
	<%
	    String userID = request.getParameter("userID");
	
	    PrintWriter script = response.getWriter();
	    DBM dbm = new DBM();
		String result = dbm.search(userID);
		
		if(result == null){
			script.println("����� ��ȣ�� �����ϴ�.");
		}else{
			script.println("����� ��ȣ�� \'"+result+"\' �Դϴ�.");
		}
		
	%>
	<p></p>
	<input type="button" value="���ư���" onclick="location.href = 'RMain.html?userID=" + userID + "'" />
</body>
</html>