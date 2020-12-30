
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/inc/header.jsp" />
<!-- QuickMenu -->
<jsp:include page="/quickMenu.jsp" />

<!-- 구글 로그인 SDK -->
<meta name="google-signin-client_id" content="596863305253-u2jonmh14n7oeqved945l06t77d8fgqp.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

<!-- 네이버 로그인 SDK -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<!-- 카카오 로그인 SDK -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

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
	height: 100%;
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


body .container_member .half .signup-cont {
	float: left;
	width: 100%;
	height: 1000px;
	padding: 20px 20%;
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

body .container_member .tabs .tab.active a, body .container_member .tabs .tab:hover a
	{
	color: #263238;
}

body .container_member .tabs .tab.active {
	border-bottom: 1px solid #263238;
}

body .container_member .content form {
	position: relative;
	height: 287px;
}

body .container_member .content label:first-of-type, body .container_member .content input:first-of-type,
	body .container_member .content .more:first-of-type {
	-moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
	-webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
	animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}

body .container_member .content label:nth-of-type(2), body .container_member .content input:nth-of-type(2),
	body .container_member .content .more:nth-of-type(2) {
	-moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
	-webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
	animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}

body .container_member .content label:nth-of-type(3), body .container_member .content input:nth-of-type(3),
	body .container_member .content .more:nth-of-type(3) {
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

body .container_member .content input:focus {
	outline: none;
}

body .container_member .content .checkbox {
	margin-top: 4px;
	overflow: auto;
	clip: rect(0, 0, 0, 0);
	width: 0;
	height: 0;
	margin: 17px -1px;
	padding: 0;
	border: 0;
}

body .container_member .content .checkbox+label {
	vertical-align: middle;
	display: inline-block;
	width: 50%;
}

body .container_member .content .checkbox+label:before {
	content: "\A";
	color: #999999;
	font-family: Verdana;
	font-weight: bold;
	font-size: 8px;
	line-height: 10px;
	text-align: center;
	display: inline-block;
	vertical-align: middle;
	position: relative;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	background: transparent;
	border: 1px solid #d9d9d9;
	width: 11px;
	height: 11px;
	margin: -2px 8px 0 0;
}

body .container_member .content .checkbox:checked+label:before {
	content: "✓";
}

body .container_member .content .submit-wrap {
	position: relative;
	bottom: 0;
	width: 100%;
}

body .container_member .content .submit-wrap a {
	font-size: 12px;
	display: block;
	margin-top: 20px;
	text-align: center;
	text-decoration: none;
	color: #999999;
}

body .container_member .content .submit-wrap a:hover {
	text-decoration: underline;
}

body .container_member .content .signup-cont {
	display: none;
}

@
keyframes slideIn { 0% {
	filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
	opacity: 0;
	margin-left: -320px;
}

100% {
filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
opacity:1;
margin-left:0px;}
}
@-webkit-keyframes slideIn { 0% {
	filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
	opacity: 0;
	margin-left: -320px;
}

100%{
filter:progid:DXImageTransform.Microsoft.Alpha(enabled=false);
opacity:1;
margin-left:0px;}
}
.credits {
	display: block;
	position: absolute;
	right: 0;
	bottom: 0;
	color: #999999;
	font-size: 14px;
	margin: 0 10px 10px 0;
}

.credits a {
	filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
	opacity: 0.8;
	color: inherit;
	font-weight: 700;
	text-decoration: none;
}
.tc{
	color: red;
}

#loginApi {
	display: flex;
}
#loginApi > div {
	flex: 1;
}
</style>
<script type="text/javascript">
	var checkIdResult = false, checkPasswdResult = false; 

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
		if(document.fr.pass.value != document.fr.pass2.value){
			element.innerHTML = "비밀번호 불일치";
    		checkPasswdResult2 = true;    		
    	} else {
    		element.innerHTML = "비밀번호 일치";
    		checkPasswdResult2 = false;
    	}
	}
	
	function checkPhone(phoneForm) { 
		var phone = phoneForm.value; 
		
		
		var element = document.getElementById('checkPhoneResult');
		
// 		var regex = /^[0-9]*$/;
		var regex = /^[0-9]{2,11}$/;
		var rege= /^[0-9]{12,30}$/;
		
		
		
		if(regex.exec(phone)) { 
			element.innerHTML = "사용 가능";
			checkPhoneResult = true; 
		} else if(rege.exec(phone)){
			element.innerHTML = "11자리 이하로 입력해주세요";
			checkPhoneResult = false; 
		} 
		
		else { 
			element.innerHTML = "숫자만 입력하세요";
			checkPhoneResult = false; 
		}

		
// 		if(regex.exec(phone)) { 
// 			element.innerHTML = "사용 가능";
// 			checkPhoneResult = true; 
// 		} else { 
// 			element.innerHTML = "숫자만 입력하세요";
// 			checkPhoneResult = false; 
// 		}
		
	}
	
	// 아이디, 패스워드 정규표현식 체크 후 정상이면 true 리턴(submit), 아니면 false 리턴
	function check() {
		if(checkIdResult && checkPasswdResult) {
			return true;
		} else {
			alert('아이디 또는 패스워드 규칙 확인 필수!');
			return false;
		}
	}
	
	function openIdChk() {
		if(document.fr.id.value==""){
			alert('아이디를 입력해주세요')
			return false;
		} else {
			window.name="parentForm";
			window.open("dupCheckForm.mo",
					"chkForm", "width=500, height=380, resizable = no, scrollbars = no");
			
		}
	}

	function inputIdChk(){
		document.userInfo.idDuplication.value ="idUncheck";
	}
	
