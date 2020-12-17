<%@page import="vo.AddrBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../inc/header.jsp" />
<%
	ArrayList<AddrBean> addrBook = (ArrayList<AddrBean>) request.getAttribute("addrBook");
String member_id = (String) session.getAttribute("member_id");
%>
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
	padding-left: 13%;
	margin-top: 30px;
}
</style>

<link type="text/css" rel="stylesheet" href="../scss/common.css" />
<link type="text/css" rel="stylesheet" href="scss/mp_main.css" />
<link type="text/css" rel="stylesheet" href="scss/header.1.css" />
<link type="text/css" rel="stylesheet" href="scss/menu.2.css" />


<div id="contentWrapper">
	<div id="contentWrap">
		<div id="content">
			<div id="mypage">
				<div class="page-body">
					<!-- 주소록 관리 -->
					<div class="hd">
						<h3>주소록 관리</h3>
					</div>
					<div class="tbl">
						<table class="addrbook-list" border="1">
							<colgroup>
								<col width="80">
								<col width="170">
								<col width="170">
								<col width="250">
								<col width="110">
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
									<td><div class="tb-left"><%=addrBook.get(i).getPostcode()%></div></td>
									<td>
										<div class="tb-center">
											<%=addrBook.get(i).getAddress()%>
										</div>
									</td>
									<td>
										<div class="tb-center">
											<a href="javascript:del_addrbook('1');"
												class="CSSbuttonWhite"
												style="width: 46px; height: 40px; text-align: center;">삭제</a>
										</div>
									</td>
									<%
										}
									%>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn-area">
						<a href="javascript:getAddr();" class="CSSbuttonBlack">배송지 선택</a>
						<a href="javascript:pop_addplace();" class="CSSbuttonWhite">주소록
							추가</a> <a href="javascript:multi_del_addrbook();"
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
<script>
// 배송지 추가를 위한 함수 
	function pop_addplace() {
		var url = "addr_plus.html?";
		var option = "left=720, top=210, width=480, height=742, resizable=no, scrollbars=yes, status=no;"; //팝업창 옵션(optoin)
		window.open(url, "place", option);
	}
// 배송지 추가를 위한 함수 끝

// 선택한 배송지를 오더 페이지로 가져가기 위한 함수
	function getAddr() {
		var checkbox = $("input[name=checkbox]:checked")
		if (checkbox.prop("checked")) {
			alert("Hello");
			checkbox.each(function(i) {
				var tr = $(this).parent().parent().parent().eq(i);
				var td = tr.children();
				
				var postcode = td.eq(2).text().trim();
				var address = td.eq(3).text().trim();
				alert(postcode);
				alert(address);
				$(opener.document).find("#postcode").val(postcode);
				$(opener.document).find("#address").val(address);
				
				window.close();
			});
		} else {
			alert("배송지를 선택하세요.");
		}
	}
// 선택한 배송지를 오더 페이지로 가져가기 위한 함수 끝
</script>
<jsp:include page="../inc/footer.jsp" />