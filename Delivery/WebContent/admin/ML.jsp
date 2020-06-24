<%@page import="mem.MemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dbm" class="mem.DBM"/>

<%
	String userID = request.getParameter("userID");
	MemDto dto =  dbm.getData(userID);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" />
<title>Insert title here</title>
<script src="../js/script.js?ver=2"></script>
<script type="text/javascript">
window.onload = function(){
	//직업가져오기
	var courier = document.getElementsByName("courier")[0];
	for(var i = 0;i<courier.length;i++){
		if(courier[i].value =="<%=dto.getCourier()%>"){
			courier[i].selected = true;
		}
	}
	document.getElementById("btnModify").onclick = admin_modify_member_action;
	document.getElementById("btnModifyCancel").onclick = admin_modify_member_cancel;
	document.getElementById("btnDelete").onclick = function(){
		admin_modify_member_delete("<%=dto.getUserID()%>");
	}
}
</script>
</head>
<body>
<br>
<center>
	<table class="table">
	<tr>
		<td align="center" valign="middle">
			<form name="modifyFormAdmin" method="post" action=EMI.jsp>
				<table border="1">
					<tr align="center" style="background-color: blue">
						<td colspan="2"><b style="color: white"><%=dto.getUserName() %>님의 정보 수정</b></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="userName" size="15" value="<%=dto.getUserName() %>"></td>
					</tr>
					<tr>
						<td width="16%">아이디</td>
						<td width="57%">
							<%=dto.getUserID()%>
							<input type="hidden" name="userID" value="<%=dto.getUserID() %>" />
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="text" name="userPassword" size="15" value="<%=dto.getUserPassword() %>"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="userEmail" size="27" value="<%=dto.getUserEmail() %>"></td>
					</tr>
					<tr>
						<td width="16%">일반or택배사</td>
						<td width="57%">
							<%=dto.isGmcm()%>
							<input type="hidden" name="gmcm" value="<%=dto.isGmcm() %>" />
						</td>
					</tr>
					<tr>
						<td>운송장번호</td>
						<td><input type="text" name="waybillNumber" size="20" value="<%=dto.getWaybillNumber() %>"></td>
					</tr>
					<tr>
						<td>배송상태</td>
						<td>
							<input type="radio" name="deliveryStatus" value="false"><%="배송중 또는 배송전" %> 
							<input type="radio" name="deliveryStatus" value="true"><%="배송완료" %> 
						</td>
					</tr>
					<tr>
						<td>택배사</td>
						<td>
							<select name="courier" onselect="기타" onshow="기타" >
								<option value="0">선택</option>
						       	<option value="로젠 택배">로젠 택배</option>
						        <option value="CJ대한통운">CJ대한통운</option>
						        <option value="한진 택배">한진 택배</option>
						        <option value="경동 택배">경동 택배</option>
						        <option value="쿠팡">쿠팡</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="수정완료" id="btnModify" />
							&nbsp;&nbsp;
							<input type="button" value="수정취소" id="btnModifyCancel" />
							<input type="button" value="회원삭제" id="btnDelete" />
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
	</table>
</center>
</body>
</html>