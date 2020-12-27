<%@page import="vo.CommBean"%>
<%@page import="vo.ProductBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/inc/header_index.jsp" />
<jsp:include page="/quickMenu_index.jsp" />
<link type="text/css" rel="stylesheet" href="css/common.css" />
<link type="text/css" rel="stylesheet" href="css/main_1.css" />
<link type="text/css" rel="stylesheet" href="css/header.css" />
<link type="text/css" rel="stylesheet" href="css/menu_1.css" />
<link type="text/css" rel="stylesheet" href="css/team.css" />

<%
	String member_id =(String)session.getAttribute("member_id");
	ArrayList<ProductBean> newList =(ArrayList<ProductBean>)request.getAttribute("newList");
	ArrayList<ProductBean> productList = (ArrayList<ProductBean>)request.getAttribute("productList");
	ArrayList<String> likeBaiscCodeList = (ArrayList<String>)request.getAttribute("likeBasicCodeList");
	DecimalFormat priceFormat = new DecimalFormat("###,###");
	
	ArrayList<CommBean> commList = (ArrayList) request.getAttribute("commList");
%>
<!-- Slider -->
<section class="section-slide">
	<div class="wrap-slick1">
		<div class="slick1">
			<div class="item-slick1"
				style="background-image: url(images/main_001.jpg);"></div>

			<div class="item-slick1"
				style="background-image: url(images/main_002.jpg);"></div>
		</div>
	</div>
</section>


<!-- 게시글 새 글 리스트 -->
<section class="bg0 p-t-23">
	<div class="container">
		<div class="main_pro_title_area cboth ">
			<div class="main_pro_title cboth">NEW ARTICLE</div>
		</div>

		<div class="row">
			<%
		for(int i=0; i<commList.size(); i++){
			CommBean article = commList.get(i);
			%>
			<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item blogBox moreBox">
				<div class="block2">
					<div class="block2-pic hov-img0">
<!-- 						main_1.css에 block2-pic클래스의 img width, height 300px로 지정해놨음 -->
						<a href="CommDetail.co?num=<%=article.getNum() %>" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"> 
							<img src="upload/commUpload/<%=article.getImg() %>" alt="IMG-PRODUCT"
								onerror="this.style.display='none'" width="300px" height="300px">
						</a> 
					</div>

					<div class="block2-txt flex-w flex-t p-t-14">
						<div class="block2-txt-child1 flex-col-l ">
							<a href="CommDetail.co?num=" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
								<%=article.getSubject() %></a>
							<span class="stext-105 cl3">
								<%=article.getUsername() %><br><%=article.getDate() %>
							</span>
						</div>
						
						
<!-- 						북마크				 -->
						<div class="block2-txt-child2 flex-r p-t-3">
							<% if(member_id != null) {%>
							<!-- 비워진 북마크 -->
							<a href="javascript:checkBook(<%=article.getNum()%>)">
								<img src="https://img.icons8.com/material-outlined/24/000000/bookmark-ribbon.png"/>
							</a>
							<% } else { %>
							
<!-- 							<img src="https://img.icons8.com/material-rounded/24/000000/bookmark-ribbon--v1.png"/> -->
							
							<a href="#" class="not_member">
								<img src="https://img.icons8.com/fluent-systems-regular/24/000000/bookmark-ribbon.png"/>
							</a>
							
							<% } %>

						</div>
					</div>
				</div>
			</div>
		<% }%>
		</div>
	</div>
	
</section>





<!-- 베스트 -->
<section class="bg0 p-t-23">
	<div class="container">
		<div class="main_pro_title_area cboth ">
			<div class="main_pro_title cboth">NEW ARRIVALS</div>
		</div>

		<div class="row">
			<%
		for(int i=0; i<newList.size(); i++){
			String[] main = newList.get(i).getMain_img().split("/");
			String likeCheck = member_id+"/"+newList.get(i).getBasicCode();
			%>
			<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item blogBox moreBox">
				<div class="block2">
					<div class="block2-pic hov-img0">
						<a href="ProductDetail.po?basicCode=<%=newList.get(i).getBasicCode()%>"
							class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"> <img
							src="upload/productUploadImg/<%=main[0]%>" alt="IMG-PRODUCT">
						</a> 
					</div>

					<div class="block2-txt flex-w flex-t p-t-14">
						<div class="block2-txt-child1 flex-col-l ">
							<a href="ProductDetail.po?basicCode=<%=newList.get(i).getBasicCode() %>"
								class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
								<%=newList.get(i).getName()%></a>
								<span class="stext-105 cl3"> <%=priceFormat.format(newList.get(i).getPrice())%>원</span>
						</div>

						<div class="block2-txt-child2 flex-r p-t-3">
							<%if(member_id != null){ %>
							<button 
								class="btn-addwish-b2 dis-block pos-relative js-addwish-b2 <%
								if(likeBaiscCodeList.contains(newList.get(i).getBasicCode())){
								%>js-addedwish-b2<%
								}else{
									%>js-addedwish-b1<%
									}%>" 
								value="<%=likeCheck%>">
								<img class="icon-heart1 dis-block trans-04"
								src="images/icons/icon-heart-01.png" alt="ICON"> 
								<img class="icon-heart2 dis-block trans-04 ab-t-l"
								src="images/icons/icon-heart-02.png" alt="ICON">
							</button>
							<%}else{ %>
							<a href="#"
								class="not_member">
								<img class="icon-heart1 dis-block trans-04"
								src="images/icons/icon-heart-01.png" alt="ICON">
							</a>
							<%} %>
						</div>
					</div>
				</div>
			</div>
		<% }%>
		</div>
	</div>
	
