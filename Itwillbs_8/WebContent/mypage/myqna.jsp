<%@page import="vo.ProdQnaBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String member_id = (String) session.getAttribute("member_id");
	
	ArrayList<ProdQnaBean> myqnaList = (ArrayList) request.getAttribute("myqnaList");
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
		</a> <span class="stext-109 cl4"> My QnA </span>
	</div>
</div>

<link type="text/css" rel="stylesheet" href="css/common.css" />
<link type="text/css" rel="stylesheet" href="css/mp_order.css" />
<link type="text/css" rel="stylesheet" href="css/header.css" />
<link type="text/css" rel="stylesheet" href="css/menu_2.css" />
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
			<h2 class="aside-tit">MY QnA</h2>
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
					<h2>나의 상품 문의글</h2>
				</div>
				<div class="page-body">
					<div class="table-d2-list">
						<table>
							<colgroup>
								<col width="100">
								<col width="*">
								<col width="200">
								<col width="100">
							</colgroup>
							<tbody>
								<%
									if (myqnaList.size() == 0) {
								%>
								<tr>
									<td colspan="4" style="padding: 50px 20px; text-align: center; font-size: 15px;">
										<span>작성하신 문의글이 없습니다.</span>

									</td>
								</tr>
								<%
									} else {
									for(ProdQnaBean qna: myqnaList) {
										if(qna.getQna_re_lev() != 2) {
											%>
											<tr onclick="location.href='ProductDetail.po?basicCode=<%=qna.getProduct_basicCode() %>#page03'">
												<td scope="row"><div class="tb-center"><%=qna.getQna_num() %></div></td>
												<td scope="row"><div class="tb-center"><%=qna.getQna_subject()%></div></td>
												<td scope="row"><div class="tb-center"><%=qna.getQna_date() %></div></td>
												<td scope="row"><div class="tb-center"><%=qna.getQna_readcount() %></div></td>
											</tr>
											<%
										}
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

<jsp:include page="/inc/footer.jsp" />