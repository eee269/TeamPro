<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />
<style>
.CSSbuttonBlack {
	-webkit-font-smoothing: antialiased;
	vertical-align: middle;
	text-decoration: none;
	font-family: 'Roboto', 'Nanum Gothic', Dotum, AppleGothic, Helvetica,
		sans-serif;
	display: inline-block;
	border: 1px solid #231f20;
	transition: all 0.3s ease;
	color: #231f20;
	background: #fff;
	width: 160px;
	line-height: 48px;
	text-align: center;
	font-size: 14px;
}

.CSSbuttonWhite {
	-webkit-font-smoothing: antialiased;
	vertical-align: middle;
	text-decoration: none;
	font-family: 'Roboto', 'Nanum Gothic', Dotum, AppleGothic, Helvetica,
		sans-serif;
	display: inline-block;
	color: #231f20;
	border: 1px solid #231f20;
	background: #fff;
	transition: all 0.3s ease;
	width: 160px;
	line-height: 48px;
	text-align: center;
	font-size: 14px;
}

.btn-area {
	font-size: 12px;
	color: rgb(28, 28, 28);
	line-height: 1.25;
	font-family: 'Roboto', 'Nanum Gothic', Dotum, AppleGothic, Helvetica,
		sans-serif;
	-webkit-font-smoothing: antialiased;
	margin: 0;
	padding: 0;
	text-align: center;
	margin-top: 30px;
}
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
<!-- Address 시작 -->


<div id="contentWrapper">
	<div id="contentWrap">

		<link type="text/css" rel="stylesheet"
			href="/shopimages/nasign/template/work/33865/menu.2.css?t=202005111439">
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
		<hr>
		<div id="content">
			<div id="mypage">
				<div class="page-body">
					<!-- 주소록 관리 -->
					<div class="hd">
						<h3>주소록 관리</h3>
					</div>
					<div class="tbl">
						<table class="addrbook-list">
							<caption>주소록 관리</caption>
							<colgroup>
								<col width="35">
								<col width="60">
								<col width="180">
								<col width="auto">
								<col width="120">
								<col width="250">
								<col width="110">
							</colgroup>
							<thead>
								<th><div class="tb-center">
										<input type="checkbox" name="all_addrbook" id="all_addrbook"
											onclick="check_all_addrbook()" />
									</div></th>
								<th><div class="tb-center">이동</div></th>
								<th><div class="tb-center">[배송지명] 받는 사람</div></th>
								<th><div class="tb-center">주소</div></th>
								<th><div class="tb-center">연락처</div></th>
								<th><div class="tb-center">주문 메시지</div></th>
								<th><div class="tb-center">관리</div></th>
							</thead>
							<tbody>
								<tr class="ui-sortable">
									<td>
										<div class="tb-center">
											<input type="checkbox" name="anum[]" value="1"
												class="MS_checkbox_addrbook" />
										</div>
									</td>
									<td>
										<div class="tb-center">
											<a href="#self" class="moving-grap"><img
												src="/images/btn_h18_change.jpg" alt=""></a>
										</div>
									</td>
									<td>
										<div class="tb-center">[집] 한상빈</div>
									</td>
									<td><div class="tb-left">부산 진구 아이티윌</div></td>
									<td>
										<div class="tb-center">
											<div>010-9999-9999</div>
											<div>02-999-9999</div>
										</div>
									</td>
									<td>
										<div class="tb-left"></div>
									</td>
									<td>
										<div class="tb-center">
											<a href="javascript:pop_addplace();" class="CSSbuttonWhite"
												style="width: 55px;">수정</a> <a
												href="javascript:del_addrbook('1');" class="CSSbuttonWhite"
												style="width: 55px; margin-top: 5px;">삭제</a>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn-area">
						<div>
							<a href="javascript:pop_addplace();" class="CSSbuttonBlack">배송지
								추가</a> <a href="javascript:multi_del_addrbook();"
								class="CSSbuttonWhite">선택 삭제</a>
						</div>
					</div>

					<!-- 최근 배송지 -->
					<div class="hd">
						<h3>최근 배송지</h3>
					</div>
					<div class="tbl">
						<table class="past-list">
							<caption>최근 배송지</caption>
							<colgroup>
								<col width="35">
								<col width="260">
								<col width="auto">
								<col width="220">
								<col width="73">
								<col width="110">
							</colgroup>
							<thead>
								<th><div class="tb-center">
										<input type="checkbox" name="all_past" id="all_past"
											onclick="check_all_past()" disabled="disabled" />
									</div></th>
								<th><div class="tb-center">받는 사람</div></th>
								<th><div class="tb-center">주소</div></th>
								<th><div class="tb-center">연락처</div></th>
								<th><div class="tb-center"></div></th>
								<th><div class="tb-center">관리</div></th>
							</thead>
							<tbody>
								<tr>
									<td colspan="6">
										<div class="tb-center">최근 배송지 내역이 없습니다.</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="paging-wrap">
						<div class="paging"></div>
					</div>
					<div class="btn-area">
						<div></div>
					</div>

				</div>
				<!-- .page-body -->
			</div>
			<!-- .page-body -->
		</div>
		<!-- #mypage -->
	</div>
	<!-- #content -->
</div>
<!-- #contentWrap -->
</div>
<!-- Address 끝 -->
<script>
function pop_addplace() {
    var url = "addr_plus.html?";
    var option = "left=720, top=210, width=480, height=742, resizable=no, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)
    window.open(url, "place", option);
}
</script>
<jsp:include page="../footer.jsp" />