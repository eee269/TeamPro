<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />

<!-- Cart -->
<jsp:include page="../sub_cart.jsp" />
<!-- QuickMenu -->
<jsp:include page="../quickMenu.jsp" />
<!-- breadcrumb -->
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04"> Home
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> Shoping Cart </span>
	</div>
</div>

<link type="text/css" rel="stylesheet" href="scss/common.css" />
<link type="text/css" rel="stylesheet" href="scss/order_pay.css" />
<link type="text/css" rel="stylesheet" href="scss/header.1.css" />
<link type="text/css" rel="stylesheet" href="scss/menu.1.css" />

<!-- 오더페이지 시작-->

<div id="contentWrapper">
	<div id="contentWrap">

		<link type="text/css" rel="stylesheet"
			href="/template_common/shop/basic_simple/menu.1.css?t=201711221039">
		<div id="content">
			<div id="order">

<!-- 							<div id="paybutton"> -->
<!-- 								<input type="submit" value="주문하기" -->
<!-- 									style="font-size: 1em; text-align: center; padding: 1.23em 3em;" -->
<!-- 									class="CSSbuttonWhite"> &nbsp -->
<!-- 																<button class="CSSbuttonWhite" onclick="payment()">주문하기</button> -->
<!-- 								&nbsp <input type="reset" value="주문취소" -->
<!-- 									style="font-size: 1em; text-align: center; padding: 1.23em 3em;" -->
<!-- 									class="CSSbuttonWhite"> -->

<!-- 							</div> -->
				<!-- .page-body -->
			</div>
			<!-- #order -->
		</div>
		<!-- #content -->
	</div>
	<!-- #contentWrap -->
</div>

<!-- 오더페이지 끝 -->


<jsp:include page="../inc/footer.jsp" />