<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.CommReBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.CommBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	CommBean article = (CommBean) request.getAttribute("article");
String nowPage = request.getParameter("page");

//==============댓글시작==============//
// 전달받은 request 객체로부터 데이터 가져오기
ArrayList<CommReBean> commentList = (ArrayList<CommReBean>) request.getAttribute("commentList");

// String id = "dodo";
String id = (String) session.getAttribute("member_id");
int community_num = Integer.parseInt(request.getParameter("num"));

//날짜 => 원하는 모양을 변경 문자열 결과값
SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
%>
<jsp:include page="../inc/header.jsp" />

<!-- 카카오 SDK -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript"
	src="fancybox/source/jquery.fancybox.js?v=2.1.5"></script>
<link rel="stylesheet" type="text/css"
	href="fancybox/source/jquery.fancybox.css?v=2.1.5" media="screen" />
<script type="text/javascript">
$(document).ready(function() {
    $('.fancybox').fancybox();
});
</script>

<link type="text/css" rel="stylesheet" href="css/common.css" />
<link type="text/css" rel="stylesheet" href="css/shopdetail.css" />
<link type="text/css" rel="stylesheet" href="css/header.css" />
<link type="text/css" rel="stylesheet" href="css/menu_1.css" />
<link type="text/css" rel="stylesheet"
	href="css/power_review_custom.css" />
<!-- QuickMenu -->
<jsp:include page="../quickMenu.jsp" />
<style>
.rerelist {
	background-color: #e9e9e9;
	padding: 15px !important;
	margin-top: 10px !important;
	margin-left: 30px !important;
	border-radius: 15px;
}

.desc_re {
	/* position: absolute; */
	width: 160px;
	float: right;
}

.content_re {
	/* clear: both; */
	overflow: hidden;
	/* margin: 0px 220px 0 0; */
	color: #89888e;
	line-height: 1.5;
	word-wrap: break-word;
	/*     min-height: 75px; */
	float: left;
	width: 400px;
}

.desc_re dt:first-child {
	border-top: 0;
}

.desc_re dt {
	padding: 0px 0 0 5px;
	color: #a8a8a8;
	border-top: 1px solid #dadada;
}

.desc_re dd {
	padding: 0 0 5px 5px !important;
	color: #000;
}

/*대댓글*/
#re_wrt {
	display: none;
	margin-top: 10px;
}

#re_wrt.on {
	display: block;
}

#re_wrt #rere_contents {
	margin-left: 12px;
}

#re_wrt .btn_comment {
	/*     position: absolute; */
	/*     top: 0; */
	/*     right: 0; */
	/*     height: 72px; */
	line-height: 50px;
	padding: 0 45px;
	background: #f3f3f3;
	border-left: 1px solid #dadada;
	color: #818391;
	font-weight: bold;
	letter-spacing: -1px; *:;
	height: 50px;
}

#powerReview .PR15N01-review-wrap>li .desc dt {
	padding-top: 5px;
}

ul.arraymodeTab>.active a{
font-weight: bold !important;
}

/* 업로드한 게시글의 이미지 크기 강제로 맞추기 */
.wrap-pic-w img {
	width: 250px;
	height: 250px;
}
/* 게시글 제목 밑에 구분선 추가 */
h4.ltext-109 {
	border-bottom: #212529 1px solid !important;
}
</style>
<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">
						Free shipping for standard order over $100
					</div>
				</li>

<<<<<<< HEAD
				<li>
					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m p-lr-10 trans-04">
							Help & FAQs
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							My Account
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							EN
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							USD
						</a>
					</div>
				</li>
			</ul>

			<ul class="main-menu-m">
				<li>
					<a href="index.html">Home</a>
					<ul class="sub-menu-m">
						<li><a href="index.html">Homepage 1</a></li>
						<li><a href="home-02.html">Homepage 2</a></li>
						<li><a href="home-03.html">Homepage 3</a></li>
					</ul>
					<span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
				</li>

				<li>
					<a href="product.html">Shop</a>
				</li>

				<li>
					<a href="shoping-cart.html" class="label1 rs1" data-label1="hot">Features</a>
				</li>

				<li>
					<a href="blog.html">Blog</a>
				</li>

				<li>
					<a href="about.html">About</a>
				</li>

				<li>
					<a href="contact.html">Contact</a>
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

	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Your Cart
				</span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>
			
			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="images/item-cart-01.jpg" alt="IMG">
						</div>
