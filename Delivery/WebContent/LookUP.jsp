<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mem.DBM"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="user" class="mem.Mem" scope="page" />
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
		
		script.println(userID);
		if (user.getWaybillNumber() == null) {
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			DBM dbm = new DBM(); //인스턴스생성
			int result = dbm.check1(userID, user.getWaybillNumber());

			//배송완료
			if (result == 2) {
				script.println("alert('배송완료입니다.')");
			}

			//배송중 또는 전
			if (result == 1) {
				script.println("alert('배송전 또는 배송중입니다.')");
			}
			//배송번호 틀림
			else if (result == 0) {
				script.println("alert('배송번호가 틀립니다.')");
			}
			//배송번호 없음
			else if (result == -1) {
				script.println("배송번호가 없습니다.");
			}
			//DB오류
			else if (result == -2) {
				script.println("DB오류가 발생했습니다.");
			}
		}
	%>
	<p></p>
	<input type="button" value="돌아가기" onclick="location.href='RMain.html'" />


</body>
</body>
</html>
