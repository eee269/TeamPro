<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	
//		if(regex.exec(id)) { 
//			element.innerHTML = "사용 가능";
//			checkIdResult = true; 
//		} else { 
//			element.innerHTML = "사용 불가";
//			checkIdResult = false; 
//		}

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



// function callback(){
// 	if(httpRequest.readyState == 4){
// 		// 결과값을 가져온다.
// 		var resultText = httpRequest.responseText;
// 		if(resultText == 0){
// 			alert("사용할수없는 아이디입니다.");
// 			document.getElementById("cancelBtn").style.visibility='visible';
// 			document.getElementById("useBtn").style.visibility='hidden';
// 			document.getElementById("msg").innerHTML ="";
// 		} 
// 		else if(resultText == 1){ 
// 			document.getElementById("cancelBtn").style.visibility='hidden';
// 			document.getElementById("useBtn").style.visibility='visible';
// 			document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
// 		}
// 	}
// }

// 사용하기 클릭 시 부모창으로 값 전달 
function sendCheckValue(){
	// 중복체크 결과인 idCheck 값을 전달한다.
	opener.document.fr.idDuplication.value ="idCheck";
	// 회원가입 화면의 ID입력란에 값을 전달
	opener.document.fr.id.value = document.getElementById("userId").value;
	
	if (opener != null) {
    	opener.chkForm = null;
    	self.close();
	}	
}	



</script>
<body onload="pValue()">
<div id="wrap">
	<br>
	<b><font size="4" color="gray">아이디 중복체크</font></b>
	<hr size="1" width="460">
	<br>
	<div id="chk">
		<form action="dupCheck.mo" method="POST" id="checkForm" onsubmit="return idCheck()">
		<div id="checkIdResult"></div>
			<input type="text" name="id" id="userId" required="required" placeholder="영문자,숫자를 혼용하여 3~8글자 입력하세요" onkeyup="checkId(this)" readonly="readonly"><input type="submit" value="중복확인">
							
<!-- 			<input type="button" value="중복확인" onclick="idCheck()"> -->
<!-- 		<input type="submit" value="중복확인"> -->
		</form>
		<div id="msg"></div>
		<br>
		
		<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
		<input id="cancelBtn" type="button" value="취소" onclick="window.close()">
	</div>
</div>	
</body>
</html>