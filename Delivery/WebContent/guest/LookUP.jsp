<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mem.DBM"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="user" class="mem.MemDto" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="waybillNumber" />


<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>배송조회</title>
</head>
<body>
	<%
    	String userID = request.getParameter("userID");
		PrintWriter script = response.getWriter();
		
		if (user.getWaybillNumber() == null) {
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			DBM dbm = new DBM(); //인스턴스생성
			int result = dbm.check1(user.getUserID(), user.getWaybillNumber());

			//배송완료
			if (result == 2) {
				script.println("<script>");
				script.println("alert('배송완료입니다.')");
				script.println("location.href = 'RMain.html?userID=" + user.getUserID() + "'");
				script.println("</script>");
			}

			//배송중 또는 전
			if (result == 1) {
				script.println("<script>");
				script.println("alert('배송전 또는 배송중입니다.')");
				script.println("location.href = 'RMain.html?userID=" + user.getUserID() + "'");
				script.println("</script>");
			}
			//배송번호 틀림
			else if (result == 0) {
				script.println("<script>");
				script.println("alert('배송번호가 틀립니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			//배송번호 없음
			else if (result == -1) {
				script.println("<script>");
				script.println("alert('배송번호가 없습니다.')");
				script.println("location.href = 'RMain.html?userID=" + user.getUserID() + "'");
				script.println("</script>");
			}
			//DB오류
			else if (result == -2) {
				script.println("<script>");
				script.println("alert('아이디가 없습니다.')");
				script.println("location.href = 'RMain.html?userID=" + user.getUserID() + "'");
				script.println("</script>");
			}
		}
	%>
	<%-- <p></p>
	<input type="button" value="돌아가기" onclick="location.href = 'RMain.html?userID=<%=userID%>'" /> --%>


</body>
</body>
</html>
