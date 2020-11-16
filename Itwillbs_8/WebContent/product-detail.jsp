<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="header.jsp" />

<!-- 별점 스크립트 -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.3.1/flatly/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://use.fontawesome.com/5ac93d4ca8.js"></script>
    <script src="js/bootstrap4-rating-input.js"></script>
    <style type="text/css">
      .rat { margin: 150px auto; font-size: 20px; }
    </style>
    <script type="text/javascript">
        $(function () {
            $('input').on('change', function () {
//                 alert("Changed: " + $(this).val())
            });
        });
    </script>
<!-- 끝 -->

<!-- TAB기능 -->
<style>

@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);

#powerReview .tabs {
  width: 100%;
  margin-bottom: 29px;
  border-bottom: 1px solid #d9d9d9;
}
#powerReview .tabs .tab {
  display: inline-block;
  margin-bottom: -1px;
  padding: 20px 15px 10px;
  cursor: pointer;
  letter-spacing: 0;
  border-bottom: 1px solid #d9d9d9;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
  transition: all 0.1s ease-in-out;
}
#powerReview .tabs .tab a {
  font-size: 11px;
  text-decoration: none;
  text-transform: uppercase;
  color: #d9d9d9;
  transition: all 0.1s ease-in-out;
}
#powerReview .tabs .tab.active a, body .container .tabs .tab:hover a {
  color: #263238;
}
#powerReview .tabs .tab.active {
  border-bottom: 1px solid #263238;
}


#powerReview .content .signup-cont {
  display: none;
}

@keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
@-webkit-keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
.credits {
  display: block;
  position: absolute;
  right: 0;
  bottom: 0;
  color: #999999;
  font-size: 14px;
  margin: 0 10px 10px 0;
}
.credits a {
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
  opacity: 0.8;
  color: inherit;
  font-weight: 700;
  text-decoration: none;
}
</style>



<!-- 끝 -->

<!-- 리뷰 팝업창  -->

<div id="viewPowerReview_wrapper" class="popup_wrapper"
	style="opacity: 0; visibility: hidden; position: fixed; overflow: auto; z-index: 100001; width: 100%; height: 100%; top: 0px; left: 0px; text-align: center; display: none;">
	<div id="viewPowerReview" data-popup-initialized="true"
		class="popup_content" aria-hidden="true" role="dialog" tabindex="-1"
		style="opacity: 0; visibility: hidden; outline: none; text-align: left; position: relative; vertical-align: middle; margin-top: 0px;">
		<div class="trans"></div>
		<div class="layer">
			<div class="lhd">
				<a href="#none" class="link-attach-image"><img
					src="http://board.makeshop.co.kr/board/special328/nasign_board8/20201107_205558_ro.jpg"
					style="width: 413px; height: 550px;" class="view_attach_image"
					alt=""></a> <a class="close"
					href="javascript:power_review_view_close();">X</a>
			</div>
			<div class="lcont">
				<div class="tiny">
					<a href="/shop/shopdetail.html?REFPP=view&amp;branduid=3359844"><img
						src="/shopimages/nasign/0030020000293.jpg" alt="">
						<p>평점 4.5</p>
						<p>리뷰 6</p> </a>
				</div>
				<div class="review" style="width: 461px;">
					<div class="star-icon">
						<span class="star"><em>★★★★★</em></span> <span class="survey">아주만족</span>
						<span class="icon"> <img
							src="/images/d3/modern_simple/ico_new_h38.png" alt="new"> <img
							src="/images/d3/modern_simple/ico_mobile_h38.png" alt="mobile">
							<img src="/images/d3/modern_simple/ico_camera_h38.png"
							alt="image">
						</span>
					</div>
					<div class="pr-options">
						<dl>
							<dt class="emp">구매한 옵션</dt>
							<dd class="emp">컬러 : BLACK, 사이즈 : S</dd>
						</dl>
					</div>
					<div class="content">사이즈때문에 고민되서 문의하고 주문했는데 잘 맞네요 가죽도 좋고 디자인도
						예쁘고 넘넘 맘에 드네요</div>
					<div class="pr-date">2020-11-07 nmoo*****</div>
					<div class="reply">
						<span>리뷰가 도움이 되셨나요?</span>
						<p>
							<a class="yes"
								href="javascript:power_review_good('995509', 'N', 'view');"
								style="background-color: rgb(255, 255, 255);"><span
								style="color: rgb(0, 0, 0);">0</span></a> <a class="no"
								href="javascript:power_review_bad('995509', 'N', 'view');"
								style="background-color: rgb(255, 255, 255);"><span
								style="color: rgb(0, 0, 0);">0</span></a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- .layer -->
	</div>
	<div class="popup_align"
		style="display: inline-block; vertical-align: middle; height: 100%;"></div>
</div>

<!-- 리뷰 팝업창 끝 -->


<link href="css/product.css" rel="stylesheet" type="text/css">
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
		</a> <a href="product.html" class="stext-109 cl8 hov-cl1 trans-04">
			Men <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> Lightweight Jacket </span>
	</div>
</div>


