<%@page import="vo.PageInfo"%>
<%@page import="vo.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../inc/header.jsp" />
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
<!-- 대분류&소분류 -->
<div class="cate-wrap">
	<div class="bcate"><%if(type.equals("X")){%><%=xcode%><%}else if(type.equals("N")){%><%=ncode%><%} %></div>
	<div class="class-list">
		<ul class="cboth">
			<%for(int i =0; i<ncodeList.size(); i++){%>
			<li>
			<a href="ProductShop.po?type=N&xcode=<%=ncodeList.get(i).getXcode()%>&ncode=<%=ncodeList.get(i).getNcode()%>">
			   <%=ncodeList.get(i).getNcode()%></a>
			</li>
			<%} %>	
		</ul>
	</div>
</div>

<!-- 끝 -->


<!-- 베스트Product 시작-->
<div><a href="ProductUpload.po">상품등록페이지이동(임시)</a></div>
<div class="item-wrap best-item">
	<div class="sub_recommend_title">BEST PRODUCTS</div>
	<div class="item-cont">
	<%for(int i=0; i<bestList.size(); i++){
		String[] main = bestList.get(i).getMain_img().split("/");
	
	%>
		
		<dl class="item-list">
			<dt class="thumb">
				<a href="ProductDetail.po?basicCode=<%=bestList.get(i).getBasicCode() %>"
					class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"><img
					class="MS_prod_img_m"
					src="product/uploadImg/<%=main[0]%>"></a>

			</dt>
			<dd class="prd-info">
				<ul>
					<li class="prd-name"><a href="ProductDetail.po?basicCode=<%=bestList.get(i).getBasicCode() %>"
						class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"><%=bestList.get(i).getName() %>
							</a></li>
					<li class="subname"><%=bestList.get(i).getNcode() %>-<%=bestList.get(i).getBasicCode()%></li>
					<li class="prd-price"><span class="price"> <%=bestList.get(i).getPrice()%>\ </span></li>
					<li class="prd-ico"><span class="MK-product-icons"><img
							src="http://oryany.co.kr/shopimages/nasign/prod_icons/3858?1596008790"
							class="MK-product-icon-2"></span></li>
				</ul>
			</dd>
		</dl>
	<%}%>
	</div>
</div>
<!-- 베스트Product 끝 -->

<!-- Search -->
<div class="bg0 m-t-23 p-b-140">
	<div class="container">

		<div class="flex-w flex-sb-m p-b-52">

			<div class="flex-w flex-c-m m-tb-10">
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

		</div>
<!-- Search -->
<!-- 상품 -->
		<div class="row isotope-grid">
		<%for(int i=0; i<productList.size(); i++){
			String[] main = productList.get(i).getMain_img().split("/");
			%>
			<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
				<div class="block2">
					<div class="block2-pic hov-img0">
						<a href="ProductDetail.po?basicCode=<%=productList.get(i).getBasicCode() %>"
							class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"> <img
							src="product/uploadImg/<%=main[i]%>" alt="IMG-PRODUCT">
						</a> <a href="ProductDetail.po"
							class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
							Quick View </a>
					</div>

					<div class="block2-txt flex-w flex-t p-t-14">
						<div class="block2-txt-child1 flex-col-l ">
							<a href="ProductDetail.po?basicCode=<%=productList.get(i).getBasicCode() %>"
								class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
								<%=productList.get(i).getNcode() %>-<%=productList.get(i).getBasicCode()%>(<%=i%>) </a>
								<span class="stext-105 cl3"> <%=productList.get(i).getPrice()%>원</span>
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
<!-- 페이징 코드 -->
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
<!-- 페이징코드끝 -->		
	</div>
</div>




<jsp:include page="../inc/footer.jsp" />