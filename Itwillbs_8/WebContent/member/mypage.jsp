<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/inc/header.jsp" />

<%
	MemberBean member = new MemberBean(); 
	member = (MemberBean) request.getAttribute("member");
%>

<!-- <!-- Cart --> 
<!-- <div class="wrap-header-cart js-panel-cart"> -->
<!-- 	<div class="s-full js-hide-cart"></div> -->

<!-- 	<div class="header-cart flex-col-l p-l-65 p-r-25"> -->
<!-- 		<div class="header-cart-title flex-w flex-sb-m p-b-8"> -->
<!-- 			<span class="mtext-103 cl2"> Your Cart </span> -->

<!-- 			<div -->
<!-- 				class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart"> -->
<!-- 				<i class="zmdi zmdi-close"></i> -->
<!-- 			</div> -->
<!-- 		</div> -->

<!-- 		<div class="header-cart-content flex-w js-pscroll"> -->
<!-- 			<ul class="header-cart-wrapitem w-full"> -->
<!-- 				<li class="header-cart-item flex-w flex-t m-b-12"> -->
<!-- 					<div class="header-cart-item-img"> -->
<!-- 						<img src="http://oryany.co.kr/images/item-cart-01.jpg" alt="IMG"> -->
<!-- 					</div> -->

<!-- 					<div class="header-cart-item-txt p-t-8"> -->
<!-- 						<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04"> -->
<!-- 							White Shirt Pleat </a> <span class="header-cart-item-info"> 1 -->
<!-- 							x $19.00 </span> -->
<!-- 					</div> -->
<!-- 				</li> -->

<!-- 				<li class="header-cart-item flex-w flex-t m-b-12"> -->
<!-- 					<div class="header-cart-item-img"> -->
<!-- 						<img src="http://oryany.co.kr/images/item-cart-02.jpg" alt="IMG"> -->
<!-- 					</div> -->

<!-- 					<div class="header-cart-item-txt p-t-8"> -->
<!-- 						<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04"> -->
<!-- 							Converse All Star </a> <span class="header-cart-item-info"> 1 -->
<!-- 							x $39.00 </span> -->
<!-- 					</div> -->
<!-- 				</li> -->

<!-- 				<li class="header-cart-item flex-w flex-t m-b-12"> -->
<!-- 					<div class="header-cart-item-img"> -->
<!-- 						<img src="http://oryany.co.kr/images/item-cart-03.jpg" alt="IMG"> -->
<!-- 					</div> -->

<!-- 					<div class="header-cart-item-txt p-t-8"> -->
<!-- 						<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04"> -->
<!-- 							Nixon Porter Leather </a> <span class="header-cart-item-info"> -->
<!-- 							1 x $17.00 </span> -->
<!-- 					</div> -->
<!-- 				</li> -->
<!-- 			</ul> -->

<!-- 			<div class="w-full"> -->
<!-- 				<div class="header-cart-total w-full p-tb-40">Total: $75.00</div> -->

<!-- 				<div class="header-cart-buttons flex-w w-full"> -->
<!-- 					<a href="shoping-cart.html" -->
<!-- 						class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10"> -->
<!-- 						View Cart </a> <a href="shoping-cart.html" -->
<!-- 						class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10"> -->
<!-- 						Check Out </a> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->


<!-- breadcrumb -->
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="Main.go" class="stext-109 cl8 hov-cl1 trans-04"> Home
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> My Page </span>
	</div>
</div>

<link type="text/css" rel="stylesheet" href="scss/common.css" />
<link type="text/css" rel="stylesheet" href="scss/mp_main.css" />
<link type="text/css" rel="stylesheet" href="scss/header.1.css" />
<link type="text/css" rel="stylesheet" href="scss/menu.2.css" />
<!-- Shoping Cart -->


<div id="contentWrapper">
	<div id="contentWrap">

		<div id="aside">
			<h2 class="aside-tit">MY PAGE</h2>
			<div class="lnb-wrap">
				<div class="lnb-bx">
					<h2 class="txt txt1">SHOPPING INFO</h2>
					<div class="lnb">
						<ul>
							<li class="first">
							<a href="MyOrderList.or?member_id=<%=member.getId()%>">주문내역</a></li>
							<li><a href="#">상품 보관함</a></li>
							<li><a href="#">내 상품 리뷰</a></li>
							<li><a href="#">상품 QnA</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt2">COMMUNITY INFO</h2>
					<div class="lnb">
						<ul>
							<li class="first">
							<a href="#">내 게시글 보기</a></li>
							<li><a href="#">내 게시글 리뷰</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt3">CUSTOMER INFO</h2>
					<div class="lnb">
						<ul>
							<li class="first">
							<a href="#">회원정보변경</a></li>
							<li><a href="#">회원탈퇴신청</a></li>
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
					<!-- 회원 정보 -->
					<div class="info">
						<div class="user">
							<div class="user-img"></div>
							<div class="user-info">
								<p>
									<b><%=member.getUsername() %></b> [<span id="MK_user_id"><%=member.getId() %></span>]님
									  &nbsp;&nbsp;&nbsp; <a href="회원정보수정" class="CSSbuttonWhite CSSbuttonMin">EDIT</a>
								</p>
								<div class="box">
									<dl>
										<dt>가입 일자</dt>
										<dd><%=member.getDate() %></dd>
									</dl>
									<dl>
										<dt>전 &nbsp;&nbsp;&nbsp; 화</dt>
										<dd><%=member.getPhone() %></dd>
									</dl>
									<dl>
										<dt>이 메 일</dt>
										<dd>
											<span id="MK_user_email"><%=member.getEmail() %></span>
										</dd>
									</dl>
