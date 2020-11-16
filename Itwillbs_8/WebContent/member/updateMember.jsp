<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />

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
						<img src="http://oryany.co.kr/images/item-cart-01.jpg" alt="IMG">
					</div>

					<div class="header-cart-item-txt p-t-8">
						<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
							White Shirt Pleat </a> <span class="header-cart-item-info"> 1
							x $19.00 </span>
					</div>
				</li>

				<li class="header-cart-item flex-w flex-t m-b-12">
					<div class="header-cart-item-img">
						<img src="http://oryany.co.kr/images/item-cart-02.jpg" alt="IMG">
					</div>

					<div class="header-cart-item-txt p-t-8">
						<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
							Converse All Star </a> <span class="header-cart-item-info"> 1
							x $39.00 </span>
					</div>
				</li>

				<li class="header-cart-item flex-w flex-t m-b-12">
					<div class="header-cart-item-img">
						<img src="http://oryany.co.kr/images/item-cart-03.jpg" alt="IMG">
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


<!-- breadcrumb -->
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04"> Home
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> Shoping Cart </span>
	</div>
</div>

<link type="text/css" rel="stylesheet" href="../scss/common.css" />
<link type="text/css" rel="stylesheet" href="../scss/mp_main.css" />
<link type="text/css" rel="stylesheet" href="../scss/header.1.css" />
<link type="text/css" rel="stylesheet" href="../scss/menu.2.css" />
<!-- Shoping Cart -->


<div id="contentWrapper">
	<div id="contentWrap">