=======
<!-- breadcrumb -->
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="Main.go" class="stext-109 cl8 hov-cl1 trans-04"> Home
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <a href="CommList.co" class="stext-109 cl8 hov-cl1 trans-04"> Community
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> <%=article.getSubject() %> </span>
	</div>
</div>
<!-- Content page -->
<section class="bg0 p-t-52 p-b-20">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-9 p-b-80">
				<div class="p-r-45 p-r-0-lg">
					<div class="wrap-pic-w how-pos5-parent">
						<img src="upload/commUpload/<%=article.getImg()%>" alt="<%=article.getImg()%>">
					</div>
					<div class="p-t-32">
						<span class="flex-w flex-m stext-111 cl2 p-b-19"> <span>
								<span class="cl4">By</span> <%=article.getUsername()%> <span
								class="cl12 m-l-4 m-r-6">|</span>
						</span> <span> <%=article.getDate()%> <span
								class="cl12 m-l-4 m-r-6">|</span>
						</span> <span> 태그 자리 <span class="cl12 m-l-4 m-r-6">|</span>
						</span> <span> 댓글 갯수 </span> <span class="bookmark_count"> 북마크 갯수
						</span>
						</span>
>>>>>>> 2406cc371e19785286e9c769a1bc353fde2f5605

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								White Shirt Pleat
							</a>

<<<<<<< HEAD
							<span class="header-cart-item-info">
								1 x $19.00
							</span>
=======
						<div class="flex-w size-217">
							<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
								Streetstyle </a>
							<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
								Crafts </a>
>>>>>>> 2406cc371e19785286e9c769a1bc353fde2f5605
						</div>
<<<<<<< HEAD
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="images/item-cart-02.jpg" alt="IMG">
=======
					</div>
					<br> <input type="button"
						class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04"
						value="삭제"
						onclick="location.href='CommDeleteForm.co?num=<%=article.getNum()%>&page=<%=nowPage%>'">
					<input type="button"
						class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04"
						value="수정"
						onclick="location.href='CommModifyForm.co?num=<%=article.getNum()%>&page=<%=nowPage%>'">
						&nbsp;&nbsp;&nbsp;
					<input type="button"
						class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04"
						value="북마크" id="bookmark"> <br>
						
                   <!-- 카카오톡으로 공유하기 기능 -->
                   &nbsp;&nbsp;&nbsp;
                   <a id="kakao-link-btn" href="javascript:sendLink()">
  					<img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" width="40px"/>
				   </a>
				<!-- // 카카오톡으로 공유하기 기능 -->


					<!-- -----------------------------Comment----------------------------- -->
					<h2 class="comment_title">COMMENT</h2>
					<div id="productDetail" style="padding-top: 20px;">
						<div class="page-body">
							<div class="cboth">
								<div id="powerReview">
									<div id="listPowerReview" class="MS_power_review_list">


										<!-- 댓글등록 폼 시작 -->
										<form name="comm_re_form" id="comm_re_form" method="post"
											autocomplete="off" enctype="multipart/form-data">
											<div name="comm_re" id="comm_re">
												<input type="hidden" id="username" name="username"
													value="<%=id%>"> <input type="hidden"
													id="community_num" name="community_num"
													value="<%=community_num%>">
												<div id="writePowerReview">
													<div class="PR15N01-write">

														<div class="pr-txtbox">
															<textarea
																class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10"
																id="reply_contents" name="reply_contents"></textarea>
															<div class="thumb-wrap"></div>
														</div>
														<input type="file" name="reply_file" id="reply_file"
															class="trick file-attach">
													</div>
													<!-- .PR15N01-write -->
													<div class="PR15N01-recmd">

														<div class="cvr right">
															<%
																if (id != null) {
															%><input type="button" value="댓글등록"
																class="lnk-review review_write">
															<%
																} else {
															%><input type="button" value="댓글등록"
																class="lnk-review review_write"
																onclick="return loginCheck()">
															<%
																}
															%>

														</div>
													</div>
													<!-- .PR15N01-recmd -->
												</div>
											</div>
											<!-- comm_re 끝 -->
										</form>
										<div class="cboth"></div>
										<br>
										<br>
										<br>
										<!-- 댓글등록 폼 끝 -->


										<ul class="arraymodeTab">
											<li class="arraymode popular active"><a href="#popular">답댓글많은순</a></li>
											<li class="arraymode newest"><a href="#newest">최신순</a></li>
										</ul>


										<ul class="PR15N01-review-wrap"></ul>





										<!-- .PR15N01-review-wrap -->

										<!-- .paging -->
									</div>
								</div>
								<!-- #powerReview-->
								<p style="clear: both"></p>

							</div>
							<!-- width1260 -->
