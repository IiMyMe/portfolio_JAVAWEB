<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dbm" class="mem.DBM"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
<%
	String userID = (String)request.getParameter("userID");
	String userPassword = (String)request.getParameter("userPassword");

	boolean deleteConfirm = dbm.deleteConfirm(userID, userPassword);
	if(deleteConfirm){
%>
		<script type="text/javascript">
			var confirmResult = confirm("정말 삭제하시겠습니까?");
			if(confirmResult == true){
				var deleteId = "<%=userID%>";
				post_to_url("DMA.jsp",{'userID':deleteId});
			} else {
				history.back();
			}
		
		</script>
<%
	} else {
%>
		<script>
			alert("비밀번호가 틀립니다!");
			history.back();
		</script>	
<%
	}
%>
</body>
</html>