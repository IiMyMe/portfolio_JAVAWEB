
/*************************  member/RC.html *************************/

//regform id 중복확인
function checkid1() {
	if(regForm.userID.value == "") {
		alert("아이디를 입력하시오.");
		regForm.userID.focus();
	} else {
		url = "check_id.jsp?userID=" + regForm.userID.value;
		// 두 번째 파라미터는 메소드 전송방식이 아니고 타이틀
		window.open(
				url, 
				"id check", "toolbar=no, width=350, height=150, top=150, left=150");
	}
}

//회원가입 입력검사
function inputCheck1(){
	if(regForm.userID.value == "") {
		alert("아이디를 입력하시오.");
		regForm.userID.focus();
		return;
	} 
	
	if(regForm.userPassword.value == "") {
		alert("비밀번호를 입력하시오.");
		regForm.userPassword.focus();
		return;
	}
	
	if(regForm.userEmail.value == "") {
		alert("이메일을 입력하시오.");
		regForm.userEmail.focus();
		return;
	} 
	
	if(regForm.userName.value == "") {
		alert("이름을 입력하시오.");
		regForm.userName.focus();
		return;
	}
	
	// 이름, 이메일, 전화번호 - 정규표현식
	if(regForm.courier.value === "0") {
		alert("택배사를 선택하시오.");
		regForm.courier.focus();
		return;
	}
	regForm.submit();
}

/*************************  member/GM.html *************************/

//regform id 중복확인
function checkid0() {
	if(regForm.userID.value == "") {
		alert("아이디를 입력하시오.");
		regForm.userID.focus();
	} else {
		url = "check_id.jsp?userID=" + regForm.userID.value;
		// 두 번째 파라미터는 메소드 전송방식이 아니고 타이틀
		window.open(
				url, 
				"id check", "toolbar=no, width=350, height=150, top=150, left=150");
	}
}

//회원가입 입력검사
function inputCheck0(){
	if(regForm.userID.value == "") {
		alert("아이디를 입력하시오.");
		regForm.userID.focus();
		return;
	} 
	
	if(regForm.userPassword.value == "") {
		alert("비밀번호를 입력하시오.");
		regForm.userPassword.focus();
		return;
	}
	
	if(regForm.userEmail.value == "") {
		alert("이메일을 입력하시오.");
		regForm.userEmail.focus();
		return;
	} 
	
	if(regForm.userName.value == "") {
		alert("이름을 입력하시오.");
		regForm.userName.focus();
		return;
	}
	regForm.submit();
}


/*************************  Main.html *************************/


function funcLogin() {
	if (loginForm.userID.value == "") {
		alert("아이디 입력");
		loginForm.userID.focus();
	} else if (loginForm.userPassword.value == "") {
		alert("비밀번호 입력");
		loginForm.userPassword.focus();
	} else {
		loginForm.action = "guest/Login.jsp";
		loginForm.method = "post";
		loginForm.submit();
	}
}

/******************  member/modify_member_form.jsp ******************/

//회원정보 수정 입력검사
function memberModify(){
	if(regForm.userID.value == "") {
		alert("아이디를 입력하시오.");
		regForm.userID.focus();
		return;
	} 
	
	if(regForm.userPassword.value == "") {
		alert("passwd를 입력하시오.");
		regForm.userPassword.focus();
		return;
	}
	regForm.submit();
}

//회원정보 수정 취소
function memberModifyCancel(){
	location.href = "../index.jsp";
}

//회원정보 삭제
function memberDelete(userID){
	var deletepass = prompt("비밀번호를 입력하세요");
	post_to_url("../guest/DM.jsp",{'userID':userID,'userPassword':deletepass});
}

//javascript에서 post방식으로 데이터 전송 (id/pw 확인용)
function post_to_url(path,params,method){
	method = method||"post";
	
  var form = document.createElement("form");
  form.setAttribute("method", method);
  form.setAttribute("action", path);

  //히든으로 값을 주입시킨다.
  for(var key in params) {
      var hiddenField = document.createElement("input");
      hiddenField.setAttribute("type", "hidden");
      hiddenField.setAttribute("name", key);
      hiddenField.setAttribute("value", params[key]);

      form.appendChild(hiddenField);
  }

  document.body.appendChild(form);
  form.submit();
}


/******************  dbm.jsp ******************/

//관리자 회원정보보기
function admin_modify_member(userID){
	document.modifyFrm.userID.value=userID;
	document.modifyFrm.submit();
}

/******************  ML.jsp ******************/

//관리자 회원정보수정
function admin_modify_member_action(){
	document.modifyFormAdmin.submit();
}

//관리자 회원정보수정 취소
function admin_modify_member_cancel(){
	location.href="../admin/dbm.jsp";
}

//관리자 회원삭제
function admin_modify_member_delete(userID){
	//포스트 방식으로 id 값을 넘김
	post_to_url("../admin/DM.jsp",{'userID':userID});
}

/******************  DL.jsp ******************/

//택배사 회원정보보기
function courier_modify_member(userID){
	document.modifyFrm.userID.value=userID;
	document.modifyFrm.submit();
}

/******************  EDI.jsp ******************/

//택배사 회원정보수정
function courier_modify_member_action(){
	document.modifyFormAdmin.submit();
}

//택배사 회원정보수정 취소
function courier_modify_member_cancel(){
	location.href="../courier/DL.jsp";
}