<!-- Product Detail -->
<section class="sec-product-detail bg0 p-t-65 p-b-60">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-lg-7 p-b-30">
				<div class="p-l-25 p-r-30 p-lr-0-lg">
					<div class="wrap-slick3 flex-sb flex-w">
						<div class="wrap-slick3-dots"></div>
						<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

						<div class="slick3 gallery-lb">
							<div class="item-slick3"
								data-thumb="images/product-detail-01.jpg">
								<div class="wrap-pic-w pos-relative">
									<img src="images/product-detail-01.jpg" alt="IMG-PRODUCT">

									<a
										class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
										href="images/product-detail-01.jpg"> <i
										class="fa fa-expand"></i>
									</a>
								</div>
							</div>

							<div class="item-slick3"
								data-thumb="images/product-detail-02.jpg">
								<div class="wrap-pic-w pos-relative">
									<img src="images/product-detail-02.jpg" alt="IMG-PRODUCT">

									<a
										class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
										href="images/product-detail-02.jpg"> <i
										class="fa fa-expand"></i>
									</a>
								</div>
							</div>

							<div class="item-slick3"
								data-thumb="images/product-detail-03.jpg">
								<div class="wrap-pic-w pos-relative">
									<img src="images/product-detail-03.jpg" alt="IMG-PRODUCT">

									<a
										class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
										href="images/product-detail-03.jpg"> <i
										class="fa fa-expand"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-lg-5 p-b-30">
				<div class="p-r-50 p-t-5 p-lr-0-lg">
					<h4 class="mtext-105 cl2 js-name-detail p-b-14">Lightweight
						Jacket</h4>

					<span class="mtext-106 cl2"> $58.79 </span>

					<p class="stext-102 cl3 p-t-23">Nulla eget sem vitae eros
						pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare
						feugiat.</p>

					<!--  -->
					<div class="p-t-33">
						<div class="flex-w flex-r-m p-b-10">
							<div class="size-203 flex-c-m respon6">Size</div>

							<div class="size-204 respon6-next">
								<div class="rs1-select2 bor8 bg0">
									<select class="js-select2" name="time">
										<option>Choose an option</option>
										<option>Size S</option>
										<option>Size M</option>
										<option>Size L</option>
										<option>Size XL</option>
									</select>
									<div class="dropDownSelect2"></div>
								</div>
							</div>
						</div>

						<div class="flex-w flex-r-m p-b-10">
							<div class="size-203 flex-c-m respon6">Color</div>

							<div class="size-204 respon6-next">
								<div class="rs1-select2 bor8 bg0">
									<select class="js-select2" name="time">
										<option>Choose an option</option>
										<option>Red</option>
										<option>Blue</option>
										<option>White</option>
										<option>Grey</option>
									</select>
									<div class="dropDownSelect2"></div>
								</div>
							</div>
						</div>

						<div class="flex-w flex-r-m p-b-10">
							<div class="size-204 flex-w flex-m respon6-next">
								<div class="wrap-num-product flex-w m-r-20 m-tb-10">
									<div
										class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
										<i class="fs-16 zmdi zmdi-minus"></i>
									</div>

									<input class="mtext-104 cl3 txt-center num-product"
										type="number" name="num-product" value="1">

									<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
										<i class="fs-16 zmdi zmdi-plus"></i>
									</div>
								</div>

								<button
									class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
									Add to cart</button>
							</div>
						</div>
					</div>

					<!--  -->
					<div class="flex-w flex-m p-l-100 p-t-40 respon7">
						<div class="flex-m bor9 p-r-10 m-r-11">
							<a href="#"
								class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100"
								data-tooltip="Add to Wishlist"> <i
								class="zmdi zmdi-favorite"></i>
							</a>
						</div>

						<a href="#"
							class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
							data-tooltip="Facebook"> <i class="fa fa-facebook"></i>
						</a> <a href="#"
							class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
							data-tooltip="Twitter"> <i class="fa fa-twitter"></i>
						</a> <a href="#"
							class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
							data-tooltip="Google Plus"> <i class="fa fa-google-plus"></i>
						</a>
					</div>
				</div>
			</div>
		</div>

		<div class="cboth width1260">

			<div id="page01" class="cboth pdt100"></div>
			<div class="cboth detail_tabmenu">
				<ul>
					<li><a href="#page01" class="tab_scroll on">상품상세정보</a></li>
					<li><a href="#page02" class="tab_scroll">상품사용후기 (6)</a></li>
					<li><a href="#page03" class="tab_scroll">상품 Q&amp;A (0)</a></li>
					<li><a href="#page04" class="tab_scroll">상품구매안내</a></li>
					<li><a href="#page05" class="tab_scroll bdr">배송/반품안내</a></li>
				</ul>
			</div>


			<div class="prd-detail">





				<div id="videotalk_area"></div>
				<!-- [OPENEDITOR] -->
				<p style="margin: 0px; text-align: center;">
					<span
						style="font-family: &amp; amp; quot; arial black&amp;amp; quot; , sans-serif; font-size: 2.5em;"><b>LAMSKIN
							FLARE SKIRT</b></span>
				</p>
				<br> <br> <br> <br>
				<table width="750" align="center" border="0" cellspacing="0"
					cellpadding="0">
					<tbody>
						<tr>
							<td align="center"><img style="margin-top: 50px;"
								src="http://nasign.cafe24.com/mall/product/detail/O9FHSK07_1.jpg?version=1"
								imgborder="0"><br> <img style="margin-top: 50px;"
								src="http://nasign.cafe24.com/mall/product/detail/O9FHSK07_2.jpg?version=1"
								imgborder="0"><br> <img style="margin-top: 50px;"
								src="http://nasign.cafe24.com/mall/product/detail/O9FHSK07_3.jpg?version=1"
								imgborder="0"><br> <img style="margin-top: 50px;"
								src="http://nasign.cafe24.com/mall/product/detail/O9FHSK07_4.jpg?version=1"
								imgborder="0"><br> <img style="margin-top: 50px;"
								src="http://nasign.cafe24.com/mall/product/detail/O9FHSK07_5.jpg?version=1"
								imgborder="0"><br> <img style="margin-top: 50px;"
								src="http://nasign.cafe24.com/mall/product/detail/O9FHSK07_6.jpg?version=1"
								imgborder="0"><br> <img style="margin-top: 50px;"
								src="http://nasign.cafe24.com/mall/product/detail/O9FHSK07_7.jpg?version=1"
								imgborder="0"><br></td>
						</tr>
					</tbody>
				</table>





				&gt;
				<!-- 몰티비 플레이어 노출 위치 -->
				<div id="malltb_video_player"
					style="margin-top: 10px; margin-bottom: 10px; text-align: center; display: none;"></div>

			</div>













			<a name="reviewboard"></a>
			<div class="cboth pdt100"></div>
			<div id="page02" class="cboth pdt100"></div>
			<div class="cboth detail_tabmenu">
				<ul>
					<li><a href="#page01" class="tab_scroll">상품상세정보</a></li>
					<li><a href="#page02" class="tab_scroll on">상품사용후기 (6)</a></li>
					<li><a href="#page03" class="tab_scroll">상품 Q&amp;A (0)</a></li>
					<li><a href="#page04" class="tab_scroll">상품구매안내</a></li>
					<li><a href="#page05" class="tab_scroll bdr">배송/반품안내</a></li>
				</ul>
			</div>




			<link type="text/css" rel="stylesheet"
				href="/template_common/shop/modern_simple/power_review_custom.4.css?t=201907151000">
			<div id="powerReview">
				<div class="hd-t">
					<p><strong>별점을 매겨주세요</strong></p>
					<!-- 별점 -->
					<div class="rat">
						<form action="test.jsp" method="post">
    						<input type="number" name="inputName" id="rating1" class="rating text-warning"  value="0"/>
						</form>
						
					</div>
					<!-- 별점 -->
				</div>
				<!-- .hd-t -->
				<div id="writePowerReview">
					<div class="PR15N01-write">
						<form name="prw_form" id="prw_form" action="" method="post"
							autocomplete="off">
							<input type="hidden" name="action_type" value=""> 
							<input type="hidden" name="product_uid" value="3359844">
							<input type="hidden" name="ordernum" value="">
							<input type="hidden" name="basketnum" value="">
							<input type="hidden" name="write_type" value="DETAIL">
							<input type="hidden" name="score1" value="5">
							<div class="pr-txtbox">
								<textarea name="content">매월 베스트리뷰 선정 상품권 증정!!
