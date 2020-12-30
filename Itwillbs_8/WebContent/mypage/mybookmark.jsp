<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.CommBean"%>
<%@page import="vo.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String member_id = (String) session.getAttribute("member_id");

	ArrayList<CommBean> articleList = (ArrayList) request.getAttribute("articleList");
	
	SimpleDateFormat sdfYMD = new SimpleDateFormat("yy-MM-dd");
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
		<span class="stext-109 cl4"> My Bookmark </span>
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
			<h2 class="aside-tit">MY BOOKMARK</h2>
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
					<h2>내 북마크</h2>
				</div>
				<div class="page-body">
					<!-- 주문 내역 리스트 -->
					<div class="table-d2-list">
						<table>
<%

if(articleList.size() == 0) {
	%>
	<tr><td colspan="4" style="padding:50px 20px; text-align:center; font-size: 15px;">
		<span>관심있는 게시글이 없습니다.</span>
		
	</td></tr>
	<%
} else {%>
	
	<div class="row isotope-grid">
	<%for(int i  = 0 ; i < articleList.size(); i++) { 
		int c = articleList.get(i).getCommentCount(); %>
		<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item">
			<!-- Block2 -->
			<div class="block2">
				<div class="block2-pic hov-img0">
					<a href="CommDetail.co?num=<%=articleList.get(i).getNum() %>" class="hov-img0 how-pos5-parent">
						<img src="upload/commUpload/<%=articleList.get(i).getImg() %>" alt="IMG-BLOG" onerror="this.style.display='none'"style="width:300px; height:300px;"/>
					</a>
				</div>
				<div id="how-pos6" class="bookimg<%=articleList.get(i).getNum() %>" onclick="checkBook(<%=articleList.get(i).getNum() %>)">
					<img src="images/icons/bookmark_before.png" onerror="this.style.display='none'"/>
				</div>

				<div class="block2-txt flex-w flex-t p-t-14">
					<div class="block2-txt-child1 flex-col-l ">
						<a href="CommDetail.co?num=<%=articleList.get(i).getNum() %>"  class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
							<%=articleList.get(i).getSubject() %> <span><%=(c > 0 ? "("+c+")" : "")%></span>
						</a>
						<div class="stext-105 cl3 w-full">
							<span>
								<%=articleList.get(i).getUsername() %>
							</span>
							<span class="float-r">
								<%=sdfYMD.format(articleList.get(i).getDate()) %>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	<%} %>	
</div>
	
<%}
%></table>
					</div>
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
<script>
		// 북마크버튼 클릭시(북마크 추가 또는 북마크 제거)
		function checkBook(num){
			var member_id = '<%=member_id%>';
			if(member_id=='null'){
				if(!confirm("로그인을 하셔야 이용 가능합니다. 로그인을 하시겠습니까?")){
					return;
				}else{
					location.href='MemberLoginForm.mo';
				}
			}else{
				$.ajax({
					url: "CommBook.co",
	                type: "POST",
	                data: {
	                    num: num,
	                },
	                success: function () {
	                	var path = $('.bookimg'+num).children("img");
	                	path.attr("src",function(index,attr){
	                		if(attr.match('before')){
	                			swal("٩(ˊᗜˋ*)و" ,"게시글이 북마크에 추가됬습니다!", "success");
	                			return attr.replace("before","after");
	                		}else{
	                			swal("(｡•́︿•̀｡)","게시글이 북마크에서 삭제됬습니다!", "success");
	                			return attr.replace("after","before");
	                		}
	                	});
				        bookmarkCount(num);
	                },
				});
			}
		}
		// 게시글 북마크 수
	    function bookmarkCount(num) {
			var articleNum = num;
			$.ajax({
				url: "CommBookCount.co",
                type: "POST",
                data: {
                    num: articleNum
				},
				success : function(json) {
					var img = "images/icons/bookmark_after.png";
					var jsonP = JSON.parse(json);
					var book = "북마크 "+jsonP.total;
					if(!num){
						for(key in jsonP.list){
							var num = jsonP.list[key][key];
							$(".bookimg"+num).children().attr("src",img);
						}
					}
					$(".bookCount"+articleNum).html(book);
				},
			})
		};
		bookmarkCount();
</script>



<jsp:include page="/inc/footer.jsp" />