<%@page import="vo.PageInfo"%>
<%@page import="vo.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />
<!-- QuickMenu -->
<jsp:include page="../quickMenu.jsp" />

<!-- Cart -->
<jsp:include page="../sub_cart.jsp" />
<%
	String xcode=request.getParameter("xcode");
	String ncode=request.getParameter("ncode");
	String type=request.getParameter("type");
	ArrayList<ProductBean> ncodeList = (ArrayList<ProductBean>)request.getAttribute("ncodeList");
	ArrayList<ProductBean> bestList = (ArrayList<ProductBean>)request.getAttribute("bestList");
	ArrayList<ProductBean> productList = (ArrayList<ProductBean>)request.getAttribute("productList");
	
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int listCount = pageInfo.getListCount();
	
	
	String small = null;
	if(xcode.equals("CLOTHES")){
		small = "clothes";
	}else if(xcode.equals("BAGS")){
		small = "bags";
	}else if(xcode.equals("SHOES")){
		small = "shoes";
	}
%>


<link type="text/css" rel="stylesheet" href="scss/common.css" />
<link type="text/css" rel="stylesheet" href="scss/shopbrand.css" />
<link type="text/css" rel="stylesheet" href="scss/header.1.css" />
<link type="text/css" rel="stylesheet" href="scss/menu.2.css" />

<div class="cboth sub_top_ban <%=small%>">
	<div class="width1260 sub_top_text"><%=xcode%></div>
</div>


<!-- 사이트 시작 -->
<div class="cate-wrap">
	<div class="bcate"><%if(type.equals("X")){%><%=xcode%><%}else if(type.equals("N")){%><%=ncode%><%} %></div>
	<div class="class-list">
		<ul class="cboth">
			<%for(int i =0; i<ncodeList.size(); i++){%>
			<li><a
				href="/shop/shopbrand.html?xcode=008&amp;type=N&amp;mcode=001"><%=ncodeList.get(i).getNcode()%></a></li>
			<%} %>
			
		</ul>
	</div>
	<!-- .class-list -->
</div>

<!-- 사이트 끝 -->


<!-- 베스트 시작-->
<div class="item-wrap best-item">
	<div class="sub_recommend_title">BEST PRODUCTS</div>
	<div class="item-cont">
	<%for(int i=0; i<bestList.size(); i++){%>
		
		<dl class="item-list">
			<dt class="thumb">
				<a href="product_detail.jsp"
					class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"><img
					class="MS_prod_img_m"
					src="http://oryany.co.kr/shopimages/nasign/0010010007552.jpg?1597366181"></a>

			</dt>
			<dd class="prd-info">
				<ul>
					<li class="prd-name"><a href="product_detail.jsp"
						class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">루키
							크로스바디</a></li>
					<li class="subname"><%=bestList.get(i).getNcode() %>-<%=bestList.get(i).getBasicCode()%></li>
					<li class="prd-price"><span class="price"> 219,000원 </span></li>
					<li class="prd-ico"><span class="MK-product-icons"><img
							src="http://oryany.co.kr/shopimages/nasign/prod_icons/3858?1596008790"
							class="MK-product-icon-2"></span></li>
				</ul>
			</dd>
		</dl>
	<%}%>
	</div>
</div>
<!-- 베스트 끝 -->

<!-- Product -->
<div class="bg0 m-t-23 p-b-140">
	<div class="container">

		<div class="flex-w flex-sb-m p-b-52">

			<div class="flex-w flex-c-m m-tb-10">
<!-- 				<div -->
<!-- 					class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter"> -->
<!-- 					<i -->
<!-- 						class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i> -->
<!-- 					<i -->
<!-- 						class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i> -->
<!-- 					Filter -->
<!-- 				</div> -->

				<div
					class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
					<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
					<i
						class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
					Search
				</div>
			</div>

			<!-- Search product -->
			<div class="dis-none panel-search w-full p-t-10 p-b-15">
				<div class="bor8 dis-flex p-l-15">
					<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>

					<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text"
						name="search-product" placeholder="Search">
				</div>
			</div>

			<!-- Filter -->
<!-- 			<div class="dis-none panel-filter w-full p-t-10"> -->
<!-- 				<div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm"> -->
<!-- 					<div class="filter-col1 p-r-15 p-b-27"> -->
<!-- 						<div class="mtext-102 cl2 p-b-15">Sort By</div> -->

<!-- 						<ul> -->
<!-- 							<li class="p-b-6"><a href="#" -->
<!-- 								class="filter-link stext-106 trans-04"> Default </a></li> -->

