<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mem.DBM" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="user" class="mem.Mem" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" /> 


<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
	<%
		DBM dbm = new DBM(); //인스턴스생성
		int result = dbm.login(user.getUserID(), user.getUserPassword());
		PrintWriter script = response.getWriter();

		//관리자 로그인
		if(result == 2){
			script.println("<script>");
			script.println("alert('관리자로 로그인이 되었습니다.')");
			script.println("location.href = 'AMain.html'");
			script.println("</script>");
		}

		//로그인 성공
		if(result == 1){
			script.println("<script>");
			/* script.println("alert('로그인 성공')"); */
			script.println("location.href = 'RMain.html?ID=" + user.getUserID() + "'");
			script.println("</script>");
		}
		//로그인 실패
		else if(result == 0){
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		//아이디 없음
		else if(result == -1){
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디 입니다.')");
		script.println("history.back()");
		script.println("</script>");
		}
		//DB오류
		else if(result == -2){
		script.println("<script>");
		script.println("alert('DB오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
		}
	%>


</body>
</body>
</html>