</script>

<script type="text/javascript">
// 로그인 API script

        // 구글 로그인 API
        function onSignIn() {
              var profile = gapi.auth2.getAuthInstance().currentUser.get().getBasicProfile();
              id = profile.getId();
              username = profile.getName();
              img = profile.getImageUrl();
              email = profile.getEmail();
             alert('로그인 완료');
              
              post_to_url( "MemberGoogleKakaoLogin.mo",
                        {'id': id, 'username': username, 'email': email, 'img': img});
        }
    // 구글, 카카오 로그인 API
        function post_to_url(path, params, method='post') {
          
          const form = document.createElement('form');
          form.method = method;
          form.action = path;
          
          for(const key in params) {
              if(params.hasOwnProperty(key)) {
                  const hiddenField = document.createElement('input');
                  hiddenField.type = 'hidden';
                  hiddenField.name = key;
                  hiddenField.value = params[key];
                  form.appendChild(hiddenField);
                }
              }
              document.body.appendChild(form);
              form.submit();
        }

</script>

<%
	// session 객체에 저장된 id 값이 존재할 경우
	// "잘못된 접근입니다." 출력 후 메인페이지로 이동
	if(session.getAttribute("id") != null) {
		%>
		<script>
			alert("잘못된 접근입니다.");
			location.href="./";
		</script>
		<%
	}

%>    
<body>
	<section class="container_member">
		<article class="half">
			<h1>SHOP OOTD</h1>
			<div class="tabs">
				<span class="tab signin active"><a href="#signin">Sign in</a></span>
				<span class="tab signup"><a href="#signup">Sign up</a></span>
			</div>
			<div class="content">
				<div class="signin-cont cont">
					<form action="MemberLoginPro.mo" method="post">
						<input type="text" name="id" id="id" class="inpt"
							required="required" placeholder="Your ID"> 
						<label for="text">ID</label>
						
						<input type="password" name="pass" id="password" class="inpt" required="required"
							placeholder="Your Password">
						<label for="password">Password</label>
						
<!-- 						<input type="checkbox" id="remember" class="checkbox" checked> -->
<!-- 						<label for="remember">Remember me</label> -->
						
						<div class="submit-wrap">
							<input type="submit" value="Sign in" class="submit"> 
<!-- 							<a href="#" class="more">Forgot your password?</a> -->
						</div>
					</form>
					