포토+텍스트 리뷰 등록 시 적립금 5,000원
텍스트 리뷰 등록 시 적립금 2,000원</textarea>
								<textarea style="display: none" name="board_writeword">매월 베스트리뷰 선정 상품권 증정!!
포토+텍스트 리뷰 등록 시 적립금 5,000원
텍스트 리뷰 등록 시 적립금 2,000원</textarea>
								<div class="thumb-wrap"></div>
							</div>
						</form>
					</div>
					<!-- .PR15N01-write -->
					<div class="PR15N01-recmd ">
						<div id="files" class="files"></div>
						<form name="prw_file_form" id="prw_file_form"
							action="http://board.makeshop.co.kr/upload.html" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="type" value="upload"> <input
								type="hidden" name="servername" value="special328"> <input
								type="hidden" name="url" value="oryany.co.kr"> <input
								type="hidden" name="code" value="nasign_board8"> <input
								type="hidden" name="size" value="512000"> <input
								type="hidden" name="org" value="nasign"> <input
								type="hidden" name="maxsize" value=""> <input
								type="hidden" name="Btype" value=""> <input
								type="hidden" name="img_resize" value="N"> <input
								type="hidden" name="img_maxwidth" value=""> <input
								type="hidden" name="gallery_type"> <input type="hidden"
								name="form_name" value="power_review"> <input
								type="hidden" name="mini_bgcolor" value=""> <input
								type="hidden" name="mini_size" value="100"> <input
								type="hidden" name="mini_space" value=""> <input
								type="hidden" name="fileobj_name" value="file_name1"> <input
								type="hidden" name="device_type" value="PC">
							<div class="cvr">
								<a class="pr-lnk-photo" href="#none"><input type="file"
									name="file" class="trick file-attach" id="fileupload"><span>사진추가</span></a>
							</div>
						</form>

						<div class="cvr right">
							<a class="lnk-review" href="javascript:power_review_submit();"><span>리뷰등록</span></a>
						</div>
					</div>
					<!-- .PR15N01-recmd -->
				</div>
				<div class="PR15N01-info">
					<dl class="score">
						<dt>4.5</dt>
						<dd>6개 리뷰 평점</dd>
					</dl>
					<div class="chart">
						<ul>
							<li><span class="tit">5 Stars</span> <span class="bar">
									<span class="abs" style="width: 67%"></span>
							</span> <span class="num">(4)</span></li>
							<li><span class="tit">4 Stars</span> <span class="bar">
									<span class="abs" style="width: 17%"></span>
							</span> <span class="num">(1)</span></li>
							<li><span class="tit">3 Stars</span> <span class="bar">
									<span class="abs" style="width: 17%"></span>
							</span> <span class="num">(1)</span></li>
							<li><span class="tit">2 Stars</span> <span class="bar">
									<span class="abs" style="width: 0%"></span>
							</span> <span class="num">(0)</span></li>
							<li><span class="tit">1 Stars</span> <span class="bar">
									<span class="abs" style="width: 0%"></span>
							</span> <span class="num">(0)</span></li>
						</ul>
					</div>
					<div class="photo">
						<ul>
							<li><a
								href="javascript:power_review_view_show('995509','00000', 0, 'photo');"><span></span><img
									src="http://board.makeshop.co.kr/board/special328/nasign_board8/square::20201107_205558_ro.jpg"
									alt=""></a></li>
							<li><a
								href="javascript:power_review_view_show('997709','00000', 0, 'photo');"><span></span><img
									src="http://board.makeshop.co.kr/board/special328/nasign_board8/square::20200128_220150.jpg"
									alt=""></a></li>
							<li><a
								href="javascript:power_review_view_show('998162','00000', 0, 'photo');"><span></span><img
									src="http://board.makeshop.co.kr/board/special328/nasign_board8/square::20191225_192339_ro.jpg"
									alt=""></a></li>
						</ul>
					</div>
					<p class="like">
						<strong>83%</strong>의 구매자들이 이 상품을 좋아합니다. (6명 중 5명)
					</p>
				</div>
				<!-- .PRSOIM01-info -->

				<div class="PR15N01-hd">
					<h2>
						프리미엄 상품평<span>(6개)</span>
					</h2>
					<ul class="sort">
						<li class="now" val="date"><a
							href="javascript:power_review_sort('date');">최신 순</a></li>
						<li val="score"><a
							href="javascript:power_review_sort('score');">평점 순</a></li>
						<li "="" val="good"><a
							href="javascript:power_review_sort('good');">추천 순</a></li>
					</ul>
				</div>
				<!-- .PR15N01-hd -->

			        <div class="tabs">
				            <span class="tab signin active"><a href="#signin">포토리뷰</a></span>
				            <span class="tab signup"><a href="#signup">일반리뷰</a></span>
			        </div>
			        <div class="content">
				            <div class="signin-cont cont">
					                <p>포토리뷰리스트</p>
    			   			</div>
    			            <div class="signup-cont cont">
                				    <p>일반리뷰리스트</p>
           		             </div>
			        </div>


				<div id="listPowerReview" class="MS_power_review_list">

					<ul class="PR15N01-review-wrap">
						<li id="power_review_block995509" class="power-review-list-box">
							<dl class="desc">
								<dt class="first">작성자</dt>
								<dd>nmoo*****</dd>
								<dt>작성일</dt>
								<dd>2020-11-07</dd>
								<dt>조회수</dt>
								<dd>
									<span id="power_review_showhits">7</span>
								</dd>
							</dl>
							<div class="hd-box">
								<div class="star-icon">
									<span class="star"><em>★★★★★</em></span> <span class="survey">아주만족</span>
									<span class="icon"> <img
										src="/images/d3/modern_simple/ico_new_h38.png" alt="new">
										<img src="/images/d3/modern_simple/ico_camera_h38.png"
										alt="camera"> <img
										src="/images/d3/modern_simple/ico_mobile_h38.png" alt="mobile">
									</span>
								</div>
							</div>
							<div class="pr-options" style="display: none;">
								<dl>
									<dt class="emp">구매한 옵션</dt>
									<dd class="emp">컬러 : BLACK, 사이즈 : S</dd>
								</dl>
							</div>
							<div class="content">
								<p class="content_p">
									<a href="javascript:power_review_more('995509', '00000');"
										class="more-options">사이즈때문에 고민되서 문의하고 주문했는데 잘 맞네요 가죽도 좋고
										디자인도 예쁘고 넘넘 맘에 드네요</a><a class="pr-close"
										href="javascript:power_review_more_close('995509');"> ...
										<span>닫기</span>
									</a>

								</p>
								<div class="ctr"></div>
							</div>
							<div class="photo-list">
								<ul>
									<li><a
										href="javascript:power_review_view_show('995509', '00000', '0', 'detail');"><span></span><img
											src="//board.makeshop.co.kr/board/special328/nasign_board8/square::20201107_205558_ro.jpg"
											alt=""></a>
										<div class="attach-preview"></div></li>
								</ul>
							</div>
							<div class="reply">
								<a class="cnt"
									href="javascript:power_review_view_comment('995509', '995509');">0
									▼</a> <span class="pr-txt">이 리뷰가 도움이 되셨나요?</span> <a class="yes"
									href="javascript:power_review_good('995509', 'N', 'shopdetail');"><span>0</span></a>
								<a class="no"
									href="javascript:power_review_bad('995509', 'N', 'shopdetail');"><span>0</span></a>
							</div>
							<div class="reply-wrap" style="display: none;">
								<div class="wrt">
									<textarea name="comment">댓글을 작성해 주세요~</textarea>
									<a
										href="javascript:power_review_comment_write('995509', '995509');">입력</a>
								</div>
								<ul class="lst">
									<li class="cw"></li>
									<li class="block_comment">
										<dl>
											<dt class="replace_icon">replace_writer</dt>
											<dd>
												<p>replace_comment</p>
												<div class="ctr" replace_btn="">
													<a class="modify" href="replace_link_modify">수정</a> <a
														class="delete" href="replace_link_del">삭제</a>
												</div>
											</dd>
										</dl>
									</li>
								</ul>
							</div>
						</li>
						<li id="power_review_block997709" class="power-review-list-box">
							<dl class="desc">
								<dt class="first">작성자</dt>
								<dd>lees*****</dd>
								<dt>작성일</dt>
								<dd>2020-01-28</dd>
								<dt>조회수</dt>
								<dd>
									<span id="power_review_showhits">184</span>
								</dd>
							</dl>
							<div class="hd-box">
								<div class="star-icon">
									<span class="star"><em>★★★★</em>★</span> <span class="survey">만족</span>
									<span class="icon"> <img
										src="/images/d3/modern_simple/ico_camera_h38.png" alt="camera">
										<img src="/images/d3/modern_simple/ico_mobile_h38.png"
										alt="mobile">
									</span>
								</div>
							</div>
							<div class="pr-options" style="display: none;">
								<dl>
									<dt class="emp">구매한 옵션</dt>
									<dd class="emp">컬러 : BLACK, 사이즈 : S</dd>
								</dl>
							</div>
							<div class="content">
								<p class="content_p">
									<a href="javascript:power_review_more('997709', '00000');"
										class="more-options">스커트 양가죽이서서 부드럽고 허리부분 일부도 밴드 처리되서 입는데
										편하네요<br>
									</a><a class="pr-close"
										href="javascript:power_review_more_close('997709');"> ...
										<span>닫기</span>
									</a>

								</p>
								<div class="ctr"></div>
							</div>
							<div class="photo-list">
								<ul>
									<li><a
										href="javascript:power_review_view_show('997709', '00000', '0', 'detail');"><span></span><img
											src="//board.makeshop.co.kr/board/special328/nasign_board8/square::20200128_220150.jpg"
											alt=""></a>
										<div class="attach-preview"></div></li>
								</ul>
							</div>
							<div class="reply">
								<a class="cnt"
									href="javascript:power_review_view_comment('997709', '997709');">0
									▼</a> <span class="pr-txt">이 리뷰가 도움이 되셨나요?</span> <a class="yes"
									href="javascript:power_review_good('997709', 'N', 'shopdetail');"><span>0</span></a>
								<a class="no"
									href="javascript:power_review_bad('997709', 'N', 'shopdetail');"><span>0</span></a>
							</div>
							<div class="reply-wrap" style="display: none;">
								<div class="wrt">
									<textarea name="comment">댓글을 작성해 주세요~</textarea>
									<a
										href="javascript:power_review_comment_write('997709', '997709');">입력</a>
								</div>
								<ul class="lst">
									<li class="cw"></li>
									<li class="block_comment">
										<dl>
											<dt class="replace_icon">replace_writer</dt>
											<dd>
												<p>replace_comment</p>
												<div class="ctr" replace_btn="">
													<a class="modify" href="replace_link_modify">수정</a> <a
														class="delete" href="replace_link_del">삭제</a>
												</div>
											</dd>
										</dl>
									</li>
								</ul>
							</div>
						</li>
						<li id="power_review_block998162" class="power-review-list-box">
							<dl class="desc">
								<dt class="first">작성자</dt>
								<dd>nh@f***</dd>
								<dt>작성일</dt>
								<dd>2019-12-25</dd>
								<dt>조회수</dt>
								<dd>
									<span id="power_review_showhits">176</span>
								</dd>
							</dl>
							<div class="hd-box">
								<div class="star-icon">
									<span class="star"><em>★★★★★</em></span> <span class="survey">아주만족</span>
									<span class="icon"> <img
										src="/images/d3/modern_simple/ico_camera_h38.png" alt="camera">
										<img src="/images/d3/modern_simple/ico_mobile_h38.png"
										alt="mobile">
									</span>
								</div>
							</div>
							<div class="pr-options" style="display: none;">
								<dl>
									<dt class="emp">구매한 옵션</dt>
									<dd class="emp">컬러 : BLACK, 사이즈 : S</dd>
								</dl>
							</div>
							<div class="content">
								<p class="content_p">
									<a href="javascript:power_review_more('998162', '00000');"
										class="more-options">무엇보다도 가죽의 품질이 너무 좋고 스커트 라인도 예쁩니다
										여성스러워요 저렴한 가격에 득템해서 흐뭇합니다</a><a class="pr-close"
										href="javascript:power_review_more_close('998162');"> ...
										<span>닫기</span>
									</a>

								</p>
								<div class="ctr"></div>
							</div>
							<div class="photo-list">
								<ul>
									<li><a
										href="javascript:power_review_view_show('998162', '00000', '0', 'detail');"><span></span><img
											src="//board.makeshop.co.kr/board/special328/nasign_board8/square::20191225_192339_ro.jpg"
											alt=""></a>
										<div class="attach-preview"></div></li>
								</ul>
							</div>
							<div class="reply">
								<a class="cnt"
									href="javascript:power_review_view_comment('998162', '998162');">0
									▼</a> <span class="pr-txt">이 리뷰가 도움이 되셨나요?</span> <a class="yes"
									href="javascript:power_review_good('998162', 'N', 'shopdetail');"><span>0</span></a>
								<a class="no"
									href="javascript:power_review_bad('998162', 'N', 'shopdetail');"><span>0</span></a>
							</div>
							<div class="reply-wrap" style="display: none;">
								<div class="wrt">
									<textarea name="comment">댓글을 작성해 주세요~</textarea>
									<a
										href="javascript:power_review_comment_write('998162', '998162');">입력</a>
								</div>
								<ul class="lst">
									<li class="cw"></li>
									<li class="block_comment">
										<dl>
											<dt class="replace_icon">replace_writer</dt>
											<dd>
												<p>replace_comment</p>
												<div class="ctr" replace_btn="">
													<a class="modify" href="replace_link_modify">수정</a> <a
														class="delete" href="replace_link_del">삭제</a>
												</div>
											</dd>
										</dl>
									</li>
								</ul>
							</div>
						</li>
					</ul>
					<!-- .PR15N01-review-wrap -->
					<div class="paging">
						<a class="now" href="#none"><span>1</span></a>

					</div>
					<!-- .paging -->
				</div>
				<div id="updatePowerReview" class="MS_power_review_update"></div>
				<div id="layerReplyModify" style="display: none">
					<div class="layer-wrap">
						<a class="close-layer" href="#layerReplyModify">닫기</a>
						<form name="pruc" id="pruc_form"
							action="/shop/power_review_comment.action.html" method="post"
							autocomplete="off">
							<div class="wrt">
								<textarea name="update_comment"></textarea>
							</div>
						</form>
						<div class="ctr">
							<a class="modify"
								href="javascript:power_review_update_comment();">수정</a>
						</div>
					</div>
					<!-- .layer-wrap -->
				</div>
				<!-- #layerReplyModify -->
			</div>
			<!-- #powerReview-->
			<p style="clear: both"></p>

			<div class="cboth pdt100"></div>
			<div id="page03" class="cboth pdt100"></div>
			<div class="cboth detail_tabmenu">
				<ul>
					<li><a href="#page01" class="tab_scroll">상품상세정보</a></li>
					<li><a href="#page02" class="tab_scroll">상품사용후기 (6)</a></li>
					<li><a href="#page03" class="tab_scroll on">상품 Q&amp;A (0)</a></li>
					<li><a href="#page04" class="tab_scroll">상품구매안내</a></li>
					<li><a href="#page05" class="tab_scroll bdr">배송/반품안내</a></li>
				</ul>
			</div>

         <a name="brandqna_list"></a>

