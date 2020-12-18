<%@page import="java.text.DecimalFormat"%>
<%@page import="vo.ProductBean"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/inc/header.jsp" />

<%
	String search = request.getParameter("search");

DecimalFormat priceFormat = new DecimalFormat("###,###");
ArrayList<ProductBean> productList = (ArrayList<ProductBean>) request.getAttribute("productList");
ArrayList<String> likeBaiscCodeList = (ArrayList<String>) request.getAttribute("likeBasicCodeList");
String member_id = (String) session.getAttribute("member_id");
%>

<!-- breadcrumb -->
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="Main.go" class="stext-109 cl8 hov-cl1 trans-04"> Home <i
			class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> <%=search%>
		</span>
	</div>
</div>

<link type="text/css" rel="stylesheet" href="css/common.css" />
<link type="text/css" rel="stylesheet" href="css/mp_main.css" />
<link type="text/css" rel="stylesheet" href="css/header.css" />
<link type="text/css" rel="stylesheet" href="css/menu_2.css" />
<!-- Shoping Cart -->


<div id="contentWrapper">
	<div id="contentWrap">

		<div id="content">
			<div id="mypage">
				<div class="page-body">
					<div class="hd">
						<h3>
							검색결과"<%=search%>"
						</h3>
					</div>
					<div class="lst">
						<div class="item-wrap">
							<div class="item-cont"></div>

							<table>
								<%
									if (productList.size() == 0) {
								%>
								<tr>
									<td colspan="4"
										style="padding: 50px 20px; text-align: center; font-size: 35px;">
										<span>검색어에 관련된 상품이 없습니다!</span>

									</td>
								</tr>
								<%
									}
								%>
							</table>
							<div class="row">
								<%
									if (productList.size() != 0) {

									for (int i = 0; i < productList.size(); i++) {
										String[] main = productList.get(i).getMain_img().split("/");
										String likeCheck = member_id + "/" + productList.get(i).getBasicCode();
								%>
								<div
									class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item blogBox moreBox"
									<%if (i > 3) {%> style="display: none;" <%}%>>
									<div class="block2">
										<div class="block2-pic hov-img0">
											<a
												href="ProductDetail.po?basicCode=<%=productList.get(i).getBasicCode()%>"
												class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
												<img src="upload/productUploadImg/<%=main[0]%>"
												alt="IMG-PRODUCT">
											</a>
										</div>

										<div class="block2-txt flex-w flex-t p-t-14">
											<div class="block2-txt-child1 flex-col-l ">
												<a
													href="ProductDetail.po?basicCode=<%=productList.get(i).getBasicCode()%>"
													class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
													<%=productList.get(i).getName()%></a> <span
													class="stext-105 cl3"> <%=priceFormat.format(productList.get(i).getPrice())%>원
												</span>
											</div>

											<div class="block2-txt-child2 flex-r p-t-3">
												<%
													if (member_id != null) {
												%>
												<button
													class="btn-addwish-b2 dis-block pos-relative js-addwish-b2 <%if (likeBaiscCodeList.contains(productList.get(i).getBasicCode())) {%>js-addedwish-b2<%} else {%>js-addedwish-b1<%}%>"
													value="<%=likeCheck%>">
													<img class="icon-heart1 dis-block trans-04"
														src="images/icons/icon-heart-01.png" alt="ICON"> <img
														class="icon-heart2 dis-block trans-04 ab-t-l"
														src="images/icons/icon-heart-02.png" alt="ICON">
												</button>
												<%
													} else {
												%>
												<a href="#" class="not_member"> <img
													class="icon-heart1 dis-block trans-04"
													src="images/icons/icon-heart-01.png" alt="ICON">
												</a>
												<%
													}
												%>
											</div>
										</div>
									</div>
								</div>
								<%
									}

								}
								%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/inc/footer.jsp" />