>>>>>>> 2406cc371e19785286e9c769a1bc353fde2f5605
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Converse All Star
							</a>

							<span class="header-cart-item-info">
								1 x $39.00
							</span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="images/item-cart-03.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Nixon Porter Leather
							</a>

							<span class="header-cart-item-info">
								1 x $17.00
							</span>
						</div>
					</li>
				</ul>
				
				<div class="w-full">
					<div class="header-cart-total w-full p-tb-40">
						Total: $75.00
					</div>

					<div class="header-cart-buttons flex-w w-full">
						<a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
							View Cart
						</a>

						<a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
							Check Out
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="blog.html" class="stext-109 cl8 hov-cl1 trans-04">
				Blog
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				8 Inspiring Ways to Wear Dresses in the Winter
			</span>
		</div>
	</div>


	<!-- Content page -->
	<section class="bg0 p-t-52 p-b-20">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg">
						<!--  -->
						<div class="wrap-pic-w how-pos5-parent">
							<img src="images/blog-04.jpg" alt="IMG-BLOG">

							<div class="flex-col-c-m size-123 bg9 how-pos5">
								<span class="ltext-107 cl2 txt-center">
									22
								</span>

								<span class="stext-109 cl3 txt-center">
									Jan 2018
								</span>
							</div>
						</div>

						<div class="p-t-32">
							<span class="flex-w flex-m stext-111 cl2 p-b-19">
								<span>
									<span class="cl4">By</span> Admin  
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>

								<span>
									22 Jan, 2018
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>

								<span>
									StreetStyle, Fashion, Couple  
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>

								<span>
									8 Comments
								</span>
							</span>

							<h4 class="ltext-109 cl2 p-b-28">
								8 Inspiring Ways to Wear Dresses in the Winter
							</h4>

							<p class="stext-117 cl6 p-b-26">
								Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet est vel orci luctus sollicitudin. Duis eleifend vestibulum justo, varius semper lacus condimentum dictum. Donec pulvinar a magna ut malesuada. In posuere felis diam, vel sodales metus accumsan in. Duis viverra dui eu pharetra pellentesque. Donec a eros leo. Quisque sed ligula vitae lorem efficitur faucibus. Praesent sit amet imperdiet ante. Nulla id tellus auctor, dictum libero a, malesuada nisi. Nulla in porta nibh, id vestibulum ipsum. Praesent dapibus tempus erat quis aliquet. Donec ac purus id sapien condimentum feugiat.
							</p>

							<p class="stext-117 cl6 p-b-26">
								Praesent vel mi bibendum, finibus leo ac, condimentum arcu. Pellentesque sem ex, tristique sit amet suscipit in, mattis imperdiet enim. Integer tempus justo nec velit fringilla, eget eleifend neque blandit. Sed tempor magna sed congue auctor. Mauris eu turpis eget tortor ultricies elementum. Phasellus vel placerat orci, a venenatis justo. Phasellus faucibus venenatis nisl vitae vestibulum. Praesent id nibh arcu. Vivamus sagittis accumsan felis, quis vulputate
							</p>
						</div>

						<div class="flex-w flex-t p-t-16">
							<span class="size-216 stext-116 cl8 p-t-4">
								Tags
							</span>

							<div class="flex-w size-217">
								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Streetstyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Crafts
								</a>
							</div>
						</div>

						<!--  -->
						<div class="p-t-40">
							<h5 class="mtext-113 cl2 p-b-12">
								Leave a Comment
							</h5>

							<p class="stext-107 cl6 p-b-40">
								Your email address will not be published. Required fields are marked *
							</p>

							<form>
								<div class="bor19 m-b-20">
									<textarea class="stext-111 cl2 plh3 size-124 p-lr-18 p-tb-15" name="cmt" placeholder="Comment..."></textarea>
								</div>

								<div class="bor19 size-218 m-b-20">
									<input class="stext-111 cl2 plh3 size-116 p-lr-18" type="text" name="name" placeholder="Name *">
								</div>

								<div class="bor19 size-218 m-b-20">
									<input class="stext-111 cl2 plh3 size-116 p-lr-18" type="text" name="email" placeholder="Email *">
								</div>

								<div class="bor19 size-218 m-b-30">
									<input class="stext-111 cl2 plh3 size-116 p-lr-18" type="text" name="web" placeholder="Website">
								</div>

								<button class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04">
									Post Comment
								</button>
							</form>
						</div>
					</div>
				</div>

				<div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">
						<div class="bor17 of-hidden pos-relative">
							<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="search" placeholder="Search">

							<button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
								<i class="zmdi zmdi-search"></i>
							</button>
						</div>

						<div class="p-t-55">
							<h4 class="mtext-112 cl2 p-b-33">
								Categories
							</h4>

							<ul>
								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Fashion
									</a>
								</li>

								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Beauty
									</a>
								</li>

								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Street Style
									</a>
								</li>

								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Life Style
									</a>
								</li>

								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										DIY & Crafts
									</a>
								</li>
							</ul>
						</div>

						<div class="p-t-65">
							<h4 class="mtext-112 cl2 p-b-33">
								Featured Products
							</h4>

							<ul>
								<li class="flex-w flex-t p-b-30">
									<a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
										<img src="images/product-min-01.jpg" alt="PRODUCT">
									</a>

									<div class="size-215 flex-col-t p-t-8">
										<a href="#" class="stext-116 cl8 hov-cl1 trans-04">
											White Shirt With Pleat Detail Back
										</a>

										<span class="stext-116 cl6 p-t-20">
											$19.00
										</span>
									</div>
								</li>

								<li class="flex-w flex-t p-b-30">
									<a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
										<img src="images/product-min-02.jpg" alt="PRODUCT">
									</a>

									<div class="size-215 flex-col-t p-t-8">
										<a href="#" class="stext-116 cl8 hov-cl1 trans-04">
											Converse All Star Hi Black Canvas
										</a>

										<span class="stext-116 cl6 p-t-20">
											$39.00
										</span>
									</div>
								</li>

								<li class="flex-w flex-t p-b-30">
									<a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
										<img src="images/product-min-03.jpg" alt="PRODUCT">
									</a>

									<div class="size-215 flex-col-t p-t-8">
										<a href="#" class="stext-116 cl8 hov-cl1 trans-04">
											Nixon Porter Leather Watch In Tan
										</a>

										<span class="stext-116 cl6 p-t-20">
											$17.00
										</span>
									</div>
								</li>
							</ul>
						</div>

						<div class="p-t-55">
							<h4 class="mtext-112 cl2 p-b-20">
								Archive
							</h4>

							<ul>
								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											July 2018
										</span>

										<span>
											(9)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											June 2018
										</span>

										<span>
											(39)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											May 2018
										</span>

										<span>
											(29)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											April  2018
										</span>

										<span>
											(35)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											March 2018
										</span>

										<span>
											(22)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											February 2018
										</span>

										<span>
											(32)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											January 2018
										</span>

										<span>
											(21)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											December 2017
										</span>

										<span>
											(26)
										</span>
									</a>
								</li>
							</ul>
						</div>

						<div class="p-t-50">
							<h4 class="mtext-112 cl2 p-b-27">
								Tags
							</h4>

							<div class="flex-w m-r--5">
								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Fashion
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Lifestyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Denim
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Streetstyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Crafts
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>	
	
		

	<!-- Footer -->
	<footer class="bg3 p-t-75 p-b-32">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Categories
					</h4>

					<ul>
						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Women
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Men
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Shoes
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Watches
							</a>
						</li>
					</ul>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Help
					</h4>

					<ul>
						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Track Order
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Returns 
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Shipping
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								FAQs
							</a>
						</li>
					</ul>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						GET IN TOUCH
					</h4>

					<p class="stext-107 cl7 size-201">
						Any questions? Let us know in store at 8th floor, 379 Hudson St, New York, NY 10018 or call us on (+1) 96 716 6879
					</p>

					<div class="p-t-27">
						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-instagram"></i>
						</a>

						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-pinterest-p"></i>
						</a>
					</div>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Newsletter
					</h4>

					<form>
						<div class="wrap-input1 w-full p-b-4">
							<input class="input1 bg-none plh1 stext-107 cl7" type="text" name="email" placeholder="email@example.com">
							<div class="focus-input1 trans-04"></div>
						</div>

						<div class="p-t-18">
							<button class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04">
								Subscribe
							</button>
						</div>
					</form>
				</div>
			</div>

			<div class="p-t-40">
				<div class="flex-c-m flex-w p-b-18">
					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-01.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-02.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-03.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-04.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-05.png" alt="ICON-PAY">
					</a>
				</div>

				<p class="stext-107 cl6 txt-center">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a> &amp; distributed by <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

				</p>
			</div>
		</div>
	</footer>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
