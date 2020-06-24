<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="dbm" class="mem.DBM"/>
<jsp:useBean id="bean" class="mem.MemBean"/>
<jsp:setProperty name="bean" property="userID"/>
<jsp:setProperty name="bean" property="userPassword"/>
<jsp:setProperty name="bean" property="userName"/>
<jsp:setProperty name="bean" property="userEmail"/>
<jsp:setProperty name="bean" property="courier"/>
<% boolean b = dbm.insertData1(bean); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body style="text-align: center; margin-top: 30px;">
	<%
		if(b) {
			//out.println("<b>회원 가입을 축하합니다.</b><br/><br/>");
			//out.println("<a href='../guest/guest_index.jsp'>로그인</a>");
			response.sendRedirect("../index.jsp");
		} else {
			out.println("<b>회원 가입 실패! 관리자에게 문의</b><br/><br/>");
			out.println("<a href='RC.html'>가입 재시도</a>");
		}
	%>
</body>
</html>