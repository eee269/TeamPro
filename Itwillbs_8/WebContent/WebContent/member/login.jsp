<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />

<style>
</style>
<!-- Cart -->
<div class="wrap-header-cart js-panel-cart">
	<div class="s-full js-hide-cart"></div>

	<div class="header-cart flex-col-l p-l-65 p-r-25">
		<div class="header-cart-title flex-w flex-sb-m p-b-8">
			<span class="mtext-103 cl2"> Your Cart </span>

			<div
				class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
				<i class="zmdi zmdi-close"></i>
			</div>
		</div>

		<div class="header-cart-content flex-w js-pscroll">
			<ul class="header-cart-wrapitem w-full">
				<li class="header-cart-item flex-w flex-t m-b-12">
					<div class="header-cart-item-img">
						<img src="images/item-cart-01.jpg" alt="IMG">
					</div>

					<div class="header-cart-item-txt p-t-8">
						<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
							White Shirt Pleat </a> <span class="header-cart-item-info"> 1
							x $19.00 </span>
					</div>
				</li>

				<li class="header-cart-item flex-w flex-t m-b-12">
					<div class="header-cart-item-img">
						<img src="images/item-cart-02.jpg" alt="IMG">
					</div>

					<div class="header-cart-item-txt p-t-8">
						<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
							Converse All Star </a> <span class="header-cart-item-info"> 1
							x $39.00 </span>
					</div>
				</li>

				<li class="header-cart-item flex-w flex-t m-b-12">
					<div class="header-cart-item-img">
						<img src="images/item-cart-03.jpg" alt="IMG">
					</div>

					<div class="header-cart-item-txt p-t-8">
						<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
							Nixon Porter Leather </a> <span class="header-cart-item-info">
							1 x $17.00 </span>
					</div>
				</li>
			</ul>

			<div class="w-full">
				<div class="header-cart-total w-full p-tb-40">Total: $75.00</div>

				<div class="header-cart-buttons flex-w w-full">
					<a href="shoping-cart.html"
						class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
						View Cart </a> <a href="shoping-cart.html"
						class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
						Check Out </a>
				</div>
			</div>
		</div>
	</div>
</div>





<!-- Content page -->
<section class="bg0 p-t-75 p-b-120">
	<div class="container">


		<link type="text/css" rel="stylesheet" href="../scss/common.css" />
		<link type="text/css" rel="stylesheet" href="../scss/login.css" />
		<link type="text/css" rel="stylesheet" href="../scss/header.1.css" />
		<link type="text/css" rel="stylesheet" href="../scss/menu.1.css" />

		<!-- 사이트 시작 -->

		<div id="contentWrapper">
			<div id="contentWrap">

				<link type="text/css" rel="stylesheet"
					href="/template_common/shop/basic_simple/menu.1.css?t=201711221039">
				<div id="content">
					<div id="loginWrap">
						<div class="tit-page">로그인</div>
						<div class="page-body">
							<div class="mlog-sign">
								<div class="mlog">
									<h3>회원 로그인</h3>
									<p>
										가입하신 아이디와 비밀번호를 입력해주세요.<br>비밀번호는 대소문자를 구분합니다.
									</p>
									<form action="/shop/member.html" method="post" name="form1"
										autocomplete="off">
										<fieldset>
											<legend>member login</legend>
											<ul class="frm-list">
												<li class="id"><label>MEMBER ID</label> <input
													type="text" name="id" maxlength="20" class="MS_login_id">
												</li>
												<li class="pwd"><label>PASSWORD</label> <input
													type="password" name="passwd" maxlength="20" value=""
													class="MS_login_pw"></li>
											</ul>
											<div class="btn-mlog">
												<a href="javascript:check();" class="CSSbuttonBlack fe">LOG-IN</a>
											</div>
<!-- 											<p class="se-log"> -->
<!-- 												<label><input type="checkbox" name="ssl" value="Y" -->
<!-- 													class="MS_security_checkbox" checked="checked"> -->
<!-- 													보안접속</label> -->
<!-- 											</p> -->
										</fieldset>
									</form>
								</div>
								<div class="sign">
									<h3>회원가입</h3>
									<dl>
										<dt>
											아직 회원이 아니신가요? <br>회원가입을 하시면 다양한 혜택을 편리하게 이용하실 수 있습니다.
										</dt>
										<dd>
											<a href="/shop/idinfo.html?type=new&amp;first="
												class="CSSbuttonWhite fe">JOIN-US</a>
										</dd>
									</dl>
									<dl>
										<dt>
											아이디 혹은 비밀번호를 잊으셨나요?<br>간단한 정보를 입력 후 잃어버린 정보를 찾으실 수 있습니다.
										</dt>
										<dd>
											<a href="/shop/lostpass.html" class="CSSbuttonWhite fe">ID/PASSWORD</a>
										</dd>
									</dl>
								</div>
							</div>
							<!-- .mlog-sign -->
							<div id="simpleLogin"></div>
							<!-- #simpleLogin -->
						</div>
						<!-- .page-body -->

						<div id="simpleLogin">
							<div class="sns-login">
								<p>
									<img src="http://oryany.co.kr//images/d3/modern_simple/sns_login_title.png">
								</p>
								<div>
									<a href="javascript:sns_login_log('naver');"><img
										src="http://oryany.co.kr//images/d3/modern_simple/btn/h34_sns_naver.gif"
										alt="네이버로 로그인"></a> <a
										href="javascript:sns_login_log('kakao');"><img
										src="http://oryany.co.kr//images/d3/modern_simple/btn/h34_sns_kakaotalk.gif"
										alt="카카오톡으로 로그인"></a>
								</div>
							</div>
							<!-- .sns-login -->
						</div>
						<!-- #simpleLogin -->


					</div>
					<!-- #loginWrap -->
				</div>
				<!-- #content -->
			</div>
			<!-- #contentWrap -->
		</div>


		<!-- 사이트 끝 -->


	</div>
</section>

<jsp:include page="../footer.jsp" />