<<<<<<< HEAD
	</script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});
=======
		
		// 게시글 추천수
	    function bookmarkCount() {
			$.ajax({
				url: "CommBookCount.co",
                type: "POST",
                data: {
                    num: "<%=article.getNum()%>"
				},
				success : function(count) {
					$(".bookmark_count").html(count);
				},
			})
		}
		;
>>>>>>> 2406cc371e19785286e9c769a1bc353fde2f5605

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

<script type="text/javascript">

//카카오톡으로 공유하기 

Kakao.init('b62680a32c7f417cd4c5fd9d43ddd2e0');
function sendLink() {
  Kakao.Link.createDefaultButton({
  	container: '#kakao-link-btn',
    objectType: 'feed',
    content: {
      title: '<%=article.getSubject() %>',
      description: '게시글 공유',
      imageUrl:
        'upload/productUploadImg/<%=article.getImg() %>',
      link: {
        mobileWebUrl: 'http://localhost:8080/Itwillbs_8/CommDetail.co?num=<%=article.getImg()%>',
        webUrl: 'http://localhost:8080/Itwillbs_8/CommDetail.co?num=<%=article.getImg()%>',
      },
    },
    social: {
      likeCount: 286,
      commentCount: 45,
      sharedCount: 845,
    },
    buttons: [
      {
        title: '웹으로 보기',
        link: {
          mobileWebUrl: 'http://localhost:8080/Itwillbs_8/CommDetail.co?num=<%=article.getImg()%>',
          webUrl: 'http://localhost:8080/Itwillbs_8/CommDetail.co?num=<%=article.getImg()%>',
        }
      }]
  })
}
</script>

<jsp:include page="../inc/footer.jsp" />
</body>
</html>