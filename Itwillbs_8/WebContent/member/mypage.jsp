<%@page import="vo.CommBean"%>
<%@page import="vo.DetailOrderBean"%>
<%@page import="java.util.HashMap"%>
<%@page import="vo.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/inc/header.jsp" />

<%
	MemberBean member = new MemberBean(); 

	ArrayList<OrderBean> mainorderList = new ArrayList<OrderBean>();
	HashMap<String, ArrayList<DetailOrderBean>> detailorderList = new HashMap<String, ArrayList<DetailOrderBean>>();
	ArrayList<DetailOrderBean> detailorderSubList = new ArrayList<DetailOrderBean>();
	ArrayList<CommBean> articleList = new ArrayList<CommBean>();
	
	member = (MemberBean) request.getAttribute("member");
	
	mainorderList = (ArrayList) request.getAttribute("mainorderList");
	detailorderList = (HashMap) request.getAttribute("detailorderList");
	
	articleList = (ArrayList) request.getAttribute("articleList");	
	
%>


<!-- breadcrumb -->
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="Main.go" class="stext-109 cl8 hov-cl1 trans-04"> Home
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> My Page </span>
	</div>
</div>

<link type="text/css" rel="stylesheet" href="scss/common.css" />
<link type="text/css" rel="stylesheet" href="scss/mp_main.css" />
<link type="text/css" rel="stylesheet" href="scss/header.1.css" />
<link type="text/css" rel="stylesheet" href="scss/menu.2.css" />
<!-- Shoping Cart -->


<div id="contentWrapper">
	<div id="contentWrap">

		<div id="aside">
			<h2 class="aside-tit">MY PAGE</h2>
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
			<div id="mypage">
				<div class="page-body">
					<!-- 회원 정보 -->
					<div class="info">
						<div class="user">
							<div class="user-img">
								<img alt="profileImg" src="member/memberUpload/<%=member.getImg()%>" onerror="this.style.display='none'">
							</div>
							<div class="user-info">
								<p>
									<b><%=member.getUsername() %></b> [<span id="MK_user_id"><%=member.getId() %></span>]님
									  &nbsp;&nbsp;&nbsp; <a href="회원정보수정" class="CSSbuttonWhite CSSbuttonMin">EDIT</a>
								</p>
								<div class="box">
									<dl>
										<dt>가입 일자</dt>
										<dd><%=member.getDate() %></dd>
									</dl>
									<dl>
										<dt>전 &nbsp;&nbsp;&nbsp; 화</dt>
										<dd><%=member.getPhone() %></dd>
									</dl>
									<dl>
										<dt>이 메 일</dt>
										<dd>
											<span id="MK_user_email"><%=member.getEmail() %></span>
										</dd>
									</dl>
<!-- 									<dl> -->
<!-- 										<dt>주 &nbsp;&nbsp;&nbsp; 소</dt> -->
<!-- 										<dd>주소...어케해야대지.......1. 최근주소지 2. 목록이동 -> 주소지 목록 나열</dd> -->
<!-- 									</dl> -->
								</div>
							</div>
						</div>
						<dl class="order">
							<dt>총 주문금액</dt>
							<dd style="width: 300px">
							<%
							int totalpr = 0;
							for(OrderBean o: mainorderList) {
								totalpr += o.getTotal_price();
							}
							%>
								<span><%=totalpr %> </span>원
							</dd>
							<dt>주문 건수</dt>
							<dd style="width: 300px"><span><%=mainorderList.size() %> </span>건</dd>
							<dt>게시글 수</dt>
							<dd style="width: 300px"><span><%=articleList.size() %> </span>개</dd>
<!-- 							<dt>적 립 금</dt> -->
<!-- 							<dd> -->
<!-- 								<a href="/shop/mypage.html?mypage_type=myreserve"><strong>5,000</strong>원</a> -->
<!-- 							</dd> -->
<!-- 							<dt>쿠 &nbsp;&nbsp;&nbsp; 폰</dt> -->
<!-- 							<dd> -->
<!-- 								<a href="/shop/mypage.html?mypage_type=mycoupon"><strong>0</strong>개</a> -->
<!-- 							</dd> -->
						</dl>
					</div>
					<!-- //회원 정보 -->

					<!-- 회원 그룹 정보 -->
