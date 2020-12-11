<%@page import="java.util.Iterator"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.HashMap"%>
<%@page import="vo.CommBean"%>
<%@page import="vo.CommReBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String member_id = (String) session.getAttribute("member_id");
	
	ArrayList<CommReBean> myreplyList = (ArrayList) request.getAttribute("myreplyList");
	HashMap<Integer, CommBean> articleList = (HashMap) request.getAttribute("articleList");
	int cnt = myreplyList.size();
%>

<jsp:include page="/inc/header.jsp" />
<!-- QuickMenu -->
<jsp:include page="/quickMenu.jsp" />


<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="Main.go" class="stext-109 cl8 hov-cl1 trans-04"> Home <i
			class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <a href="MemberMypage.mo" class="stext-109 cl8 hov-cl1 trans-04">
			My Page <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> My Comment </span>
	</div>
</div>

<link type="text/css" rel="stylesheet" href="scss/common.css" />
<link type="text/css" rel="stylesheet" href="scss/mp_order.css" />
<link type="text/css" rel="stylesheet" href="scss/header.1.css" />
<link type="text/css" rel="stylesheet" href="scss/menu.2.css" />
<!-- 주문상세 시작 -->

<script type="text/javascript">
	function addtag() {
		var html = 
			"<tr>" + 
			"<td scope='row'></td>" + 
			"<td scope='row'><div class='tb-center'></div></td>" +
			"<td scope='row'><div class='tb-center'></div></td>" +
			"<td scope='row'><div class='tb-center'></div></td>" +
			"</tr>";
	}
</script>


<div id="contentWrapper">
	<div id="contentWrap">

		<div id="aside">
			<h2 class="aside-tit">MY COMMENT</h2>
			<div class="lnb-wrap">
				<div class="lnb-bx">
					<h2 class="txt txt1">SHOPPING INFO</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a href="MyOrderList.or">주문내역</a></li>
							<li><a href="ProductMylikeList.po">내가 찜한 상품</a></li>
							<li><a href="#">내 상품 리뷰</a></li>
							<li><a href="#">상품 QnA</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt2">COMMUNITY INFO</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a href="MycommList.co">내 게시글 보기</a></li>
							<li><a href="mybookmarkList.co">내 북마크</a></li>
							<li><a href="#">내 게시글 리뷰</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt3">CUSTOMER INFO</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a href="MemberModifyForm.mo">회원정보변경</a></li>
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
					<h2>내가 쓴 댓글&nbsp;&nbsp;&nbsp; (<%=cnt %> 개)</h2>
				</div>
				<div class="page-body">
					<div class="table-d2-list">
						<table>
							<colgroup>
								<col width="50">
								<col width="50">
								<col width="*">
								<col width="200">
							</colgroup>
							<thead>
								<tr>
									<th scope="row" colspan=""></th>
								</tr>
							</thead>
							<tbody>
								<%
									if (myreplyList.size() == 0) {
								%>
								<tr>
									<td colspan="4" style="padding: 50px 20px; text-align: center; font-size: 15px;">
										<span>작성하신 댓글이 없습니다.</span>

									</td>
								</tr>
								<%
									} else {
								int num = 0;
								
								Object[] mapkey = articleList.keySet().toArray();
								Arrays.sort(mapkey);
								
								for(Integer key : articleList.keySet()) {
									CommBean article = articleList.get(key);
									num = article.getNum();
									%>
									<tr id="article<%=num %>" onload="addtag(this.id)"
 										 onclick="location.href='CommDetail.co?num=<%=num%>'">
										<td scope="row" colspan="2"><div class="tb-center"><%=num%></div></td>
										<td scope="row"><div class="tb-center"><%=article.getSubject()%></div></td>
										<td scope="row"><div class="tb-center"><%=article.getUsername()%></div></td>
									</tr >
									
									<%
								}

								}
								%>

							</tbody>
						</table>
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


<!-- 주문상세 끝 -->

<script type="text/javascript">
$(function() {
	function addtag(trId) {
		var replyId = <%=myreplyList.get(0)%>
	}
});
</script>


<jsp:include page="/inc/footer.jsp" />