<%@page import="mem.*"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="user" class="mem.MemDto" scope="page" />

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
			script.println("<script>");
			script.println("alert('����� ��ȣ�� �����ϴ�.')");
			script.println("location.href = 'RMain.html?userID="+userID+"'");
			script.println("</script>");
		}else{
			script.println("<script>");
			script.println("alert('����� ��ȣ�� "+result+" �Դϴ�.')");
			script.println("location.href = 'RMain.html?userID="+userID+"'");
			script.println("</script>");
		}
		
	%>
	<%-- <p></p>
	<input type="button" value="���ư���" onclick="location.href = 'RMain.html?userID=<%=userID%>'"/> --%>
</body>
</html>