<!-- 					<div class="grp"> -->
<!-- 						<p> -->
<!-- 							이름님은 [BRONZE]회원입니다.<br> -->
<!-- 						</p> -->
<!-- 					</div> -->
					<!-- //회원 그룹 정보 -->


					<!-- 최근 주문 정보 -->
					<div class="hd">
						<h3>최근 주문 정보</h3>
						<a class="view fe" href="MyOrderList.or">+ MORE</a>
					</div>
					<div class="tbl">
						<table summary="주문일자, 상품명, 결제금액, 주문상세">
							<caption>최근 주문 정보 목록</caption>
							<colgroup>
								<col width="150">
								<col width="*">
								<col width="140">
								<col width="140">
							</colgroup>
							<thead>
								<tr>
									<th><div class="tb-center">번호</div></th>
									<th><div class="tb-center">PRODUCT</div></th>
									<th><div class="tb-center">COST</div></th>
									<th><div class="tb-center">DETAIL</div></th>
								</tr>
							</thead>
							
							<tbody>
								<tr>
								<%
								if(mainorderList.size() == 0) {
									%>
									<td colspan="4" style="padding:50px 20px; text-align:center; font-size: 15px;">
            	   						<span> 최근 구매한 상품이 없습니다 </span></td>
									<%
								} else {
									detailorderSubList = detailorderList.get(mainorderList.get(mainorderList.size()-1).getCode());
									OrderBean orderBean = mainorderList.get(mainorderList.size()-1);
								%>
									<td><div class="tb-center"><%=orderBean.getDate() %></div></td>
									<td><div class="tb-center">
									<%
									for(int i=0; i<detailorderSubList.size(); i++) {
										DetailOrderBean detailOrderBean = detailorderSubList.get(i);
									
									%>
										<a href="MyOrderList.or"
											class="tb-bold"> <%=detailOrderBean.getName()%>
											<br>색상 : <%=detailOrderBean.getColor() %> <%=detailOrderBean.getCnt() %>개
										</a><br>
									<% } %>
									</div> </td>
									<td><div class="tb-center"><%=orderBean.getTotal_price() %></div></td>
									<td><div class="tb-center">
									<a class="view fe" href="MyOrderList.or">+ MORE</a></div></td>
								<% } %>
								</tr>
							</tbody>
<!-- 							<tbody> -->
<!-- 								<tr> -->
<!-- 									<td colspan="4"><div class="tb-center">주문 내역이 없습니다.</div></td> -->
<!-- 								</tr> -->
<!-- 							</tbody> -->
						</table>
					</div>
					<!-- //최근 주문 정보 -->

					<!-- 최근 등록 게시글 -->
					<div class="hd">
						<h3>최근 등록 게시글</h3>
						<a class="view fe" href="MycommList.co">+ MORE</a>
					</div>
					<div class="tbl">
						<table summary="등록일자, 제목, 게시판">
							<caption>최근 등록 게시물 목록</caption>
							<colgroup>
								<col width="150">
								<col width="*">
								<col width="200">
							</colgroup>
							<thead>
								<tr>
									<th><div class="tb-center">DATE</div></th>
									<th><div class="tb-center">SUBJECT</div></th>
									<th><div class="tb-center">READCOUNT</div></th>
								</tr>
							</thead>
							<tbody>
							<%
							if(articleList.size() == 0) {
								%>
									<tr><td colspan="3" style="padding:50px 20px; text-align:center; font-size: 15px;">
            	   						<span> 작성한 게시글이 없습니다 <br><br>
            	   							<a href='CommList.co'>게시글을 작성해 보세요!</a></span></td></tr>							
								<%
							} else {
								CommBean article = articleList.get(articleList.size()-1);
								%>
								<tr onclick="location.href='CommDetail.co?num=<%=article.getNum()%>'" style="cursor: pointer;">
								<td><div class="tb-center"><%=article.getDate() %></div></td>
								<td><div class="tb-center"><%=article.getSubject() %></div></td>
								<td><div class="tb-center"><%=article.getReadCount() %></div></td>
								</tr>
								<%
									
							}
							%>
							</tbody>
						</table>
					</div>
					<!-- //최근 등록 게시글 -->

					<!-- 관심 상품 정보 -->
					<div class="hd">
						<h3>관심 상품 정보</h3>
						<a class="view fe" href="ProductLikeList.po">+ MORE</a>
					</div>
					<div class="lst">
						<div class="item-wrap">
							<div class="item-cont"></div>
							
<!-- 							게시글 말고 관심상품으로 변경하기 -->
							
							<table summary="등록일자, 제목, 게시판">
							<caption>최근 등록 게시물 목록</caption>
							<colgroup>
								<col width="150">
								<col width="*">
								<col width="200">
							</colgroup>
							<thead>
								<tr>
									<th><div class="tb-center">DATE</div></th>
									<th><div class="tb-center">SUBJECT</div></th>
									<th><div class="tb-center">READCOUNT</div></th>
								</tr>
							</thead>
							<tbody>
							<%
							if(articleList.size() == 0) {
								%>
									<tr><td colspan="3" style="padding:50px 20px; text-align:center; font-size: 15px;">
            	   						<span> 작성한 게시글이 없습니다 <br><br>
            	   							<a href='CommList.co'>게시글을 작성해 보세요!</a></span></td></tr>							
								<%
							} else {
								CommBean article = articleList.get(articleList.size()-1);
								%>
								<tr onclick="location.href='CommDetail.co?num=<%=article.getNum()%>'" style="cursor: pointer;">
								<td><div class="tb-center"><%=article.getDate() %></div></td>
								<td><div class="tb-center"><%=article.getSubject() %></div></td>
								<td><div class="tb-center"><%=article.getReadCount() %></div></td>
								</tr>
								<%
									
							}
							%>
							</tbody>
							</table>
						</div>
					</div>
					<!-- //관심 상품 정보 -->

				</div>
				<!-- .page-body -->
			</div>
			<!-- #mypage -->
		</div>
		<!-- #content -->
	</div>
	<!-- #contentWrap -->
</div>






<!-- Shoping Cart 끝 -->







<jsp:include page="/inc/footer.jsp" />