<%@page import="vo.PageInfo"%>
<%@page import="vo.CommBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<CommBean> articleList = (ArrayList<CommBean>)request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int listCount = pageInfo.getListCount();
%>
<jsp:include page="../inc/header.jsp"/>
<!-- QuickMenu -->
<jsp:include page="../quickMenu.jsp" />

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


/* ê²ìì°½ ìì  */
.bor17 {
	right: 30%
}


</style>


<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92"
   style="background-image: url('images/bg-02.jpg');">
   <h2 class="ltext-105 cl0 txt-center">Community</h2>
</section>


<!-- ---------------------------Content page--------------------------- -->
<section class="bg0 p-t-62 p-b-60">
	<div class="container">
		<div class="fixed-img-collist">
<!--       		<div class="row isotope-grid"> -->
			<%
			for(int i  = 0 ; i < articleList.size(); i++) {
			%>
			<ul>
				<li>
					<a href="CommDetail.co?num=<%=articleList.get(i).getNum() %>&rePage=1" class="hov-img0 how-pos5-parent">
						<img src="communityUpload/<%=articleList.get(i).getImg() %>" alt="IMG-BLOG"/>
						<div class="flex-col-c-m size-123 bg9 how-pos5">
							<span class="ltext-107 cl2 txt-center"> 22 </span> 
							<span class="stext-109 cl3 txt-center"> <%=articleList.get(i).getDate() %></span>
						</div>
					</a>
					<%=articleList.get(i).getSubject() %>
				</li>
			</ul>
				
<!-- 			<ul> -->
<!-- 	      		<li> -->
<%-- 	      			<a href="CommDetail.co?num=<%=articleList.get(i).getNum() %>"> --%>
<!-- 					<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women"> -->
<%-- 						<%=articleList.get(i).getSubject() %> --%>
<!-- 						<div class="block2"> -->
<!-- 							<div class="block2-pic hov-img0"> -->
<%-- 								<img src="communityUpload/<%=articleList.get(i).getImg() %>" alt="<%=articleList.get(i).getImg()%>"> --%>
<!-- 							</div> -->
<!-- 							<div class="block2-txt flex-w flex-t p-t-14"> -->
<!-- 								<div class="block2-txt-child1 flex-col-l "> -->
<%-- 										<%=articleList.get(i).getUsername() %> --%>
<!-- 									<span class="stext-105 cl3"> -->
<%-- 										<%=articleList.get(i).getDate() %> --%>
<!-- 									</span> -->
<!-- 								</div> -->
<!-- 								<div class="block2-txt-child2 flex-r p-t-3"> -->
<!-- 									<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2"> -->
<!-- 										<img class="icon-heart1 dis-block trans-04" src="images/icons/icon-heart-01.png" alt="ICON"> -->
<!-- 										<img class="icon-heart2 dis-block trans-04 ab-t-l" src="images/icons/icon-heart-02.png" alt="ICON"> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!-- 				</li> -->
<!-- 			</ul> -->
			<%}%>
			<div class="bor17 of-hidden pos-relative float-r" >
				<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="search" placeholder="Search">
				<button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
					<i class="zmdi zmdi-search"></i>
				</button>
			</div>
			<div class="flex-r-m flex-w w-full p-t-10 m-lr--7">
				<a href="CommWriteForm.co">글쓰기</a> <br>
				<%if(nowPage <= 1) {%>
					<input type="button" value="이전">&nbsp;
				<%}else {%>
					<input type="button" value="이전" onclick="location.href='CommList.bo?page=<%=nowPage - 1 %>'">&nbsp;
				<%} %>
				<%for(int i = startPage; i <= endPage; i++) { 
					if(i == nowPage) { %>
						[<%=i %>]&nbsp;
					<%}else { %>
						<a href="CommList.bo?page=<%=i %>" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">[<%=i %>]</a>&nbsp;
					<%} %>
				<%} %>
				<%if(nowPage >= maxPage) { %>
					<input type="button" value="다음">
				<%}else { %>
					<input type="button" value="다음" onclick="location.href='CommList.bo?page=<%=nowPage + 1 %>'">
				<%}%>
				<span id="SPACE_PAGE" style="width: 115px;"></span>
			</div>
		</div>
	</div>
</section>
<!-- ---------------------------Content page--------------------------- -->
<jsp:include page="../inc/footer.jsp" />
</body>
</html>