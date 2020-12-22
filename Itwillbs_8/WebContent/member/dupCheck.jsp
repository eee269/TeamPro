<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style rel="stylesheet">
@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);
* {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Lato', sans-serif;
  background-color: #f8f8f8;
}
body .container_member {
   position: relative;
  overflow: hidden;
  height: 390px;
  -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  padding: 0 7%;
}
body .container_member .half {
  float: left;
  width: 100%;
  height: 100%;
  padding: 58px 20% 0 20%;
}
body .container_member .half.bg {
  background-image: url("http://www.blueb.co.kr/SRC2/_image/v01.jpg");
  background-size: 400px;
  background-repeat: no-repeat;
}
body .container_member h1 {
  font-size: 18px;
  font-weight: 700;
  margin-bottom: 23px;
  text-align: center;
  text-indent: 6px;
  letter-spacing: 7px;
  text-transform: uppercase;
  color: #263238;
}
body .container_member .tabs {
  width: 100%;
  margin-bottom: 29px;
  border-bottom: 1px solid #d9d9d9;
}
body .container_member .tabs .tab {
   display: inline-block;
  margin-bottom: -1px;
  padding: 20px 15px 10px;
  cursor: pointer;
  letter-spacing: 0;
  border-bottom: 1px solid #d9d9d9;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
  transition: all 0.1s ease-in-out;
}
body .container_member .tabs .tab a {
  font-size: 11px;
  text-decoration: none;
  text-transform: uppercase;
  color: #d9d9d9;
  transition: all 0.1s ease-in-out;
}
body .container_member .tabs .tab.active a, body .container_member .tabs .tab:hover a {
  color: #263238;
}
body .container_member .tabs .tab.active {
  border-bottom: 1px solid #263238;
}
body .container_member .content form {
  position: relative;
  height: 100px;
}
body .container_member .content label:first-of-type, body .container_member .content input:first-of-type, body .container_member .content .more:first-of-type {
  -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container_member .content label:nth-of-type(2), body .container_member .content input:nth-of-type(2), body .container_member .content .more:nth-of-type(2) {
  -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container_member .content label:nth-of-type(3), body .container_member .content input:nth-of-type(3), body .container_member .content .more:nth-of-type(3) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container_member .content label {
  font-size: 1em;
  color: #263238;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
}
body .container_member .content label:not([for='remember']) {
  display: none;
}
body .container_member .content input.inpt {
  font-size: 14px;
  display: block;
  width: 100%;
  height: 42px;
  margin-bottom: 12px;
  padding: 16px 13px;
  color: #999999;
  border: 1px solid #d9d9d9;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .container_member .content input.inpt::-webkit-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container_member .content input.inpt:-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container_member .content input.inpt::-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container_member .content input.inpt:-ms-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container_member .content input.inpt:focus {
  border-color: #999999;
}
body .container_member .content input.submit {
  font-size: 12px;
  line-height: 42px;
  display: block;
  width: 100%;
  height: 42px;
  cursor: pointer;
  vertical-align: middle;
  letter-spacing: 2px;
  text-transform: uppercase;
  color: #263238;
  border: 1px solid #263238;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .container_member .content input.submit:hover {
  background-color: #263238;
  color: #ffffff;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}

</style>

<script src="jj/jquery-3.5.1.js"></script>
<script type="text/javascript">
//회원가입창의 아이디 입력란의 값을 가져온다.
function pValue(){
	document.getElementById("userId").value = opener.document.fr.id.value;
}

//아이디 중복체크
function idCheck(){

	var id = document.getElementById("userId").value;

	if (!id) {
		alert("아이디를 입력하지 않았습니다.");
		return false;
	} else {
		return true;
	}
}

function checkId(idForm) { 
	var id = idForm.value; 
	
	
	var element = document.getElementById('checkIdResult');
	
	var regex = /^[A-Za-z]+[A-Za-z0-9]{2,7}$/g;
	var caseRegex = /[A-Za-z]/;
	var digitRegex = /[0-9]/;

	if(regex.exec(id)) {
		var count = 0;
		if(caseRegex.exec(id)) count++;
		if(digitRegex.exec(id)) count++;
		
		if(count == 2 ){
			element.innerHTML = "사용 가능";
 			checkIdResult = true; 
		} else {
			element.innerHTML = "사용 불가(영문자,숫자를 혼용하여 3~8글자 입력하세요)";
 			checkIdResult = false; 
		}
	} else {
		element.innerHTML = "사용 불가(영문자,숫자를 혼용하여 3~8글자 입력하세요)";
			checkIdResult = false; 
	}
	
}




function sendCheckValue(){
	opener.document.fr.idDuplication.value ="idCheck";
	opener.document.fr.id.value = document.getElementById("userId").value;
	
	if (opener != null) {
    	opener.chkForm = null;
    	self.close();
	}	
}	
	
 
</script>


<body onload="pValue()">
<section class="container_member" id="wrap">
		    <article class="half">


			        <div class="content" id="chk">
				<h1>아이디 중복확인</h1>
                <form action="dupCheck.mo" method="POST" id="checkForm" onsubmit="return idCheck()">
                <div id="checkIdResult"></div>
						                    <input type="text" name="id" id="userId" class="inpt" required="required" placeholder="영문자,숫자를 혼용하여 3~8글자 입력하세요" onkeyup="checkId(this)">
						                    <label for="text">ID</label><br>                
						                    <input type="submit" value="아이디 중복확인" class="submit">
        					        </form>
        					        
        					        <div id="msg"></div><br>
        					        <input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()" class="submit">
									<input id="cancelBtn" type="button" value="취소" onclick="window.close()" class="submit">
			        </div>
		    </article>
	</section>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
$('.tabs .tab').click(function(){
//     if ($(this).hasClass('signin')) {
//         $('.tabs .tab').removeClass('active');
//         $(this).addClass('active');
//         $('.cont').hide();
//         $('.signin-cont').show();
//     } 
    if ($(this).hasClass('signup')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont').show();
    }
});
$('.container .bg').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 30);
    var amountMovedY = (e.pageY * -1 / 9);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
});
</script>
</body>
