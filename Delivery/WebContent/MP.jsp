<%@page import="mem.Mem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="membermanager" class="mem.DBM" />


<%
	String id = request.getParameter("id");
	Mem mem = membermanager.getData(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/script.js?ver=2"></script>

<script type="text/javascript">

window.onload = function(){
	document.getElementById("btnModify").onclick = admin_modify_member_action;
}

function admin_modify_member_action(){
	document.modifyFormAdmin.submit();
}

function admin_modify_member_cancel(){
	location.href="membermanager.jsp";
}
}

</script>

</head>
<body>
	<br>
	<table class="table">
		<tr>
			<td align="center" valign="middle" style="background-color: #FFFFCC">
				<form name="modifyFormAdmin" method="post"
					action=member_modify_admin_action.jsp>
					<table border="1">
						<%-- <tr align="center" style="background-color: #8899aa">
							<td colspan="2"><b style="color: #FFFFFF"><%=mem.getUserID() %>님의 정보를 수정(관리자)</b></td>
						</tr> --%>
						
						<tr>
							<td width="16%">아이디</td>
							<td width="57%"><%=mem.getUserID()%> <input type="hidden"
								name="id" value="<%=mem.getUserID()%>" /></td>
						</tr>

						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pass" size="15"
								value="<%=mem.getUserPassword()%>"></td>
						</tr>

						<tr>
							<td>운송번호</td>
							<td><input type="text" name="waybillNumber" size="27"
								value="<%=mem.getWaybillNumber()%>"></td>
						</tr>

						<tr>
							<td>배송상태</td>
							<td><input type="text" name="deliveryStatus" size="20"
								value="<%=mem.isDeliveryStatus()%>"></td>
						</tr>
						
						<tr>
							<td colspan="2" align="center"><input type="button"
								value="수정완료" id="btnModify" /> &nbsp;&nbsp; <input
								type="button" value="수정취소" id="btnModifyCancel" />
						</tr>

					</table>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>