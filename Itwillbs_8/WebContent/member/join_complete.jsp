<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp"/>

<style>
#header, #layerWrap, #contentWrap, #ftLink .link, #footer { width:1260px; }
#content { width:1260px;min-height:600px;background-color:#fff; margin:20px auto 0px;}
#contentWrap {background-color:#fff;}
body {min-width:1260px;}
a {text-decoration:none;}
body, h1, h2, h3, h4, h5, h6, table, input, select, textarea, a {font-family:'Roboto', 'Nanum Gothic',Dotum, AppleGothic, Helvetica, sans-serif;}

.cbtn{display:inline-block;font-size:11px;color:#000;min-width:98px;height:31px;line-height:32px;border:1px solid #000;text-align:center;-webkit-transition:all 0.3s ease;transition:all 0.3s ease;}
.cbtn.form{}
.cbtn.form.action{background-color:#000;color:#fff;}
.cbtn.form:hover{background-color:#000;color:#fff;}
.cbtn.form.action:hover{background-color:#fff;color:#000;}

#join-complete{padding-bottom:80px;color:#000;}
.imgWrap.title-img{text-align:center; padding:100px 0 40px }
.tit-join-complete{font-size:44px;letter-spacing:-2px;color:#000;font-weight:bold;line-height:54px;text-align:center;}
.complete-box{padding-top:16px;line-height:20px;color:#7f7f7f;font-size:14px;text-align:center;}
							
.join-footer{text-align:center;padding-top:50px }
.join-footer .cbtn.form{width:228px;height:58px;line-height:58px;font-size:16px;margin:0 5px;}

</style>
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

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								White Shirt Pleat
							</a>

							<span class="header-cart-item-info">
								1 x $19.00
							</span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="images/item-cart-02.jpg" alt="IMG">
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





	<!-- Content page -->
	<section class="bg0 p-t-75 p-b-120">
		<div class="container">




				<div id="content">
					<div id="join-complete">
						<div class="imgWrap title-img">
							<img src="//image.makeshop.co.kr/makeshop/d3/basic_simple/member/member_join_complete.png" alt="회원가입이 완료되었습니다.">
						</div>
						<h1 class="tit-join-complete">회원가입 완료</h1>
						<div class="complete-box">
							<dl>
								<dt>정수진의 회원가입이 성공적으로 이루어졌습니다.</dt>
								<dd>
									<p>
										(주)내자인과 함께 즐거운 쇼핑 되세요!<br>										
																				정수진님의 축하적립금은 <span class="join-point">5000원</span> 입니다.<br>
																													</p>
								</dd>
							</dl>
							
							<div class="btnArea join-footer">
								<div class="center">									
									<a href="../index.jsp" class="cbtn form">메인화면</a>
								</div>
							</div>
						</div>
					</div>
                </div>







		</div>
	</section>	

<jsp:include page="../footer.jsp"/>