<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.DecimalFormat"%>
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
	String sort = request.getParameter("sort");
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
	
	DecimalFormat priceFormat = new DecimalFormat("###,###");
	
	//상품 정렬 코드 
	if(sort != null){
		
		if(sort.equals("new")){
			
			for(int i=0; i<productList.size(); i++){
				
				productList.sort(new Comparator<ProductBean>(){
				
					@Override
					public int compare(ProductBean p1, ProductBean p2){
						int new1 = Integer.parseInt(p1.getBasicCode());
						int new2 = Integer.parseInt(p2.getBasicCode());
						if(new1 == new2){
							return 0;
						}else if(new1<new2){
							return 1;
						}else{
							return -1;
						}
					}
				
				});
			}
		}
		if(sort.equals("hprice")){
			
			for(int i=0; i<productList.size(); i++){
				
				productList.sort(new Comparator<ProductBean>(){
				
					@Override
					public int compare(ProductBean p1, ProductBean p2){
						int price1 = p1.getPrice();
						int price2 = p2.getPrice();
						if(price1 == price2){
							return 0;
						}else if(price1<price2){
							return 1;
						}else{
							return -1;
						}
					}
				
				});
			}
		}
	if(sort.equals("lprice")){
			
			for(int i=0; i<productList.size(); i++){
				
				productList.sort(new Comparator<ProductBean>(){
				
					@Override
					public int compare(ProductBean p1, ProductBean p2){
						int price1 = p1.getPrice();
						int price2 = p2.getPrice();
						if(price1 == price2){
							return 0;
						}else if(price1>price2){
							return 1;
						}else{
							return -1;
						}
					}
				
				});
			}
		}
	if(sort.equals("likey")){
		
		for(int i=0; i<productList.size(); i++){
			
			productList.sort(new Comparator<ProductBean>(){
			
				@Override
				public int compare(ProductBean p1, ProductBean p2){
					int like1 = p1.getLikey();
					int like2 = p2.getLikey();
					if(like1 == like2){
						return 0;
					}else if(like1>like2){
						return 1;
					}else{
						return -1;
					}
				}
			
			});
		}
	}
		
		
	}
	//상품정렬코드 끝!
	
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
					<li class="prd-price"><span class="price"> <%=priceFormat.format(bestList.get(i).getPrice())%>\ </span></li>
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
<!-- 정렬프론트 코드 -->
						<div class="container">
								<div class="cboth total-sort">
									<dl class="total">
									<dd><%=productList.size() %></dd>
									PRODUCTS IN THIS CATEGORY</dl>
									<dl class="sort">
									<dt class="blind">검색결과 정렬</dt>
									<dd>
										<ul>
										<%if(ncode !=null){%>
											<li><a href="ProductShop.po?type=<%=type%>&xcode=<%=xcode%>&ncode=<%=ncode%>&sort=new">신상품순</a>&nbsp;&nbsp;|</li>
											<li><a href="ProductShop.po?type=<%=type%>&xcode=<%=xcode%>&ncode=<%=ncode%>&sort=hprice">높은 가격순</a>&nbsp;&nbsp;|</li>
											<li><a href="ProductShop.po?type=<%=type%>&xcode=<%=xcode%>&ncode=<%=ncode%>&sort=lprice">낮은 가격순</a>&nbsp;&nbsp;|</li>
											<li><a href="ProductShop.po?type=<%=type%>&xcode=<%=xcode%>&ncode=<%=ncode%>&sort=likey">좋아요순</a>&nbsp;&nbsp;|</li>
										<% }else{%>
											<li><a href="ProductShop.po?type=<%=type%>&xcode=<%=xcode%>&sort=new">신상품순</a>&nbsp;&nbsp;|</li>
											<li><a href="ProductShop.po?type=<%=type%>&xcode=<%=xcode%>&sort=hprice">높은 가격순</a>&nbsp;&nbsp;|</li>
											<li><a href="ProductShop.po?type=<%=type%>&xcode=<%=xcode%>&sort=lprice">낮은 가격순</a>&nbsp;&nbsp;|</li>
											<li><a href="ProductShop.po?type=<%=type%>&xcode=<%=xcode%>&sort=likey">좋아요순</a>&nbsp;&nbsp;|</li>
										<% }%>										
										</ul>
									</dd>
									</dl>
								</div>
						</div>
<!-- 코드끝!! -->	
<!-- 상품 -->
		<div class="row isotope-grid">
		<%
		for(int i=0; i<productList.size(); i++){
			String[] main = productList.get(i).getMain_img().split("/");
			%>
			<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
				<div class="block2">
					<div class="block2-pic hov-img0">
						<a href="ProductDetail.po?basicCode=<%=productList.get(i).getBasicCode() %>"
							class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"> <img
							src="product/uploadImg/<%=main[0]%>" alt="IMG-PRODUCT">
						</a> 
					</div>

					<div class="block2-txt flex-w flex-t p-t-14">
						<div class="block2-txt-child1 flex-col-l ">
							<a href="ProductDetail.po?basicCode=<%=productList.get(i).getBasicCode() %>"
								class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
								<%=productList.get(i).getName()%></a>
								<span class="stext-105 cl3"> <%=priceFormat.format(productList.get(i).getPrice())%>원</span>
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