<!-- 									<dl> -->
<!-- 										<dt>주 &nbsp;&nbsp;&nbsp; 소</dt> -->
<!-- 										<dd>주소...어케해야대지.......1. 최근주소지 2. 목록이동 -> 주소지 목록 나열</dd> -->
<!-- 									</dl> -->
								</div>
							</div>
						</div>
						<dl class="order">
							<dt>총 주문금액</dt>
							<dd style="width: 300px">
								<span>총 주문 금액 계산한 값.. </span>원
							</dd>
							<dt>주문 건수</dt>
							<dd style="width: 300px"><span>총 주문 건수 계산한 값... </span>건</dd>
							<dt>게시글 수</dt>
							<dd style="width: 300px"><span>총 게시글 수 계산한 값... </span>개</dd>
<!-- 							<dt>적 립 금</dt> -->
<!-- 							<dd> -->
<!-- 								<a href="/shop/mypage.html?mypage_type=myreserve"><strong>5,000</strong>원</a> -->
<!-- 							</dd> -->
<!-- 							<dt>쿠 &nbsp;&nbsp;&nbsp; 폰</dt> -->
<!-- 							<dd> -->
<!-- 								<a href="/shop/mypage.html?mypage_type=mycoupon"><strong>0</strong>개</a> -->
<!-- 							</dd> -->
						</dl>
					</div>
					<!-- //회원 정보 -->

					<!-- 회원 그룹 정보 -->
<!-- 					<div class="grp"> -->
<!-- 						<p> -->
<!-- 							이름님은 [BRONZE]회원입니다.<br> -->
<!-- 						</p> -->
<!-- 					</div> -->
					<!-- //회원 그룹 정보 -->


					<!-- 최근 주문 정보 -->
					<div class="hd">
						<h3>최근 주문 정보</h3>
						<a class="view fe" href="MyOrderList.or?member_id=<%=member.getId()%>">+
							MORE</a>
					</div>
					<div class="tbl">
						<table summary="주문일자, 상품명, 결제금액, 주문상세">
							<caption>최근 주문 정보 목록</caption>
							<colgroup>
								<col width="150">
								<col width="*">
								<col width="140">
								<col width="140">
							</colgroup>
							<thead>
								<tr>
									<th><div class="tb-center">DATE</div></th>
									<th><div class="tb-center">PRODUCT</div></th>
									<th><div class="tb-center">COST</div></th>
									<th><div class="tb-center">DETAIL</div></th>
								</tr>
							</thead>
							
<!-- 							for문 돌리기 -->
							<tbody>
								<tr>
									<td><div class="tb-center">2020.11.12</div></td>
									<td><div class="tb-center"><a
										href="/shop/shopdetail.html?branduid=3360797&amp;xcode=001&amp;mcode=&amp;scode=&amp;GfDT=bm55W1w%3D"
										class="tb-bold">로티 크로커 크로스바디</a><br>색상 : BLACK 1개</div></td>
									<td><div class="tb-center">219,000원</div></td>
									<td><div class="tb-center">-</div></td>
								</tr>
							</tbody>
<!-- 							<tbody> -->
<!-- 								<tr> -->
<!-- 									<td colspan="4"><div class="tb-center">주문 내역이 없습니다.</div></td> -->
<!-- 								</tr> -->
<!-- 							</tbody> -->
						</table>
					</div>
					<!-- //최근 주문 정보 -->

					<!-- 최근 등록 게시글 -->
					<div class="hd">
						<h3>최근 등록 게시글</h3>
						<a class="view fe" href="최근 게시글 목록">+
							MORE</a>
					</div>
					<div class="tbl">
						<table summary="등록일자, 제목, 게시판">
							<caption>최근 등록 게시물 목록</caption>
							<colgroup>
								<col width="150">
								<col width="*">
								<col width="200">
							</colgroup>
							<thead>
								<tr>
									<th><div class="tb-center">DATE</div></th>
									<th><div class="tb-center">SUBJECT</div></th>
									<th><div class="tb-center">BOARD</div></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="3"><div class="tb-center">작성된 게시글이
											없습니다.</div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //최근 등록 게시글 -->

					<!-- 관심 상품 정보 -->
					<div class="hd">
						<h3>관심 상품 정보</h3>
						<a class="view fe" href="/shop/mypage.html?mypage_type=mywishlist">+
							MORE</a>
					</div>
					<div class="lst">
						<div class="item-wrap">
							<div class="item-cont"></div>
						</div>
					</div>
					<!-- //관심 상품 정보 -->

				</div>
				<!-- .page-body -->
			</div>
			<!-- #mypage -->
		</div>
		<!-- #content -->
	</div>
	<!-- #contentWrap -->
</div>






<!-- Shoping Cart 끝 -->







<jsp:include page="/inc/footer.jsp" />