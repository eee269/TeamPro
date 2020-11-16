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
<link type="text/css" rel="stylesheet" href="../scss/join_simple.css" />
<link type="text/css" rel="stylesheet" href="../scss/header.1.css" />
<link type="text/css" rel="stylesheet" href="../scss/menu.1.css" />
<style type="text/css">

/* 약관 동의 */
#chkwrap .tb-l { text-align: left; }
#chkwrap .tb-c { text-align: center; }
#chkwrap .pl-30 { padding-left: 15px; }
#chkwrap .pl-6 { padding-left: 6px; }
#chkwrap .pt-10 { padding-top:10px; }
#chkwrap .pb-10 { padding-bottom:10px; }
#chkwrap .ml-30 { margin-left:30px; }
#chkwrap .p10 { padding:10px; }
#chkwrap { border:1px solid #dedede; background: #ffffff; }
#chkwrap .all-chk { height:43px; line-height:45px; padding-left:20px; font-size:14px; font-weight:bold; color:#000; border-bottom:1px solid #dedede; }
#chkwrap .all-chk .input-cbox { width:14px; height:14px; *margin-top:0; } 
#chkwrap .cont ul:after { clear: both; content: ""; display: block; }
#chkwrap .cont ul { width: 600px; }
#chkwrap .cont ul li { float:left; width:270px; line-height:18px; }
#chkwrap .cont ul li a { display:inline-block; width:60px; height:16px; line-height:20px; *line-height:18px; margin-top:-2px; font-weight:normal; font-size:11px; border:1px solid #bdbec7; background:#fafafa; text-align:center; }
#chkwrap .cont strong { color:#000; }
#chkwrap .cont label { font-weight:bold; }
#chkwrap .cont .marketing { padding-left:30px; border-top:1px dashed #dadada; line-height:18px; }
#chkwrap .cont .marketing .mk-wrap { height:44px; line-height:46px; }
#chkwrap .cont .marketing .mk-wrap input { margin-top:-1px; *margin-top:0; }

