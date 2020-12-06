<%@page import="java.util.ArrayList"%>
<%@page import="vo.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<OrderBean> order = (ArrayList<OrderBean>)request.getAttribute("orderList");
%>

<jsp:include page="../inc/header.jsp" />
<!-- QuickMenu -->
<jsp:include page="../quickMenu.jsp" />
<!-- Cart -->
<jsp:include page="../sub_cart.jsp" />
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

<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04"> Home
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> Shoping Cart </span>
	</div>
</div>

<link type="text/css" rel="stylesheet" href="scss/common.css" />
<link type="text/css" rel="stylesheet" href="scss/mp_order.css" />
<link type="text/css" rel="stylesheet" href="scss/header.1.css" />
<link type="text/css" rel="stylesheet" href="scss/menu.2.css" />
<!-- 주문상세 시작 -->


<div id="contentWrapper">
	<div id="contentWrap">

		<link type="text/css" rel="stylesheet"
			href="shopimages/nasign/template/work/33865/menu.2.css?t=202005111439">
		<div id="aside">
			<h2 class="aside-tit">MY ORDER</h2>
			<div class="lnb-wrap">
				<div class="lnb-bx">
					<h2 class="txt txt1">SHOPPING INFO</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a
								href="shop/mypage.html?mypage_type=myorder">주문내역</a></li>
							<li><a href="shop/mypage.html?mypage_type=mycoupon">쿠폰내역</a></li>
							<li><a href="shop/mypage.html?mypage_type=myreserve">적립금내역</a></li>
							<li><a href="shop/todaygoods.html">오늘본상품</a></li>
							<li><a href="shop/mypage.html?mypage_type=mywishlist">상품
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
								href="shop/mypage.html?mypage_type=myarticle">내 게시글 보기</a></li>
							<li><a href="shop/mypage.html?mypage_type=myemail">E-mail
									문의</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt3">CUSTOMER INFO</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a href="shop/idinfo.html">회원정보변경</a></li>
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
			<div id="myOrder">
				<div class="tit-page-2">
					<h2>주문내역</h2>
					<p class="dsc">
						<span class="fc-blue">[이름]</span>님께서 주문하신 내역입니다.
					</p>
				</div>
				<div class="page-body">
					<!-- 주문 내역 리스트 -->
					<div class="table-d2-list">
						<table summary="번호, 주문일자, 상품명, 결제금액, 주문상세, 배송현황">
							<caption>주문내역</caption>
							<colgroup>
								<col width="70">
								<col width="100">
								<col width="*">
								<col width="100">
								<col width="90">
								<col width="90">
							</colgroup>
							<thead>
								<tr>
									<th scope="row"><div class="tb-center">주문코드</div></th>
										<th scope="row"><div class="tb-center">주문자명</div></th>
									<th scope="row"><div class="tb-center">전화번호</div></th>
									<th scope="row"><div class="tb-center">배송지</div></th>
									<th scope="row"><div class="tb-center">주문날짜</div></th>
									<th scope="row"><div class="tb-center">결제방식</div></th>
										<th scope="row"><div class="tb-center">아이디</div></th>
									<th scope="row"><div class="tb-center">배송현황</div></th>
									<th scope="row"><div class="tb-center">상세목록</div></th>
								</tr>
							</thead>
							<tbody>
<!-- 								<tr> -->
<!-- 									<td colspan="6"><div class="tb-center">주문내역이 없습니다.</div></td> -->
<!-- 								</tr> -->
<%
	for(int i = 0 ; i < order.size() ; i++) {
		%>
					<tr>
									<td scope="row"><div class="tb-center"><%=order.get(i).getCode() %></div></td>
									<td scope="row"><div class="tb-center"><%=order.get(i).getName() %></div></td>
									<td scope="row"><div class="tb-center"><%=order.get(i).getPhone() %></div></td>
									<td scope="row"><div class="tb-center"><%=order.get(i).getAddress() %></div></td>
									<td scope="row"><div class="tb-center"><%=order.get(i).getDate() %></div></td>
									<td scope="row"><div class="tb-center"><%=order.get(i).getPayment() %></div></td>
									<td scope="row"><div class="tb-center"><%=order.get(i).getMember_id() %></div></td>
									<td scope="row"><div class="tb-center"><%=order.get(i).getStatus() %></div></td>
									<td scope="row"><div class="tb-center"><a href="MyOrderDetail.or?code="<%=order.get(i).getCode() %>><input type="hidden" name="mainorder_code" value="<%=order.get(i).getCode() %>" >상세목록조회</a></div></td>
								</tr>
										<%
	}
%>
			
							</tbody>
						</table>
					</div>
					<!-- //주문 내역 리스트 -->

					<!-- 주문 내역 페이징 -->
					<div class="paging"></div>
					<!-- //주문 내역 페이징 -->

					<!-- 주문 내역 info -->
					<ul class="foot-dsc">
						<li>- 상품명 또는 주문상세의 조회 버튼을 클릭하시면, 주문상세 내역을 확인하실 수 있습니다.</li>
						<li>- 배송현황의 조회 버튼을 클릭하시면, 해당 주문의 배송 현황을 한눈에 확인하실 수 있습니다.</li>
					</ul>
					<!-- //주문 내역 info -->

				</div>
				<!-- .page-body -->
			</div>
			<!-- #myOrder -->
		</div>
		<!-- #content -->
	</div>
	<!-- #contentWrap -->
</div>


<!-- 주문상세 끝 -->


<jsp:include page="../inc/footer.jsp" />