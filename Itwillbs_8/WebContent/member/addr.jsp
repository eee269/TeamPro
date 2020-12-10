<%@page import="vo.AddrBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<AddrBean> addr = (ArrayList<AddrBean>)request.getAttribute("addrList");
	String member_id = (String) session.getAttribute("member_id");
%>

<jsp:include page="/inc/header.jsp" />
<!-- QuickMenu -->
<jsp:include page="/quickMenu.jsp" />


<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="Main.go" class="stext-109 cl8 hov-cl1 trans-04"> Home
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a>
		<a href="MemberMypage.mo" class="stext-109 cl8 hov-cl1 trans-04"> My Page
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> 
		<span class="stext-109 cl4"> My Address </span>
	</div>
</div>

<link type="text/css" rel="stylesheet" href="scss/common.css" />
<link type="text/css" rel="stylesheet" href="scss/mp_order.css" />
<link type="text/css" rel="stylesheet" href="scss/header.1.css" />
<link type="text/css" rel="stylesheet" href="scss/menu.2.css" />
<!-- 주문상세 시작 -->


<div id="contentWrapper">
	<div id="contentWrap">

		<div id="aside">
			<h2 class="aside-tit">MY ADDRESS</h2>
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
							<li><a href="Addr.ad">배송지관리</a></li>
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
					<h2>배송지관리</h2>
				</div>
				<div class="page-body">
					<!-- 주문 내역 리스트 -->
					<div class="table-d2-list">
						<table summary="번호, 주문일자, 상품명, 결제금액, 주문상세, 배송현황">
							<caption>배송지관리</caption>
							<colgroup>
								<col width="10%">
								<col width="22%">
								<col width="35%">
								<col width="23%">
								<col width="10%">
<!-- 								<col width="90"> -->
							</colgroup>
							<thead>
								<tr>
									<th scope="row"><div class="tb-center">번호</div></th>
										<th scope="row"><div class="tb-center">별명</div></th>
									<th scope="row"><div class="tb-center">주소</div></th>
									<th scope="row"><div class="tb-center">회원아이디</div></th>
									<th scope="row"><div class="tb-center">비고</div></th>
								</tr>
							</thead>
							<tbody>
<!-- 								<tr> -->
<!-- 									<td colspan="6"><div class="tb-center">주문내역이 없습니다.</div></td> -->
<!-- 								</tr> -->
<%
if(addr.size() == 0) {
	%>
	<tr><td colspan="9" style="padding:50px 20px; text-align:center; font-size: 15px;">
		<span>등록된 배송지가 없습니다.</span>
		
	</td></tr>
	<%
} else {
	for(int i = 0 ; i < addr.size() ; i++) {
		%>
					<tr>
									<td scope="row"><div class="tb-center"><%=addr.get(i).getNum() %></div></td>
									<td scope="row"><div class="tb-center"><%=addr.get(i).getLocation() %></div></td>
									<td scope="row"><div class="tb-center"><%=addr.get(i).getAddress() %></div></td>
									<td scope="row"><div class="tb-center"><%=addr.get(i).getMember_id() %></div></td>
									<td scope="row"><div class="tb-center"><%//=비고오오 %></div></td>
								</tr>
										<%
	}
}
%>
			
							</tbody>
						</table>
					</div>
					<!-- //주문 내역 리스트 -->

					<!-- 주문 내역 페이징 -->
					<div class="paging"></div>
					<!-- //주문 내역 페이징 -->

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