<!-- 							<li class="p-b-6"><a href="#" -->
<!-- 								class="filter-link stext-106 trans-04"> Popularity </a></li> -->

<!-- 							<li class="p-b-6"><a href="#" -->
<!-- 								class="filter-link stext-106 trans-04"> Average rating </a></li> -->

<!-- 							<li class="p-b-6"><a href="#" -->
<!-- 								class="filter-link stext-106 trans-04 filter-link-active"> -->
<!-- 									Newness </a></li> -->

<!-- 							<li class="p-b-6"><a href="#" -->
<!-- 								class="filter-link stext-106 trans-04"> Price: Low to High </a> -->
<!-- 							</li> -->

<!-- 							<li class="p-b-6"><a href="#" -->
<!-- 								class="filter-link stext-106 trans-04"> Price: High to Low </a> -->
<!-- 							</li> -->
<!-- 						</ul> -->
<!-- 					</div> -->

<!-- 					<div class="filter-col2 p-r-15 p-b-27"> -->
<!-- 						<div class="mtext-102 cl2 p-b-15">Price</div> -->

<!-- 						<ul> -->
<!-- 							<li class="p-b-6"><a href="#" -->
<!-- 								class="filter-link stext-106 trans-04 filter-link-active"> -->
<!-- 									All </a></li> -->

<!-- 							<li class="p-b-6"><a href="#" -->
<!-- 								class="filter-link stext-106 trans-04"> $0.00 - $50.00 </a></li> -->

<!-- 							<li class="p-b-6"><a href="#" -->
<!-- 								class="filter-link stext-106 trans-04"> $50.00 - $100.00 </a></li> -->

<!-- 							<li class="p-b-6"><a href="#" -->
<!-- 								class="filter-link stext-106 trans-04"> $100.00 - $150.00 </a></li> -->

<!-- 							<li class="p-b-6"><a href="#" -->
<!-- 								class="filter-link stext-106 trans-04"> $150.00 - $200.00 </a></li> -->

<!-- 							<li class="p-b-6"><a href="#" -->
<!-- 								class="filter-link stext-106 trans-04"> $200.00+ </a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->

<!-- 					<div class="filter-col3 p-r-15 p-b-27"> -->
<!-- 						<div class="mtext-102 cl2 p-b-15">Color</div> -->

<!-- 						<ul> -->
<!-- 							<li class="p-b-6"><span class="fs-15 lh-12 m-r-6" -->
<!-- 								style="color: #222;"> <i class="zmdi zmdi-circle"></i> -->
<!-- 							</span> <a href="#" class="filter-link stext-106 trans-04"> Black </a></li> -->

<!-- 							<li class="p-b-6"><span class="fs-15 lh-12 m-r-6" -->
<!-- 								style="color: #4272d7;"> <i class="zmdi zmdi-circle"></i> -->
<!-- 							</span> <a href="#" -->
<!-- 								class="filter-link stext-106 trans-04 filter-link-active"> -->
<!-- 									Blue </a></li> -->

<!-- 							<li class="p-b-6"><span class="fs-15 lh-12 m-r-6" -->
<!-- 								style="color: #b3b3b3;"> <i class="zmdi zmdi-circle"></i> -->
<!-- 							</span> <a href="#" class="filter-link stext-106 trans-04"> Grey </a></li> -->

<!-- 							<li class="p-b-6"><span class="fs-15 lh-12 m-r-6" -->
<!-- 								style="color: #00ad5f;"> <i class="zmdi zmdi-circle"></i> -->
<!-- 							</span> <a href="#" class="filter-link stext-106 trans-04"> Green </a></li> -->

<!-- 							<li class="p-b-6"><span class="fs-15 lh-12 m-r-6" -->
<!-- 								style="color: #fa4251;"> <i class="zmdi zmdi-circle"></i> -->
<!-- 							</span> <a href="#" class="filter-link stext-106 trans-04"> Red </a></li> -->

<!-- 							<li class="p-b-6"><span class="fs-15 lh-12 m-r-6" -->
<!-- 								style="color: #aaa;"> <i class="zmdi zmdi-circle-o"></i> -->
<!-- 							</span> <a href="#" class="filter-link stext-106 trans-04"> White </a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->

<!-- 					<div class="filter-col4 p-b-27"> -->
<!-- 						<div class="mtext-102 cl2 p-b-15">Tags</div> -->

