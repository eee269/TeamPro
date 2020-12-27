<%@page import="vo.AddrBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<AddrBean> addrBook = (ArrayList<AddrBean>) request.getAttribute("addrBook");
String member_id = (String) session.getAttribute("member_id");
%>
<jsp:include page="/inc/header.jsp" />
<!-- QuickMenu -->
<jsp:include page="/quickMenu.jsp" />

<style>
.CSSbuttonBlack {
	-webkit-font-smoothing: antialiased;
	vertical-align: middle;
	text-decoration: none;
	font-family: 'Roboto', 'Nanum Gothic', Dotum, AppleGothic, Helvetica,
		sans-serif;
	display: inline-block;
	border: 1px solid #231f20;
	transition: all 0.3s ease;
	color: #fff;
	background: #000;
	width: 160px;
	line-height: 48px;
	text-align: center;
	font-size: 14px;
}

.CSSbuttonBlack:hover {
	transition: all 0.3s ease;
	color: #000;
	background: #fff;
}

.CSSbuttonWhite {
	-webkit-font-smoothing: antialiased;
	vertical-align: middle;
	text-decoration: none;
	font-family: 'Roboto', 'Nanum Gothic', Dotum, AppleGothic, Helvetica,
		sans-serif;
	display: inline-block;
	color: #231f20;
	border: 1px solid #231f20;
	background: #fff;
	transition: all 0.3s ease;
	width: 160px;
	line-height: 48px;
	text-align: center;
	font-size: 14px;
}

.CSSbuttonWhite:hover {
	transition: all 0.3s ease;
	color: #fff;
	background: #000;
}

.btn-area {
	font-size: 12px;
	color: rgb(28, 28, 28);
	line-height: 1;
	font-family: 'Roboto', 'Nanum Gothic', Dotum, AppleGothic, Helvetica,
		sans-serif;
	-webkit-font-smoothing: antialiased;
	margin: 0;
	padding: 0;
	text-align: left;
	padding-left: 35%;
	margin-top: 30px;
}
</style>

<link type="text/css" rel="stylesheet" href="css/common.css" />
<link type="text/css" rel="stylesheet" href="css/mp_order.css" />
<link type="text/css" rel="stylesheet" href="css/header.css" />
<link type="text/css" rel="stylesheet" href="css/menu_2.css" />


<div id="contentWrapper">
	<div id="contentWrap">
	
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
			<div id="mypage">
					<!-- 주소록 관리 -->
					<div class="tit-page-2">
						<h2>주소록 관리</h2>
						<p class="dsc">
						<span class="fc-blue"><%=member_id %> </span>님의 등록된 배송지입니다.
					</p>
					</div>
				<div class="page-body">
					<div class="table-d2-list">
						<table class="addrbook-list" border="1">
							<colgroup>
								<col width="10%">
								<col width="22%">
								<col width="23%">
								<col width="30%">
								<col width="10%">
							</colgroup>
							<thead>
								<th><div class="tb-center">&nbsp;</div></th>
								<th><div class="tb-center">배송지명</div></th>
								<th><div class="tb-center">우편번호</div></th>
								<th><div class="tb-center">주소</div></th>
								<th><div class="tb-center">관리</div></th>
							</thead>
							<tbody>
							<%
if(addrBook.size() == 0) {
	%>
	<tr><td colspan="9" style="padding:50px 20px; text-align:center; font-size: 15px;">
		<span>아직 등록된 배송지가 없습니다.</span>
		
	</td></tr>
	<%
} else {
	for (int i = 0; i < addrBook.size(); i++) {
		%>
								<tr class="ui-sortable">
									<td>
										<div class="tb-center">
											<input type="checkbox" name="checkbox" class="checkbox" />
										</div>
									</td>
									<td>
										<div class="tb-center"><%=addrBook.get(i).getLocation()%></div>
									</td>
									<td><div class="tb-center"><%=addrBook.get(i).getPostcode()%></div></td>
									<td>
										<div class="tb-center">
											<%=addrBook.get(i).getAddress()+" "+addrBook.get(i).getDetailAddress()%>
										</div>
									</td>
									<td>
										<div class="tb-center">
											<a onclick="javascript:del_addrbook();"
												class="CSSbuttonWhite"
												style="width: 46px; height: 40px; text-align: center;">삭제</a>
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
					<div class="btn-area">
						<a href="javascript:pop_addplace();" class="CSSbuttonWhite">주소록
							추가</a> <a href="javascript:del_addrbook();"
							class="CSSbuttonWhite">선택 삭제</a>
					</div>

					<!-- 					<div class="paging-wrap"> -->
					<!-- 						<div class="paging"></div> -->
					<!-- 					</div> -->
					<!-- 					<div class="btn-area"> -->
					<!-- 						<div></div> -->
					<!-- 					</div> -->

				</div>
			</div>
		</div>
	</div>
</div>
</div>
<script src="js/jquery-3.5.1.js"></script>
<script>
// 배송지 추가를 위한 함수 
	function pop_addplace() {
		var url = "member/addr_plus.jsp";
		var option = "left=720, top=210, width=480, height=742, resizable=no, scrollbars=yes, status=no;"; //팝업창 옵션(optoin)
		window.open(url, "place", option);
	}
// 배송지 추가를 위한 함수 끝

// 배송지 삭제를 위한 함수 
	function del_addrbook() {
		var checkbox = $("input[name=checkbox]:checked")
		if (checkbox.prop("checked")) {
			checkbox.each(function(i) {
				var tr = $(this).parent().parent().parent().eq(i);
				var td = tr.children();
				
				var postcode = td.eq(2).text().trim();
				jQuery.ajaxSettings.traditional = true;
				alert(postcode);
				$.ajax({
					url:"RemoveDestination.ad",
					type:'POST',
					data:{
						postcode:postcode
					},
					success:function(data){
						alert("successsssssssssss!!");
					},
					error:function(error){
						alert(error);
					}
				});
						history.go(0);
			});
		}
	}
// 배송지 삭제를 위한 함수 끝

</script>

<jsp:include page="/inc/footer.jsp" />