</section>

<!-- 이벤트 배너 2개 -->
<div class="event_ban_area">
	<ul>
		<!--  			좌측 첫번째 배너  -->
		<li class="fleft"><a href="/shop/shopdetail.html?branduid=30"><img
				src="http://nasign.cafe24.com/mall/main/event_ban01.jpg"></a></li>

		<!-- 			우측 두번째 배너  -->
		<li class="fright"><a
			href="/shop/shopdetail.html?branduid=3360163"><img
				src="http://nasign.cafe24.com/mall/main/event_ban02.jpg"></a></li>

	</ul>
</div>
<div class="cboth"></div>

<section class="bg0 p-t-23">
	<div class="container">


		<div class="main_pro_title_area cboth ">
			<div class="main_pro_title cboth">BEST SELLER</div>
		</div>


		<div class="row">
			<%
		for(int i=0; i<productList.size(); i++){
			String[] main = productList.get(i).getMain_img().split("/");
			String likeCheck = member_id+"/"+productList.get(i).getBasicCode();
			%>
			<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item blogBox moreBox">
				<div class="block2">
					<div class="block2-pic hov-img0">
						<a href="ProductDetail.po?basicCode=<%=productList.get(i).getBasicCode()%>"
							class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"> <img
							src="upload/productUploadImg/<%=main[0]%>" alt="IMG-PRODUCT">
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
							<%if(member_id != null){ %>
							<button 
								class="btn-addwish-b2 dis-block pos-relative js-addwish-b2 <%
								if(likeBaiscCodeList.contains(productList.get(i).getBasicCode())){
								%>js-addedwish-b2<%
								}else{
									%>js-addedwish-b1<%
									}%>" 
								value="<%=likeCheck%>">
								<img class="icon-heart1 dis-block trans-04"
								src="images/icons/icon-heart-01.png" alt="ICON"> 
								<img class="icon-heart2 dis-block trans-04 ab-t-l"
								src="images/icons/icon-heart-02.png" alt="ICON">
							</button>
							<%}else{ %>
							<a href="#"
								class="not_member">
								<img class="icon-heart1 dis-block trans-04"
								src="images/icons/icon-heart-01.png" alt="ICON">
							</a>
							<%} %>
						</div>
					</div>
				</div>
			</div>
		<% }%>
		</div>
	</div>
	
</section>
<%
	
	String[] name ={"SUJIN","JUNGHA","SANGBIN","BYUNGHOON","UNA","YEJIN","SEYONG"};
	String[] github={"jeongsujin001","pumkin-ha","SangBinKR","lbhlucky","GoUNaa","eee269","xeyong"};
%>
<section id="team">
	<div class="container">
		<div class="main_pro_title_area cboth ">
			<div class="main_pro_title cboth">MEET OUR TEAM</div>
		</div>
		<div class="row mt-50">
			<%
				for (int i = 0; i < 7; i++) {
			%>
			<div class="col-xl-3 col-sm-6 mb-5">
				<div class="team-single wow zoomIn" data-wow-delay=".3s">
					<div class="team-thumb">
						<img
							src="https://www.tolmatol.com/uploads-images/bootrap-snippets-our-team/3.jpg"
							alt="" />
						<div class="social-icons style-2">
							<a href="https://github.com/<%=github[i]%>" target="blank" class="fa fa-github"></a>
							<a href="" class="fa fa-instagram"></a>
							<a href="" class="fa fa-facebook"></a>
						</div>
					</div>
					<div class="team-bio">
						<h4><%=name[i] %></h4>
						<h5>#OOTD</h5>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
</section>

<script type="text/javascript">
function checkBook(num) {
	$.ajax({
		url: "CommBook.co",
		type: "POST",
		data: {
			num:num
		},
		success: function(data) {
			alert("북마크 설정 완료");
		}
	})
}
</script>

<jsp:include page="/inc/footer.jsp" />