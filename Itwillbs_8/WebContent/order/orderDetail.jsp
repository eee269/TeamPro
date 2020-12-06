<%@page import="vo.DetailOrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<DetailOrderBean> detailOrder = (ArrayList<DetailOrderBean>)request.getAttribute("detailOrder");
%>
<jsp:include page="../inc/header.jsp" />

<!-- Cart -->
<jsp:include page="../sub_cart.jsp" />
<!-- QuickMenu -->
<jsp:include page="../quickMenu.jsp" />
<!-- breadcrumb -->
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04"> Home
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> Shoping Cart </span>
	</div>
</div>

<link type="text/css" rel="stylesheet" href="scss/common.css" />
<link type="text/css" rel="stylesheet" href="scss/order_pay.css" />
<link type="text/css" rel="stylesheet" href="scss/header.1.css" />
<link type="text/css" rel="stylesheet" href="scss/menu.1.css" />

<!-- 오더페이지 시작-->

<div id="contentWrapper">
	<div id="contentWrap">

		<link type="text/css" rel="stylesheet"
			href="/template_common/shop/basic_simple/menu.1.css?t=201711221039">
		<div id="content">
			<div id="order">
					
				<div class="table-d2-list">
						<table summary="번호, 주문일자, 상품명, 결제금액, 주문상세, 배송현황">
							<caption>주문내역</caption>
							<colgroup>
								<col width="70">
								<col width="100">
								<col width="*">
								<col width="100">
								<col width="90">
								<col width="90">
							</colgroup>
							<thead>
								<tr>
									<th scope="row"><div class="tb-center">순번</div></th>
										<th scope="row"><div class="tb-center">주문자명</div></th>
									<th scope="row"><div class="tb-center">상품이미지</div></th>
									<th scope="row"><div class="tb-center">가격</div></th>
									<th scope="row"><div class="tb-center">주문수량</div></th>
									<th scope="row"><div class="tb-center">주문날짜</div></th>
										<th scope="row"><div class="tb-center">주문색상</div></th>
									<th scope="row"><div class="tb-center">주문사이즈</div></th>
									<th scope="row"><div class="tb-center">주문번호</div></th>
									<th scope="row"><div class="tb-center">제품코드</div></th>
								</tr>
							</thead>
							<tbody>
<!-- 								<tr> -->
<!-- 									<td colspan="6"><div class="tb-center">주문내역이 없습니다.</div></td> -->
<!-- 								</tr> -->
<%
for(int i = 0 ; i < detailOrder.size(); i++){
		%>
					<tr>
									<td scope="row"><div class="tb-center"><%=detailOrder.get(i).getNum()%></div></td>
									<td scope="row"><div class="tb-center"><%=detailOrder.get(i).getName()%></div></td>
									<td scope="row"><div class="tb-center"><%=detailOrder.get(i).getMain_img()%></div></td>
									<td scope="row"><div class="tb-center"><%=detailOrder.get(i).getPrice()%></div></td>
									<td scope="row"><div class="tb-center"><%=detailOrder.get(i).getCnt()%></div></td>
									<td scope="row"><div class="tb-center"><%=detailOrder.get(i).getDate()%></div></td>
									<td scope="row"><div class="tb-center"><%=detailOrder.get(i).getColor()%></div></td>
									<td scope="row"><div class="tb-center"><%=detailOrder.get(i).getSize()%></div></td>
									<td scope="row"><div class="tb-center"><%=detailOrder.get(i).getMainorder_code()%></div></td>
									<td scope="row"><div class="tb-center"><%=detailOrder.get(i).getOpt_productCode()%></div></td>
									
								</tr>
										<%
	}
%>
			
							</tbody>
						</table>
					</div>
				
				
				
<!-- 							<div id="paybutton"> -->
<!-- 								<input type="submit" value="주문하기" -->
<!-- 									style="font-size: 1em; text-align: center; padding: 1.23em 3em;" -->
<!-- 									class="CSSbuttonWhite"> &nbsp -->
<!-- 																<button class="CSSbuttonWhite" onclick="payment()">주문하기</button> -->
<!-- 								&nbsp <input type="reset" value="주문취소" -->
<!-- 									style="font-size: 1em; text-align: center; padding: 1.23em 3em;" -->
<!-- 									class="CSSbuttonWhite"> -->

<!-- 							</div> -->
				<!-- .page-body -->
			</div>
			<!-- #order -->
		</div>
		<!-- #content -->
	</div>
	<!-- #contentWrap -->
</div>

<!-- 오더페이지 끝 -->


<jsp:include page="../inc/footer.jsp" />