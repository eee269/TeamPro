<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript">
	checkPasswdResult = false; 

	
	
	function checkPasswd(passwdForm) { 
		var passwd = passwdForm.value; 
		
		var element = document.getElementById('checkPasswdResult');
		
		var lengthRegex = /^[A-Za-z0-9!@#$%]{2,7}$/;
		var upperCaseRegex = /[A-Z]/;
		var lowerCaseRegex = /[a-z]/;
		var digitRegex = /[0-9]/;
		var specRegex = /[!@#$%]/;
		
		if(lengthRegex.exec(passwd)) {
			var count = 0;
			if(upperCaseRegex.exec(passwd)) count++;
			if(lowerCaseRegex.exec(passwd)) count++;
			if(digitRegex.exec(passwd)) count++;
			if(specRegex.exec(passwd)) count++;
			
// 			element.innerHTML = "사용 가능 " + count;

			// 점수(count) 에 따른 안전도 출력
			if(count == 4) {
				element.innerHTML = "사용 가능(안전)";
				checkPasswdResult = true; // 전역변수 true 로 변경
			} else if(count == 3) {
				element.innerHTML = "사용 가능(보통)";
				checkPasswdResult = true; // 전역변수 true 로 변경
			} else {
				element.innerHTML = "사용 불가(영문자,숫자,특수문자(!@#$%)를 혼용하여 3~8글자 입력하세요)";
				checkPasswdResult = false; // 전역변수 false 로 변경
			}

		} else {
			element.innerHTML = "사용 불가(영문자,숫자,특수문자(!@#$%)를 혼용하여 3~8글자 입력하세요)";
			checkPasswdResult = false; // 전역변수 false 로 변경
		}
		
	}
	
	function checkPasswd2(passwdForm){
		var passwd2 = passwdForm.value; 
		
		var element = document.getElementById('checkPasswdResult2');
		if(document.fr.password.value != document.fr.password2.value){
			element.innerHTML = "비밀번호 불일치";
    		checkPasswdResult2 = true;    		
    	} else {
    		element.innerHTML = "비밀번호 일치";
    		checkPasswdResult2 = false;
    	}
	}
	
		
	// 아이디, 패스워드 정규표현식 체크 후 정상이면 true 리턴(submit), 아니면 false 리턴
	function check() {
		if(checkPasswdResult) {
			return true;
		} else {
			alert('패스워드 규칙 확인 필수!');
			return false;
		}
	}
</script>
<%
	String id = (String) session.getAttribute("member_id");
%>

<jsp:include page="/inc/header.jsp" />
<link type="text/css" rel="stylesheet" href="scss/common.css" />
<link type="text/css" rel="stylesheet" href="scss/mp_main.css" />
<link type="text/css" rel="stylesheet" href="scss/header.1.css" />
<link type="text/css" rel="stylesheet" href="scss/menu.2.css" />

<div id="contentWrapper">
	<div id="contentWrap">
		<hr>
		<div id="content">
		
		<div id="aside">
			<h2 class="aside-tit"> 비밀번호 수정</h2>
		</div>
			<div class="page-body">
			<form action="MemberPassPro.mo" method="POST" name="fr" onsubmit="return check()"
				style="border: 0.1px gray dashed; margin: 100px 20%; padding: 50px 10%; text-align: center;">
				<label style="font-size: 30px"><strong><%=id %></strong> 고객님</label>
				<br><br><br>
				
				<strong style="font-size: 18px">비밀번호를 수정하시겠습니까?</strong>
				
				<br><br><hr><br><br><br>
				
				<input type="password" name="password" placeholder="영문자,숫자,특수문자(!@#$%)를 혼용하여 3~8글자 입력하세요" 
				style="width: 450px; padding: 5px; text-align: center;" required="required" onkeyup="checkPasswd(this)">
							<div id="checkPasswdResult"></div>
				<br><br><br>
				
				<input type="password" name="password2" placeholder="확인 비밀번호를 입력하세요" 
				style="width: 450px; padding: 5px; text-align: center;" required="required" onkeyup="checkPasswd2(this)"> 
							<div id="checkPasswdResult2"> </div>
				
				<input type="submit" value="확인" style="padding: 15px 20px; cursor: pointer;">
			</form>
			
			<!-- 하단 여백 -->
<div style="height: 150px"></div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/inc/footer.jsp" />
