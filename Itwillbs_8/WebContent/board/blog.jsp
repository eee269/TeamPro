<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp"/>
<!-- QuickMenu -->
<jsp:include page="../quickMenu.jsp" />

<!-- Cart -->
<jsp:include page="../sub_cart.jsp"/>

<style>
.fixed-img-collist {
	padding: 0px 0px 40px;
}

.fixed-img-collist ul {
	margin-right: -15px;
}

.fixed-img-collist ul li {
	float: left;
	margin: 0 0 40px 40px;
	width: 392px;
	padding: 15px;
}

.fixed-img-collist ul li:first-child {
	margin-left: 0px;
}

.fixed-img-collist ul li a {
	display: block;
	width: 100%
}

.fixed-img-collist ul li span {
	display: block;
	height: 100%;
	overflow: hidden;
}

.fixed-img-collist ul li span img {
	width: 100%;
	font-size: 0px;
}

.fixed-img-collist .inner {
	padding: 20px 30px 30px;
}

.fixed-img-collist .list_date_area {
	height: 30px;
	line-height: 30px;
}

.fixed-img-collist .list_date_area .new_name {
	font-size: 12px;
	font-weight: 700;
	letter-spacing: -0.5px;
	color: #d5b153;
}

.fixed-img-collist .list_date_area .date {
	font-size: 12px;
	color: #b4b4b4;
}

.fixed-img-collist .subject {
	color: #222;
	font-size: 16px;
	letter-spacing: -0.5px;
	padding: 0px 0px 10px;
	text-align: center;
}

.fixed-img-collist ul li p {
	font-size: 14px;
	color: #999999;
	width: 100%;
	letter-spacing: -0.25px;
	overflow: hidden;
	line-height: 2;
	text-align: center;
	font-weight: normal;
}

/* noimage */
.fixed-img-collist ul li a span.noimg {
	display: block;
	width: 600px;
	height: 100%;
	text-align: center;
	font-size: 18px;
	color: #f2f2f2;
	font-weight: bold;
	line-height: 254px;
	border: 1px solid #e9e9e9
}

.bor17 {
	right: 30%;
}
</style>

 
	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-02.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			Community
		</h2>
	</section>	
	
	<!-- ------------------------------------------------------------------------------------------------- -->
	
	<section class="bg0 p-t-62 p-b-60">
	<div class="container">
		<div class="fixed-img-collist">
		<%
			String orgsrc = "images/blog-0";
			for(int i  = 1 ; i < 7 ; i++) {
				String src = orgsrc+i+".jpg";
		%>
			<ul>
				<li><a href="blog-detail.jsp" class="hov-img0 how-pos5-parent">
						<img src=<%=src %> alt="IMG-BLOG">

						<div class="flex-col-c-m size-123 bg9 how-pos5">
							<span class="ltext-107 cl2 txt-center"> 22 </span> <span
								class="stext-109 cl3 txt-center"> Jan 2018 </span>
						</div>
				</a> <a href="blog-detail.html" class="ltext-108 cl2 hov-cl1 trans-04">
						8 Inspiring Ways to Wear Dresses in the Winter </a>
					</h4>

					<p class="stext-117 cl6">Class aptent taciti sociosqu ad litora
						torquent per conubia nostra, per inceptos himenaeos. Fusce eget
						dictum tortor. Donec dictum vitae sapien eu varius</p></li>
			</ul>
		<%
		src=orgsrc;
			}
			%>
		

			<div class="flex-r-m flex-w w-full p-t-10 m-lr--7">
				<a href="#"
					class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">
					1 </a> <a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7">
					2 </a>
			</div>
		</div>
	</div>

	<div class="col-md-4 col-lg-3 p-b-80">
		<div class="side-menu">

			<div class="bor17 of-hidden pos-relative" >
				<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text"
					name="search" placeholder="Search">

				<button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
					<i class="zmdi zmdi-search"></i>
				</button>
			</div>


		</div>
	</div>
	<!-- 		</div> -->
	</div>
</section>
	
	
	
	
	
	<!-- ------------------------------------------------------------------------------------------------- -->
	
	
<jsp:include page="../footer.jsp"/>