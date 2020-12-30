<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NaverLoginSDK</title>
	<!-- (1) LoginWithNaverId Javscript SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
callback 처리중입니다. 이 페이지에서는 callback을 처리하고 바로 main으로 redirect하기때문에 이 메시지가 보이면 안됩니다.
	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
		var naver_id_login = new naver_id_login("jjXgPjWf7pqDUU6YqA_B", "http://ec2-3-35-82-26.ap-northeast-2.compute.amazonaws.com:8080/Itwillbs_8/member/naver_callback.jsp");
		  // 접근 토큰 값 출력
// 		  alert(naver_id_login.oauthParams.access_token);
		  // 네이버 사용자 프로필 조회
		  naver_id_login.get_naver_userprofile("naverSignInCallback()");
		  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		  var email, username, id, img;
		  function naverSignInCallback() {
			  // 토큰에 있는 프로필 정보 가져와서 저장
			  email = naver_id_login.getProfileData('email');
			  username = naver_id_login.getProfileData('nickname');
			  id = naver_id_login.getProfileData('id');
			  img = naver_id_login.getProfileData('profileImage');
			  
			  var url = "http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/Itwillbs_8/MemberNaverLogin.mo"; 
		    post_to_url( url,
		    		{'id': id, 'username': username, 'email': email, 'img': img})
		  }
		  
	</script>
</body>

<script type="text/javascript">

// url로 넘기면서 정보도 같이 담아서 갖고가기
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
</html>