<!-- 					로그인 API -->
					<div id="loginApi">
						<!-- 구글 로그인 버튼 노출 영역 -->
						<div class="g-signin2" onclick='onSignIn()'></div>
						<!-- //구글 로그인 버튼 노출 영역 -->
						<div id="naver_id_login"></div>
                      	<!-- //네이버아이디로로그인 버튼 노출 영역 -->
                      <!-- 카카오 로그인 버튼 노출 영역 -->
                    	<a id="kakao-login-btn"></a>
                    	<!-- //카카오 로그인 버튼 노출 영역 -->
					</div>
					
				</div>
				<div class="signup-cont cont">
					<form action="MemberJoinPro.mo" method="post" enctype="multipart/form-data"
						style="height: 1000px;" name="fr" onsubmit="return check()">
						
						<div id="re"></div><br> <!-- onclick="dupCheck()" -->
						<b>아이디</b><b id="checkIdResult" class="tc"></b>
						<input type="text" name="id" id="id" class="inpt"
							required="required" placeholder="영문자,숫자를 혼용하여 3~8글자 입력하세요" onkeyup="checkId(this)">
							<input type="button" value="아이디중복확인" onclick="openIdChk()">
						<input type="hidden" name="idDuplication" value="idUncheck">							
						<label for="text">ID</label><br><br>
						
						<b>비밀번호</b><b id="checkPasswdResult" class="tc"></b>
						<input type="password" name="pass" id="password" class="inpt" required="required"
							placeholder="영문자,숫자,특수문자(!@#$%)를 혼용하여 3~8글자 입력하세요" onkeyup="checkPasswd(this)">
						<label for="password">Password</label>
						
						<b>비밀번호 재확인</b><b id="checkPasswdResult2" class="tc"> </b>
						<input type="password" name="pass2" id="password2" class="inpt" required="required"
							placeholder="비밀번호를 한번 더 입력하세요" onkeyup="checkPasswd2(this)"> 
						<label for="password">Password</label><br>
						
						<b>이메일</b>
						<input type="email" name="email" id="email" class="inpt"
							required="required" placeholder="이메일을 입력하세요">
						<label for="email">e-mail</label>
						
						<b>이름</b>
						<input type="text" name="username" id="name" class="inpt" required="required"
							placeholder="닉네임을 입력하세요"> 
						<label for="name">Username</label><br>
						
						<b>프로필사진</b>
						<input type="file" name="img" id="img" class="inpt"
							required="required" placeholder="프로필 사진을 첨부하세요">
						<label for="img">Image</label>
						
						<b>전화번호</b><b id="checkPhoneResult" class="tc"></b>
						<input type="text" name="phone" id="phone" class="inpt" required="required"
							placeholder="연락처는 숫자만 입력하세요" onkeyup="checkPhone(this)">
						<label for="phone">Phone Number</label> <br>

						<div class="term" style="padding-top: 30px;">
							<iframe width="100%" src="member/term.jsp"> </iframe>
						</div>
						
						<br> <input type="checkbox" id="term" class="checkbox" required="required">
						<label for="term">위 약관에 동의합니다.</label> <br>
						
						<input type="submit" value="Sign up" class="submit">

					</form>

				</div>

			</div>
		</article>
	</section>
 <div style="height: 470px"></div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript">
		var url = window.location.href;
		var hash = url.substring(url.indexOf("#") + 1);

		$('.tabs .tab').click(function() {
			if ($(this).hasClass('signin')) {
				$('.tabs .tab').removeClass('active');
				$(this).addClass('active');
				$('.cont').hide();
				$('.signin-cont').show();

			}
			if ($(this).hasClass('signup')) {
				$('.tabs .tab').removeClass('active');
				$(this).addClass('active');
				$('.cont').hide();
				$('.signup-cont').show();

			}
		});
		$('.container .bg').mousemove(
				function(e) {
					var amountMovedX = (e.pageX * -1 / 30);
					var amountMovedY = (e.pageY * -1 / 9);
					$(this).css('background-position',
							amountMovedX + 'px ' + amountMovedY + 'px');
				});
		if (hash == "signup") {
			$(this).hasClass('signup')
			$('.tabs .tab').removeClass('active');
			$('this').addClass('active');
			$('.cont').hide();
			$('.signup-cont').show();

		}
		
		// 네이버 로그인 API
		  var naver_id_login = new naver_id_login("jjXgPjWf7pqDUU6YqA_B", "http://ec2-3-35-82-26.ap-northeast-2.compute.amazonaws.com:8080/Itwillbs_8/member/naver_callback.jsp");
          var state = naver_id_login.getUniqState();
          naver_id_login.setButton("white", 2,40);
          naver_id_login.setDomain("http://ec2-3-35-82-26.ap-northeast-2.compute.amazonaws.com:8080/Itwillbs_8/MemberLoginForm.mo#");
          naver_id_login.setState(state);
          naver_id_login.init_naver_id_login();
    
          
          // 카카오 로그인 API
          // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
          Kakao.init('b62680a32c7f417cd4c5fd9d43ddd2e0');
          // SDK 초기화 여부를 판단합니다.
        Kakao.isInitialized();
//           function loginWithKakao() {
//             Kakao.Auth.login({
//               success: function(authObj) {
//                 alert(JSON.stringify(authObj))
//               },
//               fail: function(err) {
//                 alert(JSON.stringify(err))
//               },
//             })
//           }
Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
      Kakao.API.request({
        url: '/v2/user/me',
        success: function(res) {
            console.log(res.id);
            console.log(res.kakao_account['email']);
            console.log(res.properties['nickname']);
            console.log(res.properties['profile_image']);
            
            
            var id = res.id;
            var email = res.kakao_account['email'];
            var username = res.properties['nickname'];
            var img = res.properties['profile_image']
            
            post_to_url( "MemberGoogleKakaoLogin.mo",
                      {'id': id, 'username': username, 'email': email, 'img': img});
            
        },
        fail: function(error) {
          alert(
            'login success, but failed to request user information: ' +
              JSON.stringify(error)
          )
        },
      })
    },
    fail: function(err) {
      alert('failed to login: ' + JSON.stringify(err))
    },
  })
          
          
	</script>
</body>

<jsp:include page="/inc/footer.jsp" />
