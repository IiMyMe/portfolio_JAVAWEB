/******************  dbm.jsp ******************/

function admin_modify_member(userID){
	document.modifyFrm.id.value=userID;
	document.modifyFrm.submit();
}

/******************  MP.jsp ******************/

function admin_modify_member_action(){
	document.modifyFormAdmin.submit();
}

function admin_modify_member_cancel(){
	location.href="dbm.jsp";
}