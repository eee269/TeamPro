<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />
<style>
.btn-order-ctrl {
	margin: 40px 0 50px;
	text-align: center
}

.btn-order-ctrl a {
	width: 178px !important;
	height: 58px !important;
	font-size: 16px;
	line-height: 58px
}

.CSSbuttonBlack {
	display: inline-block;
	color: #fff;
	text-align: center;
	border: 1px solid #231f20;
	background: #231f20;
	-webkit-transition: all 0.3s ease;
	transition: all 0.3s ease
}

.CSSbuttonBlack:hover {
	color: #231f20;
	background: #fff
}

.CSSbuttonBlack:active {
	position: relative;
	top: 1px
}

.CSSbuttonWhite {
	display: inline-block;
	color: #231f20;
	text-align: center;
	border: 1px solid #231f20;
	background: #fff;
	-webkit-transition: all 0.3s ease;
	transition: all 0.3s ease;
}

.CSSbuttonWhite:hover {
	color: #fff;
	background: #231f20
}

.CSSbuttonWhite:active {
	position: relative;
	top: 1px
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


<!-- breadcrumb -->
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04"> Home
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> Shoping Cart </span>
	</div>
</div>


<!-- Shoping Cart -->
<form class="bg0 p-t-75 p-b-85">
	<div class="container">
		<div class="row">
			<div class="col-lg-10 m-lr-auto m-b-50">
				<div class="m-l-25 m-r--38 m-lr-0-xl">
					<div class="wrap-table-shopping-cart">
						<table class="table-shopping-cart">
							<tr class="table_head">
								<th class="column-1">사진</th>
								<th class="column-2">상품명</th>
								<th class="column-3">가격</th>
								<th class="column-4">수량</th>
								<th class="column-5">금액</th>
								<th class="column-6">배송비</th>
								<th class="column-7">취소</th>
							</tr>

							<tr class="table_row">
								<td class="column-1">
									<div class="how-itemcart1">
										<img src="images/item-cart-04.jpg" alt="IMG">
									</div>
								</td>
								<td class="column-2">Fresh Strawberries</td>
								<td class="column-3">$ 36.00</td>
								<td class="column-4">
									<div class="wrap-num-product flex-w m-l-auto m-r-0">
										<div
											class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>

										<input class="mtext-104 cl3 txt-center num-product"
											type="number" name="num-product1" value="1">

										<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>
								</td>
								<td class="column-5">$ 36.00</td>
								<td class="column-6">2500원</td>
								<td class="column-7">DELETE</td>
							</tr>

							<tr class="table_row">
								<td class="column-1">
									<div class="how-itemcart1">
										<img src="images/item-cart-05.jpg" alt="IMG">
									</div>
								</td>
								<td class="column-2">Lightweight Jacket</td>
								<td class="column-3">$ 16.00</td>
								<td class="column-4">
									<div class="wrap-num-product flex-w m-l-auto m-r-0">
										<div
											class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>

										<input class="mtext-104 cl3 txt-center num-product"
											type="number" name="num-product2" value="1">

										<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>
								</td>
								<td class="column-5">$ 16.00</td>
								<td class="column-6">2500원</td>
								<td class="column-7">DELETE</td>
							</tr>
						</table>
					</div>



					<div class="btn-order-ctrl">
						<a href="/html/mainm.html" class="CSSbuttonBlack">주문하기</a> <a
							href="/html/mainm.html" class="CSSbuttonWhite">계속 쇼핑하기</a> <a
							href="/html/mainm.html" class=" ">장바구니 비우기</a> <a
							href="/html/mainm.html" class="CSSbuttonWhite">견적서 출력</a>
					</div>


				</div>
			</div>











		</div>
	</div>
</form>


<jsp:include page="../footer.jsp" />