<%@page import="mem.DBM" %>
<%@page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="user" class="mem.Mem" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원가입</title>
</head>

<body>
	<%
	    PrintWriter script = response.getWriter();
		if(user.getUserID()==null||user.getUserPassword()==null){
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			DBM dbm = new DBM();
			int result =dbm.join(user);
			
			if(result==-1){
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디 입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				script.println("<script>");
				script.println("alert('회원가입 성공')");
				script.println("location.href='Main.html'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>