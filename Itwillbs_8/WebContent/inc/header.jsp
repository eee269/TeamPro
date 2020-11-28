<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Product Detail</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<!--===============================================================================================-->
	<script src="community/summernote-ko-KR.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<style>
.arrow_box {
	position: relative;
	background: #88b7d5;
	border: 4px solid #c2e1f5;
}
.arrow_box:after, .arrow_box:before {
	bottom: 100%;
	left: 50%;
	border: solid transparent;
	content: "";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
}

.arrow_box:after {
	border-color: rgba(136, 183, 213, 0);
	border-bottom-color: #88b7d5;
	border-width: 30px;
	margin-left: -30px;
}
.arrow_box:before {
	border-color: rgba(194, 225, 245, 0);
	border-bottom-color: #c2e1f5;
	border-width: 36px;
	margin-left: -36px;
}
</style>
</head>
<body class="animsition">
	<!-- Header -->
	<header class="header-v4">
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">
						Free shipping for standard order over $100
					</div>
					<div class="right-top-bar flex-w h-full">
						<a href="MemberLoginForm.mo" class="flex-c-m trans-04 p-lr-15">
							로그인
						</a>
						<a href="Cart.ca" class="flex-c-m trans-04 p-lr-15">
							장바구니
						</a>
						<a href="ControlMember.mo" class="flex-c-m trans-04 p-lr-15">
							마이페이지
						</a>
						<a href="MyOrder.or" class="flex-c-m trans-04 p-lr-15">
							주문정보
						</a>
					</div>
				</div>
			</div>
			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">
					<!-- Logo desktop -->		
					<a href="index.jsp" class="logo">
						<img src="images/icons/logo-01.png" alt="IMG-LOGO">
					</a>
					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li>
								<a href="index.jsp">HOME</a>
							</li>
							<li>
								<a href="ProductShop.po?type=X&xcode=CLOTHES">CLOTHES</a>
								<ul class="sub-menu">						
									<li><a href="ProductShop.po?type=N&xcode=CLOTHES&ncode=TOP">TOP</a></li>
									<li><a href="ProductShop.po?type=N&xcode=CLOTHES&ncode=BOTTOM">BOTTOM</a></li>
									<li><a href="ProductShop.po?type=N&xcode=CLOTHES&ncode=DRESS">DRESS</a></li>
									<li><a href="ProductShop.po?type=N&xcode=CLOTHES&ncode=OUTER">OUTER</a></li>
								</ul>
							</li>
							<li>
								<a href="ProductShop.po?type=X&xcode=BAGS">BAGS</a>
								<ul class="sub-menu">
									<li><a href="ProductShop.po?type=N&xcode=BAGS&ncode=CROSS">CROSS</a></li>
									<li><a href="ProductShop.po?type=N&xcode=BAGS&ncode=CLUTCH">CLUTCH</a></li>
									<li><a href="ProductShop.po?type=N&xcode=BAGS&ncode=SHOULDER">SHOULDER</a></li>
									<li><a href="ProductShop.po?type=N&xcode=BAGS&ncode=TOTE">TOTE</a></li>
									<li><a href="ProductShop.po?type=N&xcode=BAGS&ncode=BUCKET">BUCKET</a></li>
									<li><a href="ProductShop.po?type=N&xcode=BAGS&ncode=BACKPACK">BACKPACK</a></li>
									<li><a href="ProductShop.po?type=N&xcode=BAGS&ncode=SHOPPER">SHOPPER</a></li>
								</ul>
							</li>
							<li>
								<a href="ProductShop.po?type=X&xcode=SHOES">SHOES</a>
								<ul class="sub-menu">
									<li><a href="ProductShop.po?type=N&xcode=SHOES&ncode=SNEAKERS">SNEAKERS</a></li>
									<li><a href="ProductShop.po?type=N&xcode=SHOES&ncode=BOOTS">BOOTS</a></li>
									<li><a href="ProductShop.po?type=N&xcode=SHOES&ncode=LOAFERS">LOAFERS</a></li>
								    <li><a href="ProductShop.po?type=N&xcode=SHOES&ncode=SANDALS">SANDALS</a></li>
								    <li><a href="ProductShop.po?type=N&xcode=SHOES&ncode=SLIPPER">SLIPPER</a></li>	
								</ul>
							</li>
							<li class="label1" data-label1="hot">
								<a href="CommList.co">COMMUNITY</a>
							</li>
						</ul>
					</div>	
					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="2">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>
						<a href="#" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">
							<i class="zmdi zmdi-favorite-outline"></i>
						</a>
					</div>
				</nav>
			</div>	
		</div>
		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="index.jsp"><img src="images/icons/logo-01.png" alt="IMG-LOGO"></a>
			</div>
			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>
				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
					<i class="zmdi zmdi-shopping-cart"></i>
				</div>
				<a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
					<i class="zmdi zmdi-favorite-outline"></i>
				</a>
			</div>
			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>
		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">
						Free shipping for standard order over $100
					</div>
				</li>
				<li>
					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m p-lr-10 trans-04">
							로그인
						</a>
						<a href="#" class="flex-c-m p-lr-10 trans-04">
							회원가입
						</a>
						<a href="#" class="flex-c-m p-lr-10 trans-04">
							장바구니
						</a>
					</div>
				</li>
			</ul>
			<ul class="main-menu-m">
				<li>
					<a href="product/index.jsp">SHOP</a>
				</li>
				<li>
					<a href="product/index.jsp">BAGS</a>
				</li>
				<li>
					<a href="product/index.jsp">CLOTHES</a>
				</li>
				<li>
					<a href="product/index.jsp">SHOES</a>
				</li>
				<li>
					<a href="board/blog.jsp">COMMUNITY</a>
				</li>
			</ul>
		</div>
		<!-- Modal Search -->
		<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<div class="container-search-header">
				<button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
					<img src="images/icons/icon-close2.png" alt="CLOSE">
				</button>
				<form class="wrap-search-header flex-w p-l-15">
					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="plh3" type="text" name="search" placeholder="Search...">
				</form>
			</div>
		</div>
	</header>