<link type="text/css" rel="stylesheet" href="menu.2.css">
<link type="text/css" rel="stylesheet" href="updateMember.css">
		<div id="aside">
			<h2 class="aside-tit">MY PAGE</h2>
			<div class="lnb-wrap">
				<div class="lnb-bx">
					<h2 class="txt txt1">SHOPPING INFO</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a
								href="/shop/mypage.html?mypage_type=myorder">주문내역</a></li>
							<li><a href="/shop/mypage.html?mypage_type=mycoupon">쿠폰내역</a></li>
							<li><a href="/shop/mypage.html?mypage_type=myreserve">적립금내역</a></li>
							<li><a href="/shop/todaygoods.html">오늘본상품</a></li>
							<li><a href="/shop/mypage.html?mypage_type=mywishlist">상품
									보관함</a></li>
							<!-- <li class="attandance"><a href=""><strong>출석체크</strong></a></li>-->
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt2">SHOPPING QUESTION</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a
								href="/shop/mypage.html?mypage_type=myarticle">내 게시글 보기</a></li>
							<li><a href="/shop/mypage.html?mypage_type=myemail">E-mail
									문의</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt3">CUSTOMER INFO</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a href="/shop/idinfo.html">회원정보변경</a></li>
							<li><a href="javascript:userexit();">회원정보탈퇴신청</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- .lnb-wrap -->
		</div>
		<!-- #aside -->
	</div>
	<!-- //mheader -->
	<script type="text/javascript"
		src="/shopimages/nasign/template/work/33865/header.1.js?t=202010231550"></script>
	<div id="contentWrapper">
		<div id="contentWrap">

			<link type="text/css" rel="stylesheet"
				href="/template_common/shop/basic_simple/menu.1.css?t=201711221039" />
			<div id="content">
				<div id="join">
					<div class="cateTit_v2 join">
						<em class="title">회원정보 입력</em>
					</div>

					<form name="iddupop" method="post" action="/shop/iddup.html">
						<input name="id" type="hidden" value="" /> <input name="mode"
							type="hidden" value="" />
					</form>
					<form name="ipinInForm" method="post">
						<input type="hidden" name="IDPCODE" value="" /> <input
							type="hidden" name="IDPURL" value="" /> <input type="hidden"
							name="CPCODE" value="" /> <input type="hidden"
							name="CPREQUESTNUM" value="" /> <input type="hidden"
							name="RETURNURL" value="" /> <input type="hidden"
							name="WEBPUBKEY" value="" /> <input type="hidden"
							name="WEBSIGNATURE" value="" /> <input type="hidden"
							name="FILLER01" value="" /> <input type="hidden" name="FILLER02"
							value="JOIN" />
					</form>
					<form name="ipinOutForm" method="post"
						action="/ssllogin/idinfo.html?secure_type=script">
						<input type="hidden" name="popup" value="" /> <input
							type="hidden" name="cur_page" value="" /> <input type="hidden"
							name="type" value="ok" /> <input type="hidden" name="ipintype"
							value="" /> <input type="hidden" name="brandcode" value="">
						<input type="hidden" name="first" value=""> <input
							type="hidden" name="data_third_party_agree" value="" /> <input
							type="hidden" name="data_trust_agree" value="" /> <input
							type="hidden" name="data_privacy_agree" value="" /> <input
							type="hidden" name="realname" /> <input type="hidden"
							name="encdata" /> <input type="hidden" name="member_type"
							value="PERSON" />
					</form>
					<form name="form1" method="post" id="join_form"
						action="/shop/idinfo.html" enctype='multipart/form-data'
						autocomplete="off">
						<input type="hidden" name="resno" value="" /> <input
							type="hidden" name="cur_page" value="" /> <input type="hidden"
							name="brandcode" value="" /> <input type="hidden" name="sslid"
							value="nasign" /> <input type="hidden" name="sslip"
							value="www.oryany.co.kr" /> <input type="hidden" name="haddress"
							id="haddress" value="" /> <input type="hidden"
							name="msecure_key" value="" /> <input type="hidden"
							name="loginkeyid" value="" /> <input type="hidden"
							name="idcheck" value="" /> <input type="hidden"
							name="emailcheck"> <input type="hidden"
							name="junk_member_ok" value="" /> <input type="hidden"
							name="hiddenres" value="1670b14728ad9902aecba32e22fa4f6bd" /> <input
							type="hidden" name="mem_type" value="PERSON"> <input
							type="hidden" name="member_join_type" value="NEW" /> <input
							type="hidden" name="member_join_minor" value="N" /> <input
							type="hidden" name="use_company_num" value="Y" /> <input
							type="hidden" name="company_num_modify" value="N" /> <input
							type="hidden" name="admin_type" value="N" /> <input
							type="hidden" name="old_company_num1" value=""> <input
							type="hidden" name="old_company_num2" value=""> <input
							type="hidden" name="old_company_num3" value=""> <input
							type="hidden" name="old_email" id="old_email" value=""> <input
							type="hidden" name="etc_phone" id="etc_phone" value="" /> <input
							type="hidden" name="simple_login" value="" /> <input
							type="hidden" name="app_os" value="" /> <input type="hidden"
							name="return_url" value=""> <input type="hidden"
							name="type" value="upd" /> <input type="hidden" name="reurl"
							value="" />
						<!-- 일반회원 기본 노출 -->
						<div id="personInfo">
							<table class="person-tb">
								<colgroup>
									<col style="width: 155px;" />
									<col style="width: auto;" />
								</colgroup>
								<tr>
									<th>
										<div class="head-cell">
											<span class="empha">*</span>이름
										</div>
									</th>
									<td>
										<div class="col-cell">
											<input type="text" name="hname" id="hname" value="한상빈"
												class="MS_input_txt normal-input" size="15" maxlength="30" />
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="head-cell">
											<span class="empha">*</span>아이디
										</div>
									</th>
									<td>
										<div class="col-cell">
											nh@adef10a <input type="hidden" name="id" id="id" value="" />
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="head-cell">
											<span class="empha">*</span>비밀번호
										</div>
									</th>
									<td>
										<div class="col-cell">
											<input type="password" name="password1" id="password1"
												class="MS_input_txt normal-input" value="" size="15"
												maxlength="20" onkeyup="check_pwd_length(this, 'password');" />
											<span class="idpw-info"> * 비밀번호는 4~16자로 입력해 주세요. </span>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="head-cell">
											<span class="empha">*</span>비밀번호 확인
										</div>
									</th>
									<td>
										<div class="col-cell">
											<input type="password" name="password2" id="password2"
												class="MS_input_txt normal-input" value="" size="15"
												maxlength="20"
												onkeyup="check_pwd_length(this, 'repassword');" />
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="head-cell">
											<span class="empha">*</span>생년월일
										</div>
									</th>
									<td>
										<div class="col-cell social">
											<select name="birthyear" disabled
												class="MS_select MS_birthday">
												<option value="">선택</option>
												<option value="01">1</option>
											</select>년<select name="birthmonth" class="MS_select MS_birthday"
												disabled>
												<option value="">선택</option>
												<option value="01" selected="selected">1</option>
												<option value="02">2</option>
												<option value="03">3</option>
											</select>월<select name="birthdate" class="MS_select MS_birthday"
												disabled>
												<option value="">선택</option>
												<option value="01">1</option>
												<option value="02">2</option>
											</select>일&nbsp;&nbsp;<input type="radio" name="sex" value="1" checked
												class="MS_radio" />남 <input type="radio" name="sex"
												value="2" class="MS_radio" disabled />여
										</div>
									</td>
								</tr>

								<tr>
									<th>
										<div class="head-cell">
											<span class="empha">*</span>우편번호
										</div>
									</th>
									<td>
										<div class="col-cell">
											<input type="text" name="hpost" form="join_form" id="hpost"
												class="MS_input_txt small-input" value="" size="7"
												maxlength="15" readonly /> <a href="javascript:post(1);"
												class="cbtn form">우편번호검색</a>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="head-cell">
											<span class="empha">*</span>집주소
										</div>
									</th>
									<td>
										<div class="col-cell">
											<input type="text" name="haddress1" form="join_form"
												id="haddress1" class="MS_input_txt large-input" value=""
												size='40' maxlength="100" readonly="readonly" />
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="head-cell">
											<span class="empha">*</span>상세주소
										</div>
									</th>
									<td>
										<div class="col-cell">
											<input type="text" name="haddress2" form="join_form"
												id="haddress2" class="MS_input_txt large-input" value=""
												size='40' maxlength="100" />
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="head-cell">
											<span class="empha">*</span>연락처
										</div>
									</th>
									<td>
										<div class="col-cell">
											<input type="text" name="hphone" form="join_form" id="hphone"
												class="MS_input_tel normal-input" size="15" maxlength="30"
												value="" />
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="head-cell">
											<span class="empha">*</span>이메일
										</div>
									</th>
									<td>
										<div class="col-cell email-area">
											<input type="hidden" name="oldemail" value="" /> <input
												type="text" name="email" id="email"
												class="MS_input_txt MS_input_txt06 normal-input" size="20"
												maxlength="35" id="email" value=""
												onchange="this.form.emailcheck.value=''" /> <a
												href="javascript:emailcheck('N', 'N');" class="cbtn form">이메일
												중복확인</a>
										</div>
									</td>
								</tr>
								<tr>
									<th><div class="head-cell">회사전화</div></th>
									<td>
										<div class="col-cell">
											<input type="text" name="ophone" id="ophone"
												class="MS_input_tel normal-input" size="15" maxlength="30"
												value="" />
										</div>
									</td>
								</tr>
								<tr>
									<th><div class="head-cell">회사주소</div></th>
									<td>
										<div class="col-cell">
											<ul>
												<li style="margin-bottom: 13px;"><input type="text"
													name="opost" id="opost" class="MS_input_txt small-input"
													value="" size="7" maxlength="15" readonly /> <a
													href="javascript:post(2);" class="cbtn form">우편번호검색</a></li>
												<li><input type="text" name="oaddress" id="oaddress"
													class="MS_input_txt normal-input" value="" size="40"
													maxlength="100" /></li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="head-cell">휴대폰</div>
									</th>
									<td>
										<div class="col-cell">
											<input type="text" name="etcphone" form="join_form"
												id="etcphone" class="MS_input_tel normal-input" size="15"
												maxlength="30" value="" />
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="head-cell">뉴스메일</div>
									</th>
									<td>
										<div class="col-cell">
											<label style="margin-right: 20px;"> <input
												type="radio" name="emailreceive" value="Y" /> 받습니다.
											</label> <label> <input type="radio" name="emailreceive"
												value="N" checked /> 받지 않습니다.
											</label>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="head-cell">SMS안내</div>
									</th>
									<td>
										<div class="col-cell">
											<label style="margin-right: 20px;"> <input
												type="radio" name="smsreceive" form="join_form" value="Y"
												checked /> 받습니다.
											</label> <label> <input type="radio" name="smsreceive"
												form="join_form" value="N" /> 받지 않습니다.
											</label>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="head-cell">앱Push알림</div>
									</th>
									<td>
										<div class="col-cell">
											<label style="margin-right: 20px;"> <input
												type="radio" name="pushreceive" form="join_form" value="Y" />
												받습니다.
											</label> <label> <input type="radio" name="pushreceive"
												form="join_form" value="N" checked /> 받지 않습니다.
											</label>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<!-- #personInfo -->



						<ul id="snsConnect">
							<li class="naver">
								<dl>
									<dt>네이버</dt>
									<dd>
										연동완료 <a class="cut" href="javascript:sns_disconnect('NH');"><img
											src="/images/d3/modern_simple/btn/h9_close.gif" alt="연결 끊기" /></a>
									</dd>
								</dl>
							</li>
							<li class="kakaotalk">
								<dl>
									<dt>카카오</dt>
									<dd>
										<a href="/list/API/login_kakao.html?sns_action=connect"><img
											src="/images/d3/modern_simple/btn/h26_connect.gif" alt="연결하기" /></a>
									</dd>
								</dl>
							</li>
						</ul>
						<!-- #snsConnect -->

						<div class="btnArea join-footer">
							<a href="javascript:send();" class="cbtn form action"> 수정하기 </a>
							<a href="Javascript:history.back()" class="cbtn form">취소하기</a>
						</div>
						<!-- use_contract -->
					</form>
				</div>
				<!-- #join -->
			</div>
			<!-- #content -->
		</div>
		<!-- #contentWrap -->
	</div>
	<!-- #contentWrapper-->
	<hr />





	<!-- Shoping Cart 끝 -->







	<jsp:include page="../footer.jsp" />