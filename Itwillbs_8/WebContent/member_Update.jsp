<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />

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
  padding: 58px 30em; 0;
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
  height: 287px;
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
body .container_member .content input:focus {
  outline: none;
}
body .container_member .content .checkbox {
  margin-top: 4px;
  overflow: hidden;
  clip: rect(0 0 0 0);
  width: 0;
  height: 0;
  margin: 17px -1px;
  padding: 0;
  border: 0;
}
body .container_member .content .checkbox + label {
  vertical-align: middle;
  display: inline-block;
  width: 50%;
}
body .container_member .content .checkbox + label:before {
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
body .container_member .content .checkbox:checked + label:before {
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

@keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
@-webkit-keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
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
</style>

<script src="jj/jquery-3.5.1.js"></script>
<script type="text/javascript">

	 var pwJ = /^[A-Za-z0-9]{4,12}$/; 
	
 
</script>

<body>
<section class="container_member">
		    <article class="half">
			        <div class="section_my">
	<h3 class="tit_comm tit_manage">내 정보를 <span style="color: #8D98E6;">최신 정보로 관리</span>해 주세요.</h3>
	<p class="tit_comm desc_manage">아이디/비밀번호 분실 및 보호조치 해제를 위해 최신 정보로 내정보를 관리하세요.</p>
</div>
<br>
<br>
			        <div class="content">

    				        <div class="signup">
                <form action="#" method="post" enctype="multipart/form-data">
						                    <input type="text" name="id" id="id" class="inpt" required="required" placeholder="Your ID">
						                    <label for="text">ID</label> 	  <br>
						                    
						                    <input type="password" name="password" id="password" class="inpt" required="required" placeholder="Your Password">
                						    <label for="password">Password</label>	  <br>
                						   	<div id = "pwc"></div>
                						    
						                    <input type="text" name="name" id="name" class="inpt" required="required" placeholder="Your name">
						                    <label for="name">Name</label>	  <br>
						                    
                  							<input type="email" name="email" id="email" class="inpt" required="required" placeholder="Your email">
						                    <label for="email">e-mail</label>	  <br>
						                    
						                    <input type="text" name="img" id="img" class="inpt" required="required" placeholder="Select Profile Image">
						                    <label for="img">Image</label>	  <br>
						                    
						                    <input type="text" name="phone" id="phone" class="inpt" required="required" placeholder="Your PhoneNumber">
						                    <label for="phone">Phone Number</label>	  <br>
						                    
						                    <input type="submit" value="회원정보 수정" class="submit" style="font-size: 18px; width: 50%; align-content: center; margin:auto;">
        					        </form>
            </div>
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
<jsp:include page="footer.jsp" />