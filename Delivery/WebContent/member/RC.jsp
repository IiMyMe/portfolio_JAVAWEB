<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
    <title>test</title>
    <style>
      {
        padding: 0;
        margin: 0;
      }
      li {
        list-style-type: none;
      }

      #menu{
        clear: both;
        height: 40px;
        background: #ffffff;
        color: black;
        text-align: center;
        padding-top: 15px;
        font-size: 20px;
        border: solid 1px white;
      }
      #menu li{
        display: inline;
      }
      #notify li{
        float: right;
        font-size: 15px;
        display: inline;
      }


      .item{
        margin: 0 30px 0 30px;
      }
      .item2{
        margin: 0 10px 0 10px;

      }
      h1{
        margin-bottom: 50px;
        margin-top: 50px;
      }
      h2{
        margin: 20px 0 40px 500px;
      }
      #in {

        font-size: 25px;
        margin-left:72px;

      }
      #out{
        font-size: 25px;
        margin-left: 48px;
      }
      #put{
        font-size: 25px;
        margin-left: 99px;
      }
      select{
        font-size: 25px;
        margin-left: 28px;
      }

      #button{
        width: 300px;
        height: 25px;
        padding: 8px;
        margin-left: 300px;
        background-color: orange;
        color: white;
        border-radius: 15px;
        margin-top: 50px;
        }
        #put2{
          font-size: 25px;
          margin-left: 75px;
        }
        .select{
          margin-bottom: 200px;
        }


    </style>

<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	regForm.id.focus();
	document.getElementById("btnId").onclick = checkid1;
	document.getElementById("btnSubmit").onclick = inputCheck1;
}
</script>


  </head>
  <body>
      <ul id='menu'>
        <li class='item'>회사소개</li>
        <li>|</li>
        <li class='item'>개인택배</li>
        <li>|</li>
        <li class='item'>고객지원</li>
    </ul>
      <ul id='notify'>
        <li class='item2' onclick="location.href='Main.html'">로그인</li>
		<li>|</li>
		<li class='item2' onclick="location.href='SUS.html'">회원가입</li>
        <li>|</li>
        <li class='item2'>공지사항</li>
    </ul>
      <h1 class="title"><center>회원정보 입력</center></h1>
      <h2 class="title">★택배사 회원★</h2>
      
     <form name="regForm" method="post" action="SignUP1.jsp">
	      <h2>아이디<input id="in" type="text"name="id"placeholder="ID">
	      	<input type="button" value="ID중복확인" id="btnId"></h2>
	      <h2>비밀번호<input id="out"type="password"name="pass"placeholder="password"></h2>
	      <h2>이름<input id="put"type="text"name="name"placeholder="name"></h2>
	      <h2>이메일 <input id="put2"type="text"name="mail"placeholder="email"></h2>
	
	      <h2>택배사 선택
	      <select name=courier>
	        <option value="0">선택</option>
	        <option value="로젠 택배">로젠 택배</option>
	        <option value="CJ대한통운">CJ대한통운</option>
	        <option value="한진 택배">한진 택배</option>
	        <option value="경동 택배">경동 택배</option>
	        <option value="쿠팡">쿠팡</option>
	      </select>
	    </h2>
	      <div id='button'>
	        <center>
				<input type="button" value="회원가입" id="btnSubmit">
			</center>
	    </div>
    </form>

  </body>
</html>
