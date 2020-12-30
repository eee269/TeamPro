<%@page import="vo.CommBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<CommBean> articleList = (ArrayList)request.getAttribute("articleList");
	String member_id = (String) session.getAttribute("member_id");
%>

<jsp:include page="/inc/header.jsp" />
<!-- QuickMenu -->
<jsp:include page="/quickMenu.jsp" />

<style>
img:hover {
	cursor: pointer;
}

.productImg {
	width: 250px;
	max-height: 250px;
}
</style>
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="Main.go" class="stext-109 cl8 hov-cl1 trans-04"> Home
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a>
		<a href="MemberMypage.mo" class="stext-109 cl8 hov-cl1 trans-04"> My Page
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> 
		<span class="stext-109 cl4"> My Community </span>
	</div>
</div>

<link type="text/css" rel="stylesheet" href="css/common.css" />
<link type="text/css" rel="stylesheet" href="css/mp_order.css" />
<link type="text/css" rel="stylesheet" href="css/header.css" />
<link type="text/css" rel="stylesheet" href="css/menu_2.css" />
<!-- 주문상세 시작 -->


<div id="contentWrapper">
	<div id="contentWrap">

		<div id="aside">
			<h2 class="aside-tit">MY COMMUNITY</h2>
			<div class="lnb-wrap">
				<div class="lnb-bx">
					<h2 class="txt txt1">SHOPPING INFO</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a href="MyOrderList.or">주문내역</a></li>
							<li><a href="ProductMylikeList.po">내가 찜한 상품</a></li>
							<li><a href="ProductMyreviewList.po">내가 쓴 리뷰</a></li>
							<li><a href="ProductMyqnaList.po">상품 QnA</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt2">COMMUNITY INFO</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a href="MycommList.co">내 게시글 보기</a></li>
							<li><a href="MybookmarkList.co">내 북마크</a></li>
							<li><a href="MycommReplyList.co">내가 쓴 댓글</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt3">CUSTOMER INFO</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a href="MemberModifyForm.mo">회원정보변경</a></li>
							<li><a href="MyAddress.ad">배송지 관리</a></li>
							<li><a href="MemberDeleteForm.mo">회원탈퇴신청</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- .lnb-wrap -->
		</div>
		<!-- #aside -->
		<hr>
		<div id="content">
			<div id="myOrder">
				<div class="tit-page-2">
					<h2>내가 쓴 게시글</h2>
				</div>
				<div class="page-body">
					<!-- 글 리스트 -->
					<div class="table-d2-list">
						<table>
<%
int i=0, j=4;

if(articleList.size() == 0) {
	%>
	<tr><td colspan="4" style="padding:50px 20px; text-align:center; font-size: 15px;">
		<span>아직 작성한 게시글이 없습니다.</span>
		<br><br><br>
		<a href="CommList.co">게시글을 작성해 보세요!</a>
		
	</td></tr>
	<%
} else {
	
	for(CommBean article: articleList) {
		if(i%j == 0){
			%><tr style="height: 350px"><%
		}
		%> <td>
			<img alt="productImg" src="upload/commUpload/<%=article.getImg()%>" class="productImg"
				onerror="src='loading.png'" onclick="location.href='CommDetail.co?num=<%=article.getNum()%>'"><br>
			<span class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"><%=article.getSubject()%></span>&nbsp;&nbsp;&nbsp;
			<span class="stext-105 cl3"><%=article.getUsername() %></span><br>
			<span class="stext-105 cl3"><%=article.getDate() %></span>&nbsp;&nbsp;&nbsp;
<!-- 			북마크 -->
			<img src="https://img.icons8.com/material-rounded/24/000000/bookmark-ribbon--v1.png" onclick="delBook(<%=article.getNum()%>)"/>
		</td><%
		if(i%j == j-1) {
			%></tr><%
		}
		i++;
	}
	
}
%></table>
					</div>
					<!-- 주문 내역 페이징 -->
					<div class="paging"></div>
					<!-- //주문 내역 페이징 -->
<!-- 하단 여백 -->
<div style="height: 150px"></div>

				</div>
				<!-- .page-body -->
			</div>
			<!-- #myOrder -->
		</div>
		<!-- #content -->
	</div>
	<!-- #contentWrap -->
</div>


<!-- 주문상세 끝 -->


<jsp:include page="/inc/footer.jsp" />