<!-- 						<div class="flex-w p-t-4 m-r--5"> -->
<!-- 							<a href="#" -->
<!-- 								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5"> -->
<!-- 								Fashion </a> <a href="#" -->
<!-- 								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5"> -->
<!-- 								Lifestyle </a> <a href="#" -->
<!-- 								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5"> -->
<!-- 								Denim </a> <a href="#" -->
<!-- 								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5"> -->
<!-- 								Streetstyle </a> <a href="#" -->
<!-- 								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5"> -->
<!-- 								Crafts </a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
<!-- 상품 -->
		<div class="row isotope-grid">
		<%for(int i=0; i<productList.size(); i++){
			%>
			<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
				<!-- Block2 -->
				<div class="block2">
					<div class="block2-pic hov-img0">
						<a href="ProductDetail.po"
							class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"> <img
							src="images/product-01.jpg" alt="IMG-PRODUCT">
						</a> <a href="ProductDetail.po"
							class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
							Quick View </a>
					</div>

					<div class="block2-txt flex-w flex-t p-t-14">
						<div class="block2-txt-child1 flex-col-l ">
							<a href="ProductDetail.po"
								class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
								<%=productList.get(i).getNcode() %>-<%=productList.get(i).getBasicCode()%>(<%=i%>) </a> <span class="stext-105 cl3"> $16.64
							</span>
						</div>

						<div class="block2-txt-child2 flex-r p-t-3">
							<a href="#"
								class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
								<img class="icon-heart1 dis-block trans-04"
								src="images/icons/icon-heart-01.png" alt="ICON"> <img
								class="icon-heart2 dis-block trans-04 ab-t-l"
								src="images/icons/icon-heart-02.png" alt="ICON">
							</a>
						</div>
					</div>
				</div>
			</div>
		<% }%>

		</div>
<!-- 상품 -->
		<!-- Load more -->
<!-- 		<div class="flex-c-m flex-w w-full p-t-45"> -->
<!-- 			<a href="#" -->
<!-- 				class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04"> -->
<!-- 				Load More </a> -->
<!-- 		</div> -->
<!-- 		<div class="paging"> -->

<!-- 						 <a href="/shop/shopbrand.html?type=Y&xcode=009&sort=&page=1" class="first">&lt;&lt;</a> -->
<!--                          <a href="/shop/shopbrand.html?type=Y&xcode=007&sort=&page=1" class="now">1</a> -->
<!--                          <a href="/shop/shopbrand.html?type=Y&xcode=007&sort=&page=2">2</a> -->
<!--                          <a href="/shop/shopbrand.html?type=Y&xcode=007&sort=&page=3">3</a> -->
<!--                          <a href="/shop/shopbrand.html?type=Y&xcode=007&sort=&page=4">4</a> -->
<!--                          <a href="/shop/shopbrand.html?type=Y&xcode=007&sort=&page=4"  class="last">&gt;&gt;</a> -->
<!--         </div> -->
		<%if(type.equals("X")){%>
			
		<div class="paging">
	
		 <a href="ProductShop.po?type=X&xcode=<%=xcode%>&page=<%=startPage%>" class="first">&lt;&lt;</a>
		 <%for(int i = startPage; i <= endPage; i++) { 
				if(i == nowPage) { %>
				<a href="ProductShop.po?type=X&xcode=<%=xcode%>&page=<%=nowPage %>" class="now"><%=i %></a>
				<%} else { %>
				<a href="ProductShop.po?type=X&xcode=<%=xcode%>&page=<%=i%>"><%=i %></a>
				<%} %>
	 	<%} %>
	 
		 <a href="ProductShop.po?type=X&xcode=<%=xcode%>&page=<%=endPage%>"  class="last">&gt;&gt;</a>	
		</div>
		<%} %>
		
		<%if(type.equals("N")){%>	
		<div class="paging">
	
		 <a href="ProductShop.po?type=N&xcode=<%=xcode%>&ncode=<%=ncode %>&page=<%=startPage%>" class="first">&lt;&lt;</a>
		 <%for(int i = startPage; i <= endPage; i++) { 
				if(i == nowPage) { %>
				<a href="ProductShop.po?type=N&xcode=<%=xcode%>&ncode=<%=ncode %>&page=<%=nowPage %>" class="now"><%=i %></a>
				<%} else { %>
				<a href="ProductShop.po?type=N&xcode=<%=xcode%>&ncode=<%=ncode %>&page=<%=i%>"><%=i %></a>
				<%} %>
	 	<%} %>
	 
		 <a href="ProductShop.po?type=N&xcode=<%=xcode%>&ncode=<%=ncode %>&page=<%=endPage%>"  class="last">&gt;&gt;</a>	
		</div>
		<%} %>
		
	</div>
</div>



<jsp:include page="../footer.jsp" />