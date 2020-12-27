<%@page import="java.text.DecimalFormat"%>
<%@page import="vo.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.CommBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<CommBean> articleList = (ArrayList<CommBean>)request.getAttribute("articleList");
	ArrayList<ProductBean> bestList = (ArrayList<ProductBean>)request.getAttribute("bestList");
	DecimalFormat priceFormat = new DecimalFormat("###,###");

   	String member_id = (String)session.getAttribute("member_id");
	if(member_id == null){
		%>
		<script>
			alert("잘못된 접근입니다!");
			history.back();
		</script>
		<%
	} 
%>
<style>
.container-menu-desktop{
	z-index: 1000;
}

</style>
<link rel="stylesheet" type="text/css" href="css/comm_write.css">
<jsp:include page="../inc/header.jsp"/>
<!-- QuickMenu -->
<jsp:include page="../quickMenu.jsp" />
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="Main.go" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="CommList.co" class="stext-109 cl8 hov-cl1 trans-04">
				Community
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				Write
			</span>
		</div>
	</div>
	<!-- Content page -->
<section class="bg0 p-t-52 p-b-20">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-9 p-b-80">
				<div class="p-r-45 p-r-0-lg">
					<!-- 글쓰기 폼 -->
					<form action="CommWritePro.co" method="post" enctype="multipart/form-data" name="fr">
						<span>썸네일</span>
						<div id="image_container" class="mg-b-5" style="width:60px; height:60px; border: 1px solid black;"></div>
						<input type="file" name="img" id="img" onchange="setThumbnail(event);" required="required"><br>
     					<input type="text" id="subject" name="subject" placeholder="제목" class="MS_input_txt input_style2" required="required">
						<textarea id ="summernote" name="content" required="required"></textarea><br>
						<div class="flex-w flex-c-m m-tb-10 float-r" >
							<i class="cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
							<input type="submit" value="완료" class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn bg-none">
							<a href="CommList.co">
								<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn">
								<i class="cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
								글목록
								</div>
							</a>
						</div>
					</form>
					<!-- 글쓰기 폼 -->
				</div>
			</div>
			<div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">
<!-- 						<div> -->
<!-- 							<h4 class="mtext-112 cl2 p-b-33"> -->
<!-- 								Categories -->
<!-- 							</h4> -->

<!-- 							<ul> -->
<!-- 								<li class="bor18"> -->
<!-- 									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"> -->
<!-- 										Fashion -->
<!-- 									</a> -->
<!-- 								</li> -->

<!-- 								<li class="bor18"> -->
<!-- 									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"> -->
<!-- 										Beauty -->
<!-- 									</a> -->
<!-- 								</li> -->

<!-- 								<li class="bor18"> -->
<!-- 									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"> -->
<!-- 										Street Style -->
<!-- 									</a> -->
<!-- 								</li> -->

<!-- 								<li class="bor18"> -->
<!-- 									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"> -->
<!-- 										Life Style -->
<!-- 									</a> -->
<!-- 								</li> -->

<!-- 								<li class="bor18"> -->
<!-- 									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"> -->
<!-- 										DIY & Crafts -->
<!-- 									</a> -->
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 						</div> -->

						<div class="size-304">
							<h4 class="mtext-112 cl2 p-b-33">
								베스트 게시물
							</h4>

							<ul>
								<%for(CommBean cb : articleList){ %>
									<li class="flex-w flex-t p-b-30">
										<a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
											<img src="upload/commUpload/<%=cb.getImg() %>" alt="PRODUCT">
										</a>
	
										<div class="size-215 flex-col-t p-t-8">
											<a href="#" class="stext-116 cl8 hov-cl1 trans-04">
												<%=cb.getSubject() %>
											</a>
	
											<span class="stext-116 cl6 p-t-20">
												<%=cb.getUsername() %>
											</span>
										</div>
									</li>
								<%} %>
							</ul>
						</div>
						<div class="p-t-65 size-304">
							<h4 class="mtext-112 cl2 p-b-33">
								베스트 상품
							</h4>

							<ul>
								<%for(int i=0; i<(bestList.size() < 4 ? bestList.size() : 4); i++){
									String[] main = bestList.get(i).getMain_img().split("/");
								
								%>
									<li class="flex-w flex-t p-b-30">
										<a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
											<img src="upload/productUploadImg/<%=main[0]%>" alt="PRODUCT">
										</a>
	
										<div class="size-215 flex-col-t p-t-8">
											<a href="#" class="stext-116 cl8 hov-cl1 trans-04">
												<%=bestList.get(i).getName() %>
											</a>
											<span class="stext-116 cl6 p-t-20">
												<%=priceFormat.format(bestList.get(i).getPrice())%>
											</span>
										</div>
									</li>
								<%} %>
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
<script>
	function setThumbnail(event) {
			var reader = new FileReader();
			reader.onload = function(event) {
			if(!img){
				var img = document.createElement("img");
				img.setAttribute("src", event.target.result);
				img.setAttribute("class", "writeImge");
				img.setAttribute("style", "width:50px;");
				img.setAttribute("style", "height:50px;");
				document.querySelector("div#image_container").appendChild(img);
			}else{
				
			}
			
		};
		reader.readAsDataURL(event.target.files[0]);
	}
</script>
<jsp:include page="../inc/footer.jsp"/>
<!-- WriteEditor -->
<jsp:include page="../inc/writeEditor.jsp"/>
<!-- WriteEditor -->
</body>
</html>