<h1>리뷰 없을 때</h1>
         <div class="table-slide qna-list">
            <table summary="번호, 제목, 작성자, 작성일, 조회">
               <caption>QnA 리스트</caption>
               <tbody>
                  <tr class="nbg">
                     <td colspan="6"><div class="tb-center">등록된 문의가 없습니다.</div></td>
                  </tr>
               </tbody>
            </table>
            <div class="list-btm">
               <div class="btm_write">
                  <a
                     href="/board/board.html?code=nasign&amp;page=1&amp;type=i&amp;branduid=3359844&amp;returnurl=xcode=&amp;mcode=&amp;scode=">WRITE</a>
               </div>

            </div>
         </div>
         
         <h1>리뷰 있을 때</h1>
         
         <div class="table-slide qna-list">
                            <table summary="번호, 제목, 작성자, 작성일, 조회">
                                <caption>QnA 리스트</caption>
                                                                <colgroup>
                                    <col width="80">
                                    <col width="30">
                                    <col width="*">
                                    <col width="100">
                                    <col width="100">
                                    <col width="80">
                                </colgroup>
                                <thead style="display: table-header-group; vertical-align: middle; border-color: inherit;">
                                    <tr>
                                        <th scope="col"><div class="tb-center">NO</div></th>
                                        <th scope="col"></th>
                                        <th scope="col"><div class="tb-center">SUBJECT</div></th>
                                        <th scope="col"><div class="tb-center">NAME</div></th>
                                        <th scope="col"><div class="tb-center">DATE</div></th>
                                        <th scope="col"><div class="tb-center">HIT</div></th>
                                    </tr>
                                </thead>
                                <tbody>
                                                                        <tr class="nbg">
                                        <td><div class="tb-center"><span class="reviewnum">28</span></div></td>
                                        <td><div class="tb-center"></div></td>
                                        <td><div class="tb-left reply_depth0">
                                                                                        <span>
                                                                                                <img src="/board/images/neo_lock.gif">                                                <a href="javascript: show_hide('qna_board', '1', 'N', '', 'nasign', '996968', '00000', 'Y', '1', '3360293');">체인</a>
                                            </span>
                                            <span style="font-size: 8pt;">(1)</span>                                                                                                                                                                                </div></td>
                                        <td><div class="tb-center">지향</div></td>
                                        <td><div class="tb-center">2020.11.05</div></td>
                                        <td><div class="tb-center"><span id="qna_board_showhits1">3</span></div></td>
                                    </tr>
                                    <tr class="MS_qna_content_box cnt" id="qna_board_block1">
                                        <td colspan="6">
                                            <div class="tb-left">
                                                <div class="qna_board_content"></div>                                            </div>
                                        </td>
                                    </tr>
                                                                        <tr class="nbg">
                                        <td><div class="tb-center"><span class="reviewnum">27</span></div></td>
                                        <td><div class="tb-center"></div></td>
                                        <td><div class="tb-left reply_depth0">
                                                                                        <span>
                                                                                                <img src="/board/images/neo_lock.gif">                                                <a href="javascript: show_hide('qna_board', '2', 'Y', '', 'nasign', '997035', '00000', 'Y', '1', '3360293');">체인</a>
                                            </span>
                                            <span style="font-size: 8pt;">(1)</span>                                                                                                                                                                                </div></td>
                                        <td><div class="tb-center">김슬기</div></td>
                                        <td><div class="tb-center">2020.10.24</div></td>
                                        <td><div class="tb-center"><span id="qna_board_showhits2">7</span></div></td>
                                    </tr>
                                    <tr class="MS_qna_content_box cnt" id="qna_board_block2">
                                        <td colspan="6">
                                            <div class="tb-left">
                                                <div class="qna_board_content"></div>                                            </div>
                                        </td>
                                    </tr>
                                                                        <tr class="nbg">
                                        <td><div class="tb-center"><span class="reviewnum">26</span></div></td>
                                        <td><div class="tb-center"></div></td>
                                        <td><div class="tb-left reply_depth0">
                                                                                        <span>
                                                                                                <img src="/board/images/neo_lock.gif">                                                <a href="javascript: show_hide('qna_board', '3', 'N', '', 'nasign', '997092', '00000', 'Y', '1', '3360293');">체인</a>
                                            </span>
                                            <span style="font-size: 8pt;">(1)</span>                                                                                                                                                                                </div></td>
                                        <td><div class="tb-center">김가연</div></td>
                                        <td><div class="tb-center">2020.10.07</div></td>
                                        <td><div class="tb-center"><span id="qna_board_showhits3">5</span></div></td>
                                    </tr>
                                    <tr class="MS_qna_content_box cnt" id="qna_board_block3">
                                        <td colspan="6">
                                            <div class="tb-left">
                                                <div class="qna_board_content"></div>                                            </div>
                                        </td>
                                    </tr>
                                                                        <tr class="nbg">
                                        <td><div class="tb-center"><span class="reviewnum">25</span></div></td>
                                        <td><div class="tb-center"></div></td>
                                        <td><div class="tb-left reply_depth0">
                                                                                        <span>
                                                                                                <img src="/board/images/neo_lock.gif">                                                <a href="javascript: show_hide('qna_board', '4', 'N', '', 'nasign', '997096', '00000', 'Y', '1', '3360293');">체인</a>
                                            </span>
                                            <span style="font-size: 8pt;">(1)</span>                                                                                                                                                                                </div></td>
                                        <td><div class="tb-center">김소영</div></td>
                                        <td><div class="tb-center">2020.10.07</div></td>
                                        <td><div class="tb-center"><span id="qna_board_showhits4">2</span></div></td>
                                    </tr>
                                    <tr class="MS_qna_content_box cnt" id="qna_board_block4">
                                        <td colspan="6">
                                            <div class="tb-left">
                                                <div class="qna_board_content"></div>                                            </div>
                                        </td>
                                    </tr>
                                                                        <tr class="nbg">
                                        <td><div class="tb-center"><span class="reviewnum">24</span></div></td>
                                        <td><div class="tb-center"></div></td>
                                        <td><div class="tb-left reply_depth0">
                                                                                        <span>
                                                                                                <img src="/board/images/neo_lock.gif">                                                <a href="javascript: show_hide('qna_board', '5', 'Y', '', 'nasign', '997118', '00000', 'Y', '1', '3360293');">체인</a>
                                            </span>
                                            <span style="font-size: 8pt;">(1)</span>                                                                                                                                                                                </div></td>
                                        <td><div class="tb-center">배지혜</div></td>
                                        <td><div class="tb-center">2020.09.26</div></td>
                                        <td><div class="tb-center"><span id="qna_board_showhits5">4</span></div></td>
                                    </tr>
                                    <tr class="MS_qna_content_box cnt" id="qna_board_block5">
                                        <td colspan="6">
                                            <div class="tb-left">
                                                <div class="qna_board_content"></div>                                            </div>
                                        </td>
                                    </tr>
                                                                        <tr class="nbg">
                                        <td><div class="tb-center"><span class="reviewnum">23</span></div></td>
                                        <td><div class="tb-center"><img src="/board/images/neo_jpg.gif"></div></td>
                                        <td><div class="tb-left reply_depth0">
                                                                                        <span>
                                                                                                <img src="/board/images/neo_lock.gif">                                                <a href="javascript: show_hide('qna_board', '6', 'Y', '', 'nasign', '997137', '00000', 'Y', '1', '3360293');">체인</a>
                                            </span>
                                            <span style="font-size: 8pt;">(1)</span>                                                                                                                                                                                </div></td>
                                        <td><div class="tb-center">김애림</div></td>
                                        <td><div class="tb-center">2020.09.21</div></td>
                                        <td><div class="tb-center"><span id="qna_board_showhits6">9</span></div></td>
                                    </tr>
                                    <tr class="MS_qna_content_box cnt" id="qna_board_block6">
                                        <td colspan="6">
                                            <div class="tb-left">
                                                <div class="qna_board_content"></div>                                            </div>
                                        </td>
                                    </tr>
                                                                        <tr class="nbg">
                                        <td><div class="tb-center"><span class="reviewnum">22</span></div></td>
                                        <td><div class="tb-center"></div></td>
                                        <td><div class="tb-left reply_depth0">
                                                                                        <span>
                                                                                                <img src="/board/images/neo_lock.gif">                                                <a href="javascript: show_hide('qna_board', '7', 'Y', '', 'nasign', '997143', '00000', 'Y', '1', '3360293');">체인</a>
                                            </span>
                                            <span style="font-size: 8pt;">(1)</span>                                                                                                                                                                                </div></td>
                                        <td><div class="tb-center">양자현</div></td>
                                        <td><div class="tb-center">2020.09.20</div></td>
                                        <td><div class="tb-center"><span id="qna_board_showhits7">5</span></div></td>
                                    </tr>
                                    <tr class="MS_qna_content_box cnt" id="qna_board_block7">
                                        <td colspan="6">
                                            <div class="tb-left">
                                                <div class="qna_board_content"></div>                                            </div>
                                        </td>
                                    </tr>
                                                                        <tr class="nbg">
                                        <td><div class="tb-center"><span class="reviewnum">21</span></div></td>
                                        <td><div class="tb-center"></div></td>
                                        <td><div class="tb-left reply_depth0">
                                                                                        <span>
                                                                                                <img src="/board/images/neo_lock.gif">                                                <a href="javascript: show_hide('qna_board', '8', 'Y', '', 'nasign', '997224', '00000', 'Y', '1', '3360293');">체인</a>
                                            </span>
                                            <span style="font-size: 8pt;">(1)</span>                                                                                                                                                                                </div></td>
                                        <td><div class="tb-center">하서정</div></td>
                                        <td><div class="tb-center">2020.08.25</div></td>
                                        <td><div class="tb-center"><span id="qna_board_showhits8">5</span></div></td>
                                    </tr>
                                    <tr class="MS_qna_content_box cnt" id="qna_board_block8">
                                        <td colspan="6">
                                            <div class="tb-left">
                                                <div class="qna_board_content"></div>                                            </div>
                                        </td>
                                    </tr>
                                                                        <tr class="nbg">
                                        <td><div class="tb-center"><span class="reviewnum">20</span></div></td>
                                        <td><div class="tb-center"></div></td>
                                        <td><div class="tb-left reply_depth0">
                                                                                        <span>
                                                                                                <img src="/board/images/neo_lock.gif">                                                <a href="javascript: show_hide('qna_board', '9', 'N', '', 'nasign', '997237', '00000', 'Y', '1', '3360293');">체인</a>
                                            </span>
                                            <span style="font-size: 8pt;">(1)</span>                                                                                                                                                                                </div></td>
                                        <td><div class="tb-center">미미</div></td>
                                        <td><div class="tb-center">2020.08.23</div></td>
                                        <td><div class="tb-center"><span id="qna_board_showhits9">7</span></div></td>
                                    </tr>
                                    <tr class="MS_qna_content_box cnt" id="qna_board_block9">
                                        <td colspan="6">
                                            <div class="tb-left">
                                                <div class="qna_board_content"></div>                                            </div>
                                        </td>
                                    </tr>
                                                                        <tr class="nbg">
                                        <td><div class="tb-center"><span class="reviewnum">19</span></div></td>
                                        <td><div class="tb-center"></div></td>
                                        <td><div class="tb-left reply_depth0">
                                                                                        <span>
                                                                                                <img src="/board/images/neo_lock.gif">                                                <a href="javascript: show_hide('qna_board', '10', 'Y', '', 'nasign', '997241', '00000', 'Y', '1', '3360293');">체인</a>
                                            </span>
                                            <span style="font-size: 8pt;">(1)</span>                                                                                                                                                                                </div></td>
                                        <td><div class="tb-center">박명심</div></td>
                                        <td><div class="tb-center">2020.08.21</div></td>
                                        <td><div class="tb-center"><span id="qna_board_showhits10">4</span></div></td>
                                    </tr>
                                    <tr class="MS_qna_content_box cnt" id="qna_board_block10">
                                        <td colspan="6">
                                            <div class="tb-left">
                                                <div class="qna_board_content"></div>                                            </div>
                                        </td>
                                    </tr>
                                                                                                    </tbody>
                            </table>
                            <div class="list-btm">
                                                                                                <div class="paging-wrap">
                                    <div class="paging">
                                                                                
                                                                                                                            <a href="/shop/shopdetail.html?branduid=3360293&amp;xcode=006&amp;mcode=001&amp;qnapage=1#brandqna_list" class="now">1</a>
                                                                                                                                                                        <a href="/shop/shopdetail.html?branduid=3360293&amp;xcode=006&amp;mcode=001&amp;qnapage=2#brandqna_list">2</a>
                                                                                                                                                                        <a href="/shop/shopdetail.html?branduid=3360293&amp;xcode=006&amp;mcode=001&amp;qnapage=3#brandqna_list">3</a>
                                                                                    
                                                                                                                        <a href="/shop/shopdetail.html?branduid=3360293&amp;xcode=006&amp;mcode=001&amp;qnapage=3#brandqna_list" class="last">&gt;&gt;</a>
                                                                            </div>
                                </div>
                                                                                                                                <div class="btm_write">
                                    <a href="/board/board.html?code=nasign&amp;page=1&amp;type=i&amp;branduid=3360293&amp;returnurl=xcode=&amp;mcode=&amp;scode=">WRITE</a> 
                                </div>
                                 
                            </div>
                        </div>
         

			<a name="brandqna_list"></a>
			<div class="tit-detail">

				<p class="more fe">
					<a href="/board/board.html?code=nasign">+ MORE</a>
				</p>
			</div>
			<div class="table-slide qna-list">
				<table summary="번호, 제목, 작성자, 작성일, 조회">
					<caption>QnA 리스트</caption>
					<tbody>
						<tr class="nbg">
							<td colspan="6"><div class="tb-center">등록된 문의가 없습니다.</div></td>
						</tr>
					</tbody>
				</table>
				<div class="list-btm">
					<div class="btm_write">
						<a
							href="/board/board.html?code=nasign&amp;page=1&amp;type=i&amp;branduid=3359844&amp;returnurl=xcode=&amp;mcode=&amp;scode=">WRITE</a>
					</div>

				</div>
			</div>
			<!-- .qna-list -->


			<div class="cboth pdt100"></div>
			<div id="page04" class="cboth pdt100"></div>
			<div class="cboth detail_tabmenu">
				<ul>
					<li><a href="#page01" class="tab_scroll">상품상세정보</a></li>
					<li><a href="#page02" class="tab_scroll">상품사용후기 (6)</a></li>
					<li><a href="#page03" class="tab_scroll">상품 Q&amp;A (0)</a></li>
					<li><a href="#page04" class="tab_scroll on">상품구매안내</a></li>
					<li><a href="#page05" class="tab_scroll bdr">배송/반품안내</a></li>
				</ul>
			</div>

			<div class="cboth pdt30"></div>

			<!-- s: 상품 일반정보(상품정보제공 고시) -->
			<div id="productWrap">
				<table>
					<colgroup>
						<col width="210">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th><span>제품소재</span></th>
							<td><span>천연가죽(양가죽)</span></td>
						</tr>
						<tr>
							<th><span>색상</span></th>
							<td><span>BLACK, DEEP GREEN</span></td>
						</tr>
						<tr>
							<th><span>치수</span></th>
							<td><span>S, M, L</span></td>
						</tr>
						<tr>
							<th><span>제조자</span></th>
							<td><span>(주)내자인</span></td>
						</tr>
						<tr>
							<th><span>제조국</span></th>
							<td><span>한국</span></td>
						</tr>
						<tr>
							<th><span>세탁방법 및 취급시 주의사항</span></th>
							<td><span>가죽(모피)전문점 세탁 의뢰</span></td>
						</tr>
						<tr>
							<th><span>제조연월</span></th>
							<td><span>2019.07</span></td>
						</tr>
						<tr>
							<th><span>품질보증기준</span></th>
							<td><span>관련법 및 소비자 분쟁해결 규정에 따름</span></td>
						</tr>
						<tr>
							<th><span>A/S 책임자와 전화번호</span></th>
							<td><span>(주)내자인/02-6224-8900</span></td>
						</tr>
					</tbody>
				</table>
			</div>


			<!-- e: 상품 일반정보(상품정보제공 고시) -->




			<div class="cboth pdt100"></div>
			<div id="page05" class="cboth pdt100"></div>
			<div class="cboth detail_tabmenu">
				<ul>
					<li><a href="#page01" class="tab_scroll">상품상세정보</a></li>
					<li><a href="#page02" class="tab_scroll">상품사용후기 (6)</a></li>
					<li><a href="#page03" class="tab_scroll">상품 Q&amp;A (0)</a></li>
					<li><a href="#page04" class="tab_scroll">상품구매안내</a></li>
					<li><a href="#page05" class="tab_scroll on">배송/반품안내</a></li>
				</ul>
			</div>


			<!-- 배송/반품안내 내용 삽입영역 -->
			<div class="deli_info_area">
				<div class="deli_title">1. 주문 및 배송</div>
				<div class="deli_txt01">
					- 평일 오전 9시 이전 주문건은 당일 출고 진행되며, 이후 주문건은 익일(평일 기준) 출고 됩니다.<br> -
					당일 주문 건 중 물류에 재고가 없을 경우, 약 2~3일의 재고 수급 기간이 소요될 수 있으며,<br>
					&nbsp;&nbsp;부득이하게 재고 수급이 불가할 경우, 품절 안내를 드릴 수 있으니 구매 시 참고 부탁 드립니다.<br>
					- 사이즈 및 무게는 기준에 따라 약간의 오차가 있을 수 있으며, 모니터 사양에 따라 색상이 다르게 보일 수 있습니다.
				</div>

				<div class="deli_txt02">
					<div class="deli_title02">
						<span></span> 주문 전 오야니 프리미엄 가죽에 대한 정보를 확인해 주세요.
					</div>
					글로벌 토탈 패션 브랜드 오야니(ORYANY)는 명품 하우스에서 사용하는 최고급 소재를 고집하여 세계 최고의 검사,
					검증,<br> 테스트를 인증하는 SGS*의 인증처에서 엄격한 품질, 공정관리를 거쳐 제작되었습니다. 패셔너블한
					디자인으로 최상의 제품<br> 퀄리티를 선보이는 동시에 최고의 가치소비를 지향하며 합리적인 가격대를 제시합니다.<br>
					오야니의 가죽은 천연가죽으로, 미세한 핏줄자국, 주름, 반점 등이 보일 수 있습니다. 천연가죽의 특성으로 인한 가죽의
					상태와,<br> 제거가 가능한 실밥, 봉제선의 미세한 흔들림 등 핸드메이드 공정 중 발생할 수 있는 현상들은
					제품의 불량 사유에 해당하지<br> 않으니, 참고 부탁 드립니다.<br> * SGS는
					국제표준(ISO)절차를 준수하는 세계 최고의 검사, 검증, 테스트 및 인증 회사입니다.
					<div class="deli_title02">
						<span></span> LAUNDRY &amp; FABRIC CARE
					</div>
					- 천연가죽은 사람 피부와 동일 하므로 사용시 표면에 흠집 또는 색이 벗겨질 수 있습니다. 이는 제품의 하자가 아닌
					사용에 의한<br> &nbsp;&nbsp;자연적인 현상입니다.<br> - 상품 보관시 직사광선이나
					온도, 또는 습기가 높은 곳을 피하십시오.<br> - 가죽 염료는 수성이므로 면,마, 린넨 등의 흰 천연 섬유에
					오염될 염려가 있으므로 습기,땀 등에 주의하셔야 합니다.<br> - 천연가죽(스웨이드) 제품은 물에 젖었을 경우
					물이 빠질 수 있습니다.<br> - 에나멜, 가죽 및 합성피혁은 다른 소재와 밀착시 색이 이염되는 현상이
					있사오니, 취급 또는 보관시 주의하십시오.<br> - 볼펜이나 신문, 잡지 등에 색이 이염될 수 있으니
					주의해주시기 바랍니다.<br> - 물에 젖었을 경우 직사광선이나 열로 직접 건조하면 변질될 수 있으니 통풍이 잘
					되는 그늘에서 건조하시기 바랍니다.<br> - 가죽전용 크림으로 주 1회 정도 손질하여 주시면 제품을 오래
					사용하실 수 있습니다.<br> &nbsp;&nbsp;(단, 소재가 세무 종류일 경우에는 가죽 전용솔 및 깨끗한
					고무 지우개만 사용 가능)<br> - 오염되었을 때는 가죽전용 크림으로 세척하시고 일반세척제나 벤졸은 절대
					사용하시면 안됩니다.
				</div>

				<div class="deli_title">2. 교환 및 반품</div>
				<div class="deli_txt01">
					- 교환/반품 신청은 구매하신 사이트를 통해 접수 가능합니다.<br> - 상품 수령 후 7일 이내 미사용 제품에
					한해 신청 가능하며, 반품 상품 입고 확인 후 약 2~3일의 검품기간을 거쳐 교환/반품 진행됩니다.<br>
					&nbsp;&nbsp;(무통장 입금 건의 경우, 검품 완료 후 약 4~5일 정도의 환불 기간이 소요될 수 있습니다.)<br>
					- 오야니 직영몰 회원분께는 교환/반품 신청시 회수 접수 진행을 해드리고 있으며, 1회에 한해 무료 교환/반품
					가능합니다.
				</div>

				<div class="deli_txt02">
					<div class="deli_title02">
						<span></span> 교환/반품 불가 사유
					</div>
					- 상품 TAG을 제거 또는 포장 등의 손상이 있을 경우<br> - 제품을 사용했거나 사용 흔적이 있을 경우 /
					향수 또는 화장품 등 이물이 묻었을 경우<br> - 제품 구성품을 분실 또는 동봉하지 않은 경우<br>
					- 미세한 스크래치 또는 실밥, 이중 봉제 등 불량이 아닌 사유로 교환/반품 신청할 경우<br> - 포장 상태
					불량으로 인한 제품 훼손의 경우<br> - 구매 내역이 확인되지 않을 경우<br> - 교환/반품 접수를
					하지 않고 상품만 반송한 경우
				</div>

				<div class="deli_title">3. A/S 접수</div>
				<div class="deli_txt01">
					- 품질 보증 기준 : 구입일로부터 1년 (수선 내용에 따라 무상 또는 유상 수선 진행)<br> - 구매하시는
					고객님께는 개런티 카드가 발송되며, 개런티 카드를 지참하셔야 A/S가 가능합니다.<br> 1) 전국 오야니 매장
					방문 접수 (면세점 접수 불가)<br> 2) 택배 접수<br> - 고객정보, 구매정보, 수선 요청 사항
					기재 / 개런티 카드 (또는 구매내역서) 동봉<br> - 택배지 주소 : (04995) 서울시 광진구 군자동
					동일로 284, 4층 오야니 AS담당자 앞 (T.02-6224-8900)
				</div>



			</div>




		</div>

		<div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
			<span class="stext-107 cl6 p-lr-25"> SKU: JAK-01 </span> <span
				class="stext-107 cl6 p-lr-25"> Categories: Jacket, Men </span>
		</div>
</section>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<script>
try {
  fetch(new Request("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js", { method: 'HEAD', mode: 'no-cors' })).then(function(response) {
    return true;
  }).catch(function(e) {
    var carbonScript = document.createElement("script");
    carbonScript.src = "//cdn.carbonads.com/carbon.js?serve=CK7DKKQU&placement=wwwjqueryscriptnet";
    carbonScript.id = "_carbonads_js";
    document.getElementById("carbon-block").appendChild(carbonScript);
  });
} catch (error) {
  console.log(error);
}
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
$('.tabs .tab').click(function(){
    if ($(this).hasClass('signin')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signin-cont').show();
    } 
    if ($(this).hasClass('signup')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont').show();
    }
});
</script>


<jsp:include page="footer.jsp" />