.new-btn-area { text-align: center; margin:20px 0 0; padding-bottom:30px; border-bottom:1px solid #ececec; }
.new-btn-area a { display:block; width:234px; height:64px; line-height:66px; margin:0 auto; font-size:22px; font-weight:bold; color:#fff; background:#0549bb; border:1px solid #053688; }
h4.tit { margin-top: 50px; margin-bottom: 5px; padding-left:5px; font-size: 14px; font-weight: bold; }

/* 이용 약관 */
/* 개인정보 수집이용, 제3제공, 취급위탁 테이블 */
.new-privercy-contract .p10 { padding:10px; }
.new-privercy-contract textarea { width:97%; height: 70px; }
.new-privercy-contract .contract-tbl { width:100%; border-spacing:0; border-collapse:collapse; }
.new-privercy-contract .contract-tbl th,
.new-privercy-contract .contract-tbl td { border:1px solid #e0e0e0; text-align:center; }
.new-privercy-contract .contract-tbl th { background: #fcfcfc; }
.new-privercy-contract .contract-tbl th div { height:41px; line-height:43px; }
.new-privercy-contract .contract-tbl tbody th { font-weight:normal; }

.btm-msg { padding-top:30px; line-height:18px; }

</style>
		<!-- 사이트 시작 -->

		<div id="content">

			<div id="join_test">
				<div class="cateTit_v2 join">
					<em class="title">회원정보 입력</em>
				</div>
				<div class="page-body">
					<form name="iddupop" method="post" action="/shop/iddup.html">
						<input name="id" type="hidden" value=""> <input
							name="mode" type="hidden" value="">
					</form>
					<form name="ipinInForm" method="post">
						<input type="hidden" name="IDPCODE" value=""> <input
							type="hidden" name="IDPURL" value=""> <input
							type="hidden" name="CPCODE" value=""> <input
							type="hidden" name="CPREQUESTNUM" value=""> <input
							type="hidden" name="RETURNURL" value=""> <input
							type="hidden" name="WEBPUBKEY" value=""> <input
							type="hidden" name="WEBSIGNATURE" value=""> <input
							type="hidden" name="FILLER01" value=""> <input
							type="hidden" name="FILLER02" value="JOIN">
					</form>
					<form name="ipinOutForm" method="post"
						action="/ssllogin/idinfo.html?secure_type=script">
						<input type="hidden" name="popup" value=""> <input
							type="hidden" name="cur_page" value=""> <input
							type="hidden" name="type" value="ok"> <input
							type="hidden" name="ipintype" value=""> <input
							type="hidden" name="brandcode" value=""> <input
							type="hidden" name="first" value=""> <input type="hidden"
							name="data_third_party_agree" value=""> <input
							type="hidden" name="data_trust_agree" value=""> <input
							type="hidden" name="data_privacy_agree" value=""> <input
							type="hidden" name="realname"> <input type="hidden"
							name="encdata"> <input type="hidden" name="member_type"
							value="SIMPLE">
					</form>
					<form name="form1" method="post" id="join_form"
						action="/shop/idinfo.html" enctype="multipart/form-data"
						autocomplete="off">
						<input type="hidden" name="resno" value=""> <input
							type="hidden" name="cur_page" value=""> <input
							type="hidden" name="brandcode" value=""> <input
							type="hidden" name="sslid" value="nasign"> <input
							type="hidden" name="sslip" value="oryany.co.kr"> <input
							type="hidden" name="haddress" id="haddress" value=""> <input
							type="hidden" name="msecure_key" value=""> <input
							type="hidden" name="loginkeyid" value=""> <input
							type="hidden" name="idcheck" value=""> <input
							type="hidden" name="emailcheck"> <input type="hidden"
							name="junk_member_ok" value=""> <input type="hidden"
							name="hiddenres" value=""> <input type="hidden"
							name="mem_type" value="SIMPLE"> <input type="hidden"
							name="member_join_type" value="NEW"> <input type="hidden"
							name="member_join_minor" value="N"> <input type="hidden"
							name="use_company_num" value="Y"> <input type="hidden"
							name="company_num_modify" value="N"> <input type="hidden"
							name="admin_type" value="N"> <input type="hidden"
							name="old_company_num1" value=""> <input type="hidden"
							name="old_company_num2" value=""> <input type="hidden"
							name="old_company_num3" value=""> <input type="hidden"
							name="old_email" id="old_email" value=""> <input
							type="hidden" name="etc_phone" id="etc_phone" value=""> <input
							type="hidden" name="simple_login" value=""> <input
							type="hidden" name="app_os" value=""> <input
							type="hidden" name="return_url" value=""> <input
							type="hidden" name="smscheck" form="join_form"> <input
							type="hidden" name="sms_auth_chk" form="join_form" value="N"><input
							type="hidden" name="type" value="ins"> <input
							type="hidden" name="first" value=""> <input type="hidden"
							name="join_type" value=""> <input type="hidden"
							name="data_third_party_agree" value=""> <input
							type="hidden" name="data_trust_agree" value=""> <input
							type="hidden" name="data_privacy_agree" value=""><input
							type="hidden" name="original_mem_type" value="PERSON">
						<div class="box-wrap">
							<ul class="join-form">
								<li><label>이름</label> <input type="text" name="hname"
									id="hname" value=""
									class="MS_input_txt w137 txt-input input-label" size="15"
									maxlength="30"></li>
								<li><label>아이디</label> <input type="text" name="id" id="id"
									value="" class="MS_input_txt w137 txt-input input-label"
									size="10" maxlength="12"></li>
								<li><label>비밀번호</label> <input type="password"
									name="password1" id="password1"
									class="MS_input_txt w137 txt-input input-label" value=""
									size="15" maxlength="20"
									onkeyup="check_pwd_length(this, 'password');"></li>
								<li><label>비밀번호 확인</label> <input type="password"
									name="password2" id="password2"
									class="MS_input_txt w137 txt-input input-label" value=""
									size="15" maxlength="20"
									onkeyup="check_pwd_length(this, 'repassword');"></li>
								<li><label>이메일</label> <input type="hidden" name="oldemail"
									value=""> <input type="text" name="email" id="email"
									class="MS_input_txt MS_input_txt06 w137 txt-input input-label"
									size="20" maxlength="35" value=""
									onchange="this.form.emailcheck.value=''"></li>
								<li class="birth">
									<dl class="type1">
										<dd>
											<select name="birthyear" class="new-birth" sb="90696028"
												style="display: none;">
												<option value="">생년</option>
												<option value="1920">1920</option>
												<option value="1921">1921</option>
												<option value="1922">1922</option>
												<option value="1923">1923</option>
												<option value="1924">1924</option>
												<option value="1925">1925</option>
												<option value="1926">1926</option>
												<option value="1927">1927</option>
												<option value="1928">1928</option>
												<option value="1929">1929</option>
												<option value="1930">1930</option>
												<option value="1931">1931</option>
												<option value="1932">1932</option>
												<option value="1933">1933</option>
												<option value="1934">1934</option>
												<option value="1935">1935</option>
												<option value="1936">1936</option>
												<option value="1937">1937</option>
												<option value="1938">1938</option>
												<option value="1939">1939</option>
												<option value="1940">1940</option>
												<option value="1941">1941</option>
												<option value="1942">1942</option>
												<option value="1943">1943</option>
												<option value="1944">1944</option>
												<option value="1945">1945</option>
												<option value="1946">1946</option>
												<option value="1947">1947</option>
												<option value="1948">1948</option>
												<option value="1949">1949</option>
												<option value="1950">1950</option>
												<option value="1951">1951</option>
												<option value="1952">1952</option>
												<option value="1953">1953</option>
												<option value="1954">1954</option>
												<option value="1955">1955</option>
												<option value="1956">1956</option>
												<option value="1957">1957</option>
												<option value="1958">1958</option>
												<option value="1959">1959</option>
												<option value="1960">1960</option>
												<option value="1961">1961</option>
												<option value="1962">1962</option>
												<option value="1963">1963</option>
												<option value="1964">1964</option>
												<option value="1965">1965</option>
												<option value="1966">1966</option>
												<option value="1967">1967</option>
												<option value="1968">1968</option>
												<option value="1969">1969</option>
												<option value="1970">1970</option>
												<option value="1971">1971</option>
												<option value="1972">1972</option>
												<option value="1973">1973</option>
												<option value="1974">1974</option>
												<option value="1975">1975</option>
												<option value="1976">1976</option>
												<option value="1977">1977</option>
												<option value="1978">1978</option>
												<option value="1979">1979</option>
												<option value="1980">1980</option>
												<option value="1981">1981</option>
												<option value="1982">1982</option>
												<option value="1983">1983</option>
												<option value="1984">1984</option>
												<option value="1985">1985</option>
												<option value="1986">1986</option>
												<option value="1987">1987</option>
												<option value="1988">1988</option>
												<option value="1989">1989</option>
												<option value="1990">1990</option>
												<option value="1991">1991</option>
												<option value="1992">1992</option>
												<option value="1993">1993</option>
												<option value="1994">1994</option>
												<option value="1995">1995</option>
												<option value="1996">1996</option>
												<option value="1997">1997</option>
												<option value="1998">1998</option>
												<option value="1999">1999</option>
												<option value="2000">2000</option>
												<option value="2001">2001</option>
												<option value="2002">2002</option>
												<option value="2003">2003</option>
												<option value="2004">2004</option>
												<option value="2005">2005</option>
												<option value="2006">2006</option>
												<option value="2007">2007</option>
												<option value="2008">2008</option>
												<option value="2009">2009</option>
												<option value="2010">2010</option>
												<option value="2011">2011</option>
												<option value="2012">2012</option>
												<option value="2013">2013</option>
												<option value="2014">2014</option>
												<option value="2015">2015</option>
												<option value="2016">2016</option>
												<option value="2017">2017</option>
												<option value="2018">2018</option>
												<option value="2019">2019</option>
												<option value="2020">2020</option>
											</select>
											<div id="sbHolder_90696028" class="sbHolder" tabindex="0">
												<a id="sbToggle_90696028" href="#" class="sbToggle"></a><a
													id="sbSelector_90696028" href="#" class="sbSelector">생년</a>
												<ul id="sbOptions_90696028" class="sbOptions"
													style="display: none;">
													<li><a href="#" rel="" class="sbFocus">생년</a></li>
													<li><a href="#1920" rel="1920">1920</a></li>
													<li><a href="#1921" rel="1921">1921</a></li>
													<li><a href="#1922" rel="1922">1922</a></li>
													<li><a href="#1923" rel="1923">1923</a></li>
													<li><a href="#1924" rel="1924">1924</a></li>
													<li><a href="#1925" rel="1925">1925</a></li>
													<li><a href="#1926" rel="1926">1926</a></li>
													<li><a href="#1927" rel="1927">1927</a></li>
													<li><a href="#1928" rel="1928">1928</a></li>
													<li><a href="#1929" rel="1929">1929</a></li>
													<li><a href="#1930" rel="1930">1930</a></li>
													<li><a href="#1931" rel="1931">1931</a></li>
													<li><a href="#1932" rel="1932">1932</a></li>
													<li><a href="#1933" rel="1933">1933</a></li>
													<li><a href="#1934" rel="1934">1934</a></li>
													<li><a href="#1935" rel="1935">1935</a></li>
													<li><a href="#1936" rel="1936">1936</a></li>
													<li><a href="#1937" rel="1937">1937</a></li>
													<li><a href="#1938" rel="1938">1938</a></li>
													<li><a href="#1939" rel="1939">1939</a></li>
													<li><a href="#1940" rel="1940">1940</a></li>
													<li><a href="#1941" rel="1941">1941</a></li>
													<li><a href="#1942" rel="1942">1942</a></li>
													<li><a href="#1943" rel="1943">1943</a></li>
													<li><a href="#1944" rel="1944">1944</a></li>
													<li><a href="#1945" rel="1945">1945</a></li>
													<li><a href="#1946" rel="1946">1946</a></li>
													<li><a href="#1947" rel="1947">1947</a></li>
													<li><a href="#1948" rel="1948">1948</a></li>
													<li><a href="#1949" rel="1949">1949</a></li>
													<li><a href="#1950" rel="1950">1950</a></li>
													<li><a href="#1951" rel="1951">1951</a></li>
													<li><a href="#1952" rel="1952">1952</a></li>
													<li><a href="#1953" rel="1953">1953</a></li>
													<li><a href="#1954" rel="1954">1954</a></li>
													<li><a href="#1955" rel="1955">1955</a></li>
													<li><a href="#1956" rel="1956">1956</a></li>
													<li><a href="#1957" rel="1957">1957</a></li>
													<li><a href="#1958" rel="1958">1958</a></li>
													<li><a href="#1959" rel="1959">1959</a></li>
													<li><a href="#1960" rel="1960">1960</a></li>
													<li><a href="#1961" rel="1961">1961</a></li>
													<li><a href="#1962" rel="1962">1962</a></li>
													<li><a href="#1963" rel="1963">1963</a></li>
													<li><a href="#1964" rel="1964">1964</a></li>
													<li><a href="#1965" rel="1965">1965</a></li>
													<li><a href="#1966" rel="1966">1966</a></li>
													<li><a href="#1967" rel="1967">1967</a></li>
													<li><a href="#1968" rel="1968">1968</a></li>
													<li><a href="#1969" rel="1969">1969</a></li>
													<li><a href="#1970" rel="1970">1970</a></li>
													<li><a href="#1971" rel="1971">1971</a></li>
													<li><a href="#1972" rel="1972">1972</a></li>
													<li><a href="#1973" rel="1973">1973</a></li>
													<li><a href="#1974" rel="1974">1974</a></li>
													<li><a href="#1975" rel="1975">1975</a></li>
													<li><a href="#1976" rel="1976">1976</a></li>
													<li><a href="#1977" rel="1977">1977</a></li>
													<li><a href="#1978" rel="1978">1978</a></li>
													<li><a href="#1979" rel="1979">1979</a></li>
													<li><a href="#1980" rel="1980">1980</a></li>
													<li><a href="#1981" rel="1981">1981</a></li>
													<li><a href="#1982" rel="1982">1982</a></li>
													<li><a href="#1983" rel="1983">1983</a></li>
													<li><a href="#1984" rel="1984">1984</a></li>
													<li><a href="#1985" rel="1985">1985</a></li>
													<li><a href="#1986" rel="1986">1986</a></li>
													<li><a href="#1987" rel="1987">1987</a></li>
													<li><a href="#1988" rel="1988">1988</a></li>
													<li><a href="#1989" rel="1989">1989</a></li>
													<li><a href="#1990" rel="1990">1990</a></li>
													<li><a href="#1991" rel="1991">1991</a></li>
													<li><a href="#1992" rel="1992">1992</a></li>
													<li><a href="#1993" rel="1993">1993</a></li>
													<li><a href="#1994" rel="1994">1994</a></li>
													<li><a href="#1995" rel="1995">1995</a></li>
													<li><a href="#1996" rel="1996">1996</a></li>
													<li><a href="#1997" rel="1997">1997</a></li>
													<li><a href="#1998" rel="1998">1998</a></li>
													<li><a href="#1999" rel="1999">1999</a></li>
													<li><a href="#2000" rel="2000">2000</a></li>
													<li><a href="#2001" rel="2001">2001</a></li>
													<li><a href="#2002" rel="2002">2002</a></li>
													<li><a href="#2003" rel="2003">2003</a></li>
													<li><a href="#2004" rel="2004">2004</a></li>
													<li><a href="#2005" rel="2005">2005</a></li>
													<li><a href="#2006" rel="2006">2006</a></li>
													<li><a href="#2007" rel="2007">2007</a></li>
													<li><a href="#2008" rel="2008">2008</a></li>
													<li><a href="#2009" rel="2009">2009</a></li>
													<li><a href="#2010" rel="2010">2010</a></li>
													<li><a href="#2011" rel="2011">2011</a></li>
													<li><a href="#2012" rel="2012">2012</a></li>
													<li><a href="#2013" rel="2013">2013</a></li>
													<li><a href="#2014" rel="2014">2014</a></li>
													<li><a href="#2015" rel="2015">2015</a></li>
													<li><a href="#2016" rel="2016">2016</a></li>
													<li><a href="#2017" rel="2017">2017</a></li>
													<li><a href="#2018" rel="2018">2018</a></li>
													<li><a href="#2019" rel="2019">2019</a></li>
													<li><a href="#2020" rel="2020">2020</a></li>
												</ul>
											</div>
										</dd>
										<dd>
											<select name="birthmonth" class="new-birth" sb="74155714"
												style="display: none;">
												<option value="">월</option>
												<option value="01">1</option>
												<option value="02">2</option>
												<option value="03">3</option>
												<option value="04">4</option>
												<option value="05">5</option>
												<option value="06">6</option>
												<option value="07">7</option>
												<option value="08">8</option>
												<option value="09">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
											</select>
											<div id="sbHolder_74155714" class="sbHolder" tabindex="0">
												<a id="sbToggle_74155714" href="#" class="sbToggle"></a><a
													id="sbSelector_74155714" href="#" class="sbSelector">월</a>
												<ul id="sbOptions_74155714" class="sbOptions"
													style="display: none;">
													<li><a href="#" rel="" class="sbFocus">월</a></li>
													<li><a href="#01" rel="01">1</a></li>
													<li><a href="#02" rel="02">2</a></li>
													<li><a href="#03" rel="03">3</a></li>
													<li><a href="#04" rel="04">4</a></li>
													<li><a href="#05" rel="05">5</a></li>
													<li><a href="#06" rel="06">6</a></li>
													<li><a href="#07" rel="07">7</a></li>
													<li><a href="#08" rel="08">8</a></li>
													<li><a href="#09" rel="09">9</a></li>
													<li><a href="#10" rel="10">10</a></li>
													<li><a href="#11" rel="11">11</a></li>
													<li><a href="#12" rel="12">12</a></li>
												</ul>
											</div>
										</dd>
										<dd>
											<select name="birthdate" class="new-birth" sb="26627970"
												style="display: none;">
												<option value="">일</option>
												<option value="01">1</option>
												<option value="02">2</option>
												<option value="03">3</option>
												<option value="04">4</option>
												<option value="05">5</option>
												<option value="06">6</option>
												<option value="07">7</option>
												<option value="08">8</option>
												<option value="09">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
												<option value="13">13</option>
												<option value="14">14</option>
												<option value="15">15</option>
												<option value="16">16</option>
												<option value="17">17</option>
												<option value="18">18</option>
												<option value="19">19</option>
												<option value="20">20</option>
												<option value="21">21</option>
												<option value="22">22</option>
												<option value="23">23</option>
												<option value="24">24</option>
												<option value="25">25</option>
												<option value="26">26</option>
												<option value="27">27</option>
												<option value="28">28</option>
												<option value="29">29</option>
												<option value="30">30</option>
												<option value="31">31</option>
											</select>
											<div id="sbHolder_26627970" class="sbHolder" tabindex="0">
												<a id="sbToggle_26627970" href="#" class="sbToggle"></a><a
													id="sbSelector_26627970" href="#" class="sbSelector">일</a>
												<ul id="sbOptions_26627970" class="sbOptions"
													style="display: none;">
													<li><a href="#" rel="" class="sbFocus">일</a></li>
													<li><a href="#01" rel="01">1</a></li>
													<li><a href="#02" rel="02">2</a></li>
													<li><a href="#03" rel="03">3</a></li>
													<li><a href="#04" rel="04">4</a></li>
													<li><a href="#05" rel="05">5</a></li>
													<li><a href="#06" rel="06">6</a></li>
													<li><a href="#07" rel="07">7</a></li>
													<li><a href="#08" rel="08">8</a></li>
													<li><a href="#09" rel="09">9</a></li>
													<li><a href="#10" rel="10">10</a></li>
													<li><a href="#11" rel="11">11</a></li>
													<li><a href="#12" rel="12">12</a></li>
													<li><a href="#13" rel="13">13</a></li>
													<li><a href="#14" rel="14">14</a></li>
													<li><a href="#15" rel="15">15</a></li>
													<li><a href="#16" rel="16">16</a></li>
													<li><a href="#17" rel="17">17</a></li>
													<li><a href="#18" rel="18">18</a></li>
													<li><a href="#19" rel="19">19</a></li>
													<li><a href="#20" rel="20">20</a></li>
													<li><a href="#21" rel="21">21</a></li>
													<li><a href="#22" rel="22">22</a></li>
													<li><a href="#23" rel="23">23</a></li>
													<li><a href="#24" rel="24">24</a></li>
													<li><a href="#25" rel="25">25</a></li>
													<li><a href="#26" rel="26">26</a></li>
													<li><a href="#27" rel="27">27</a></li>
													<li><a href="#28" rel="28">28</a></li>
													<li><a href="#29" rel="29">29</a></li>
													<li><a href="#30" rel="30">30</a></li>
													<li><a href="#31" rel="31">31</a></li>
												</ul>
											</div>
										</dd>
									</dl>
								</li>
								<li class="gender">&nbsp;<label><input type="radio"
										name="sex" value="1" class="input-radio"> 남</label> <label><input
										type="radio" name="sex" value="2" class="input-radio"
										checked=""> 여</label>
								</li>
								<li><label>휴대폰번호</label> <input type="text" name="etcphone"
									form="join_form" id="etcphone"
									class="MS_input_tel w137 txt-input input-label" size="15"
									maxlength="30" value="">
									<div id="sms_btn">
										<a href="javascript:smscheck();" class="cbtn form">인증</a>
									</div>
									<div id="resms_btn" style="display: none">
										<a href="javascript:smscheck('re');" class="cbtn form">재인증</a>
									</div></li>
								<li><label>SMS 인증번호</label> <input type="text"
									class="txt-input MS_input_sms input-label" value=""
									name="sms_auth_key" form="join_form">
									<div class="sms_num">
										<a href="javascript:smskey_check();" class="cbtn form">확인</a>
									</div></li>
								<li style="display: none">뉴스메일 <label
									style="margin-right: 20px;"> <input type="radio"
										name="emailreceive" value="Y" disabled="" checked="">
										받습니다.
								</label> <label> <input type="radio" name="emailreceive"
										value="N" disabled="" checked=""> 받지 않습니다.
								</label>
								</li>
								<li style="display: none">SMS 안내 <label
									style="margin-right: 20px;"> <input type="radio"
										name="smsreceive" form="join_form" value="Y" disabled=""
										checked=""> 받습니다.
								</label> <label> <input type="radio" name="smsreceive"
										form="join_form" value="N" disabled="" checked=""> 받지
										않습니다.
								</label>
								</li>
							</ul>
							<ul class="join-msg">
								<li style="padding-bottom: 5px; color: #ac5e85;"><label>
										<input type="checkbox" name="user_age_check" value="Y">
										14세 이상입니다. (필수)
								</label></li>
								<li>회원가입에 필요한 최소한의 정보만 입력 받음으로써, 고객님의 개인정보 수집을 최소화하고 편리한
									회원가입을 제공합니다.</li>
							</ul>
							<fieldset>
								<legend>약관 동의 폼</legend>
								<div class="new-privercy-contract">
									<div id="chkwrap">
										<div class="all-chk">
											<label><input type="checkbox" name="every_agree"
												id="every_agree" value="all"
												class="input-cbox new_every_agree"> 전체동의</label> <input
												type="hidden" name="allnew_agree" id="allnew_agree"
												value="Y">
										</div>
										<div class="cont p10">
											<ul>
												<li class="ml-30 pt-10"><label><input
														type="checkbox" name="yaok2" id="yaok2" value="Y"
														class="input-cbox every_agree"> 이용약관</label> <a
													href="#chk_cont1">내용보기</a></li>
												<li class="ml-30 pt-10"><label><input
														type="checkbox" name="privacy1" id="privacy1"
														value="agree_uidB" class="input-cbox every_agree">
														개인정보 수집 및 이용 안내</label> <a href="#chk_cont2">내용보기</a></li>


											</ul>
											<div class="marketing pb-10">
												<div class="mk-wrap">
													<label class="mk-all"><input type="checkbox"
														name="ad_every_agree" id="ad_every_agree" value="ad_all"
														class="input-cbox every_agree new_every_agree"> <strong>마케팅
															수신동의</strong></label>&nbsp; ( <label><input type="checkbox"
														name="ADemail_" id="ADemail_" value="ADemail_"
														class="input-cbox every_agree ad_every_agree"> 이메일</label>
													<label class="pl-30"><input type="checkbox"
														name="ADsms_" id="ADsms_" value="ADsms_"
														class="input-cbox every_agree ad_every_agree"> SMS</label>
													<label class="pl-30"><input type="checkbox"
														name="ADpush_" id="ADpush_" value="ADpush_"
														class="input-cbox every_agree ad_every_agree">
														앱Push알림</label>)
												</div>
												쇼핑몰에서 제공하는 신상품 소식/ 할인쿠폰을 무상으로 보내드립니다!<br> 단, 상품 구매 정보는
												수신동의 여부 관계없이 발송됩니다.<br> <strong>제공 동의를 하지 않으셔도
													서비스 이용에는 문제가 없습니다.</strong>
											</div>
										</div>
									</div>
									<div class="new-btn-area">
										<a href="javascript:send();">동의하고 가입완료</a>
									</div>
									<h4 class="tit" id="chk_cont1">이용약관</h4>
									<div class="privercy-contract">
										<textarea cols="80" wrap="off" rows="10" readonly="">인터넷 쇼핑몰 『(주)내자인 사이버 몰』회원 약관

제1조(목적)
이 약관은 (주)내자인 회사(전자상거래 사업자)가 운영하는 (주)내자인 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.

  ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」

제2조(정의)
① “몰”이란 (주)내자인 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.

② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.

③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.

④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.

제3조 (약관 등의 명시와 설명 및 개정) 
① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호·모사전송번호·전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보보호책임자 등을 이용자가 쉽게 알 수 있도록 (주)내자인 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.

② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회·배송책임·환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.

③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.

④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.  이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. 

⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.

⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 「전자상거래 등에서의 소비자 보호지침」 및 관계법령 또는 상관례에 따릅니다.

제4조(서비스의 제공 및 변경) 
① “몰”은 다음과 같은 업무를 수행합니다.
1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
2. 구매계약이 체결된 재화 또는 용역의 배송
3. 기타 “몰”이 정하는 업무

② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.

③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.

④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

제5조(서비스의 중단) 
① “몰”은 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.

② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.

제6조(회원가입) 
① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.

② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우

③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.

④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.

제7조(회원 탈퇴 및 자격 상실 등) 
① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.

② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.
1. 가입 신청 시에 허위 내용을 등록한 경우
2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우

③ “몰”이 회원 자격을 제한·정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.

④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.

제8조(회원에 대한 통지)
① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.

② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.

제9조(구매신청) 
① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.
1. 재화 등의 검색 및 선택
2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력
3. 약관내용, 청약철회권이 제한되는 서비스, 배송료·설치비 등의 비용부담과 관련한 내용에 대한 확인
4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시 (예, 마우스 클릭)
5. 재화 등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의
6. 결제방법의 선택

② “몰”이 제3자에게 구매자 개인정보를 제공·위탁할 필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를 받지 않습니다. 이 때 “몰”은 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및 보유·이용 기간 등을 구매자에게 명시하여야 합니다. 다만 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 제25조 제1항에 의한 개인정보 처리위탁의 경우 등 관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다.

제10조 (계약의 성립)
①  “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
1. 신청 내용에 허위, 기재누락, 오기가 있는 경우
2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우

② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.

③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.

제11조(지급방법)
“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법 중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.
1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 
2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제
3. 온라인무통장입금
4. 전자화폐에 의한 결제
5. 수령 시 대금지급
6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제
7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제  
8. 기타 전자적 지급 방법에 의한 대금 지급 등

제12조(수신확인통지·구매신청 변경 및 취소)
① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.

제13조(재화 등의 공급)
① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다.  이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.

② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의·과실이 없음을 입증한 경우에는 그러하지 아니합니다.

제14조(환급)
“몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.

제15조(청약철회 등)
① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다. 

② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우
4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우

③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.

④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.

제16조(청약철회 등의 효과)
① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.

② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.

③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.

④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.

제17조(개인정보보호)
① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다. 

② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.

③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 

④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.

⑤ “몰”이 제3항과 제4항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보보호 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.

⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
 
⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 처리하는 자를  최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.

⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.

⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.

제18조(“몰“의 의무)
① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화·용역을 제공하는데 최선을 다하여야 합니다.

② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.

③ “몰”이 상품이나 용역에 대하여 「표시·광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.
④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.

제19조(회원의 ID 및 비밀번호에 대한 의무)
① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.

② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.

③ 회원이 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.

제20조(이용자의 의무) 이용자는 다음 행위를 하여서는 안 됩니다.
1. 신청 또는 변경시 허위 내용의 등록
2. 타인의 정보 도용
3. “몰”에 게시된 정보의 변경
4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해
6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위

제21조(연결“몰”과 피연결“몰” 간의 관계)

① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.

② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.

제22조(저작권의 귀속 및 이용제한)
① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.

② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.

③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.

제23조(분쟁해결)
① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치·운영합니다.

② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.

③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.

제24조(재판권 및 준거법)
① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.

② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.

본 약관은 2019년04월23일부터 적용됩니다.
</textarea>
									</div>
									<h4 class="tit" id="chk_cont2">개인정보 수집·이용</h4>
									<table border="0" summary="구분, 목적, 항목, 보유기간, 필수정보, 선택정보"
										class="contract-tbl">
										<caption>개인정보 수집·이용</caption>
										<colgroup>
											<col width="100">
											<col width="33%">
											<col width="33%">
											<col width="33%">
										</colgroup>
										<thead>
											<tr>
												<th scope="col"><div>구분</div></th>
												<th scope="col"><div>목적</div></th>
												<th scope="col"><div>항목</div></th>
												<th scope="col"><div>보유기간</div></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row" rowspan="1"><div>필수정보</div></th>
												<td><div class="p10 purposeY">회원제 서비스 이용 / 본인확인</div></td>
												<td><div class="p10 itemsY">이름, 아이디, 비밀번호, 이메일,
														휴대폰, 생일, 성별</div></td>
												<td><div class="p10 holdingY">회원탈퇴 후 5일까지</div></td>
											</tr>
										</tbody>
									</table>
									<input type="hidden" name="agree_uidB" id="agree_uidB"
										value="1_">
									<table border="0" summary="구분, 목적, 항목, 보유기간, 필수정보, 선택정보"
										class="contract-tbl">
										<caption>개인정보 수집·이용</caption>
										<colgroup>
											<col width="100">
											<col width="33%">
											<col width="33%">
											<col width="33%">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row" rowspan="1"><div>선택정보</div></th>
												<td><div class="p10 purpose1">마케팅 활용(이벤트, 맞춤형 광고)</div></td>
												<td><div class="p10 items1">휴대폰, 이메일, 쿠키정보</div></td>
												<td><div class="p10 holding1">회원탈퇴 후 5일까지</div></td>
											</tr>
										</tbody>
									</table>
									<p class="pl-6 btm-msg">
										귀하께서는 쇼핑몰에서 위와 같이 수집하는 개인정보에 대해, 동의하지 않거나 개인정보를 기재하지 않음으로써 거부할
										수 있습니다.<br> 다만, 이때 회원에게 제공되는 서비스가 제한될 수 있습니다.
									</p>
								</div>
							</fieldset>
							<!-- use_contract -->
						</div>
					</form>
				</div>
				<!-- .page-body -->
			</div>
			<!-- #terms -->
		</div>
		<!-- 사이트 끝 -->


	</div>
</section>

<jsp:include page="../footer.jsp" />