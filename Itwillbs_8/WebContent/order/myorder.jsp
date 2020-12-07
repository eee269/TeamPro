<%@page import="java.util.ArrayList"%>
<%@page import="vo.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<OrderBean> order = (ArrayList<OrderBean>)request.getAttribute("orderList");
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
		<span class="stext-109 cl4"> My Order </span>
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
			<h2 class="aside-tit">MY ORDER</h2>
			<div class="lnb-wrap">
				<div class="lnb-bx">
					<h2 class="txt txt1">SHOPPING INFO</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a href="MyOrderList.or">주문내역</a></li>
							<li><a href="ProductLikeList.po">상품 보관함</a></li>
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
							<li><a href="CommBookmarkList.co">내 북마크</a></li>
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
					<h2>주문내역</h2>
					<p class="dsc">
						<span class="fc-blue"><%=member_id %> </span>님께서 주문하신 내역입니다.
					</p>
				</div>
				<div class="page-body">
					<!-- 주문 내역 리스트 -->
					<div class="table-d2-list">
						<table summary="번호, 주문일자, 상품명, 결제금액, 주문상세, 배송현황">
							<caption>주문내역</caption>
							<colgroup>
								<col width="150">
								<col width="100">
								<col width="*">
								<col width="200">
								<col width="*">
<!-- 								<col width="90"> -->
							</colgroup>
							<thead>
								<tr>
									<th scope="row"><div class="tb-center">주문코드</div></th>
										<th scope="row"><div class="tb-center">주문자명</div></th>
									<th scope="row"><div class="tb-center">전화번호</div></th>
									<th scope="row"><div class="tb-center">배송지</div></th>
									<th scope="row"><div class="tb-center">주문날짜</div></th>
									<th scope="row"><div class="tb-center">결제방식</div></th>
										<th scope="row"><div class="tb-center">아이디</div></th>
									<th scope="row"><div class="tb-center">배송현황</div></th>
									<th scope="row"><div class="tb-center">상세목록</div></th>
								</tr>
							</thead>
							<tbody>
<!-- 								<tr> -->
<!-- 									<td colspan="6"><div class="tb-center">주문내역이 없습니다.</div></td> -->
<!-- 								</tr> -->
<%
if(order.size() == 0) {
	%>
	<tr><td colspan="9" style="padding:50px 20px; text-align:center; font-size: 15px;">
		<span>아직 주문한 내역이 없습니다.</span>
		
	</td></tr>
	<%
} else {
	for(int i = 0 ; i < order.size() ; i++) {
		%>
					<tr>
									<td scope="row"><div class="tb-center"><%=order.get(i).getCode() %></div></td>
									<td scope="row"><div class="tb-center"><%=order.get(i).getName() %></div></td>
									<td scope="row"><div class="tb-center"><%=order.get(i).getPhone() %></div></td>
									<td scope="row"><div class="tb-center"><%=order.get(i).getAddress() %></div></td>
									<td scope="row"><div class="tb-center"><%=order.get(i).getDate() %></div></td>
									<td scope="row"><div class="tb-center"><%=order.get(i).getPayment() %></div></td>
									<td scope="row"><div class="tb-center"><%=member_id %></div></td>
									<td scope="row"><div class="tb-center"><%=order.get(i).getStatus() %></div></td>
									<td scope="row">
										<div class="tb-center">
										<a href="MyorderDetail.or?code=<%=order.get(i).getCode()%>">상세목록조회</a>
										</div>
									</td>
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

					<!-- 주문 내역 info -->
					<ul class="foot-dsc">
						<li>- 상품명 또는 주문상세의 조회 버튼을 클릭하시면, 주문상세 내역을 확인하실 수 있습니다.</li>
						<li>- 배송현황의 조회 버튼을 클릭하시면, 해당 주문의 배송 현황을 한눈에 확인하실 수 있습니다.</li>
					</ul>
					<!-- //주문 내역 info -->

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