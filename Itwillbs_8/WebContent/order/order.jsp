<%@page import="vo.AddrBean"%>
<%@page import="vo.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.JdbcUtil"%>
<%@page import="dao.member.MemberDAO"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%
// 	  String[] orderData = request.getParameterValues("orderData");
	   ArrayList<Cart> cartList = (ArrayList<Cart>)request.getAttribute("cartList");
// 		int sevice = 2500;
	   int coin = 0;
	   int cartNo = cartList.size();
		int num = Integer.parseInt(request.getParameter("chk"));
		int price = Integer.parseInt(request.getParameter("price"));
		int delivery = Integer.parseInt(request.getParameter("delivery"));
		int total_price = Integer.parseInt(request.getParameter("total_price"));
	%>
<script src="js/jquery-3.5.1.js"></script>
<script type="text/javascript">
// 주문자 기본 정보를 가져오는 스크립트
$(document).ready(function(){
	$.getJSON('CopyData.or', function(rdata){
		$.each(rdata, function(index,item){
			$('#sender').attr('value',item.name),
			$('#email').attr('value',item.email),
			$('#emergency11').attr('value',item.phone_0),
			$('#emergency12').attr('value',item.phone_1),
			$('#emergency13').attr('value',item.phone_2)
			if($('#emergency11').val()==""|$('#emergency12').val()==""|$('#emergency13').val()==""){
				alert("회원정보에 연락처가 비어있습니다.");
				location.href="MemberMypage.mo";
			}
		});
	});
});
//주문자 기본 정보를 가져오는 스크립트 끝
</script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
// 배송 정보가 회원 정보와 같을 경우 카피하는 스크립트
function copy_data() {
	$(document).ready(function(){
		if($('#same').is(":checked")){
			$.getJSON('CopyData.or',function(rdata){
				$.each(rdata, function(index,item){
					$('#receiver').attr('value',item.name),
					$('#emergency21').attr('value',item.phone_0),
					$('#emergency22').attr('value',item.phone_1),
					$('#emergency23').attr('value',item.phone_2)
				});
			});
		}else {
			$('#receiver').attr('value',""),
			$('#emergency21').attr('value',""),
			$('#emergency22').attr('value',""),
			$('#emergency23').attr('value',"")
		}
	});
}



//배송 정보가 회원 정보와 같을 경우 카피하는 스크립트 끝

// 주소 찾기 위한 다음 우편번호검색 API 스크립트
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
//주소 찾기 위한 다음 우편번호검색 API 스크립트 끝

// 주소록 팝업을 위한 스크립트
function openAddrList(){
	
window.open("AddrBook.ad", "startpop", "top=0, left=0, width=820, height=500, scrollbars=no, resizable=no ,status=no ,toolbar=no");
// 	window.open("AddrBook.ad");

}
// 주소록 팝업 스크립트 끝

function Addr(test) {
	$(document).ready(function(){
		
		var addrType = document.getElementById(test.getAttribute('id')).getAttribute('id');
		
		if(addrType=="defaultAddr"){
			$.getJSON('DefaultAddr.ad?addrType='+addrType,function(rdata){
				$.each(rdata, function(index,item){
					$('#postcode').attr('value',item.postcode),
					$('#address').attr('value',item.address)
				});
			});
		}else if(addrType == 'recentAddr'){
			$.getJSON('RecentAddr.ad?addrType='+addrType,function(rdata){
				$.each(rdata, function(index,item){
					$('#postcode').attr('value',item.postcode),
					$('#address').attr('value',item.address)
				});
			});
		}else {
			$('#postcode').attr('value',""),
			$('#address').attr('value',"")
		
		}
			
	});
}
function regist_defaultAddr(test) {
	$(document).ready(function(){
		var regist = $(test).val();
// 		alert(regist);
		if(regist=="Y"){
			$.ajax({
				url:'RegistDefaultAddr.ad',
				type:'POST',
				data:{
					postcode:$('#postcode').val(),
					address:$('#address').val()
				},
				success:function(data){
					alert("해당 배송지를 기본 배송지로 설정했습니다.");
				}
			});
		}
	});
}

</script>
<jsp:include page="../inc/header.jsp" />

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

<link type="text/css" rel="stylesheet" href="css/common.css" />
<link type="text/css" rel="stylesheet" href="css/order_pay.css" />
<link type="text/css" rel="stylesheet" href="css/header.css" />
<link type="text/css" rel="stylesheet" href="css/menu_1.css" />

<!-- 오더페이지 시작-->

<div id="contentWrapper">
	<div id="contentWrap">
		<link type="text/css" rel="stylesheet"
			href="/template_common/shop/basic_simple/menu.1.css?t=201711221039">
		<div id="content">
			<div id="order">
				<dl class="loc-navi">
					<dt class="blind">현재 위치</dt>
					<dd>
						<a href="/">Home</a> &gt; <strong>주문서</strong>
					</dd>
				</dl>
				<div class="page-body">

					<form name="form1" id="order_form" action="Payment.or"
						method="post">

						<fieldset>
							<legend>주문 폼</legend>
							<h3>주문리스트</h3>
							<div class="table-cart table-fill-prd">
					<table style="clear:both;">
						<caption>주문 예정 상품</caption>

						<colgroup>
							<col width="11%">
							<col width="11%">
							<col width="25%">
							<col width="12%">
							<col width="12%">
							<col width="12%">
							<col width="12%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><div class="tb-center">번호</div></th>
								<th scope="col"><div class="tb-center">사진</div></th>
								<th scope="col"><div class="tb-center">상품명</div></th>
								<th scope="col"><div class="tb-center">색상</div></th>
								<th scope="col"><div class="tb-center">사이즈</div></th>
								<th scope="col"><div class="tb-center">수량</div></th>
								<th scope="col"><div class="tb-center">개별금액</div></th>
								
							</tr>
						</thead>
							<tbody>
							<%
	for(int i = 0 ; i < cartList.size() ; i++){
		%>
								<input type="hidden" name="num" id="num" value="<%=cartList.get(i).getNum()%>"> 
								<input type="hidden" name="amount" id="num" value="<%=total_price%>">
		<%
// 		out.println("Order페이지에서"+cartList.get(i).getNum());
// 		out.println("Order페이지에서"+cartList.get(i).getCnt());
// 		out.println("Order페이지에서"+cartList.get(i).getProduct_name());
// 		out.println("Order페이지에서"+cartList.get(i).getPrice());
// 		out.println("Order페이지에서"+cartList.get(i).getColor());
// 		out.println("Order페이지에서"+cartList.get(i).getSize());
// 		out.println("Order페이지에서"+cartList.get(i).getMember_id());
// 		out.println("Order페이지에서"+cartList.get(i).getProduct_basicCode());
// 		out.println("Order페이지에서"+cartList.get(i).getOpt_productCode());
	
%>
	<tr>
	
	<td><div class = "tb-center"><%=cartNo %></div></td>
	
	<td><div class = "tb-center">
		 <div class="thumb">
		<a href=""><img
		src="<%=cartList.get(i).getMain_img()%>"
		alt="상품 섬네일" title="상품 섬네일" width="1" onerror="this.style.display='none'"></a>
		</div>
		</div></td>
		
	<td><div class="tb-center">
	<a href="" class="tb-bold"><%=cartList.get(i).getProduct_name()%></a></div></td>
	
	<td><div class="tb-center">
		<span class="tb-dl"><span class="opt_dd"><%=cartList.get(i).getColor()%></span></span>
	</div></td>	
	
	<td><div class="tb-center">
		<span class="tb-dl"><span class="opt_dd"><%=cartList.get(i).getSize()%></span></span>
	</div></td>	
	
	<td>
	<div class="tb-center">
		<span class="tb-dl"><span class="opt_dd"><%=cartList.get(i).getCnt()%></span></span>
	</div></td>
						
	<td><div class="tb-center "><span class="back"><b><%=cartList.get(i).getPrice()%></b></span>원</div></td>
	
	</tr>	
		
		
							
</tbody>
<%cartNo--;} %>			
<tfoot>
	<tr>
		<td colspan="8">
			<div class="tb-right">
			<span class="MK_none_groupsale_total_price_sell"> 
			총구매금액<span class="MK_chg_none_groupsale_total_price_sell MK_change_price"><%=price %></b></span>원
			</span><span class="MK_total_delivery">+ 배송비<span
			class="MK_chg_total_delivery MK_change_price"><%=delivery %></b></span>원
			</span> = <strong><span class="MK_total_price"><span class="MK_chg_total_price MK_change_price"></span><%=total_price %></b>원</span></strong><br>
			</div>
		</td>
	</tr>
</tfoot>							
</table>				

							<h3>주문자정보</h3>
							<div class="tbl-order">
								<table>
									<caption>주문자정보</caption>
									<colgroup>
										<col style="width: 130px">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><div class="txt-l">이름</div></th>
											<td><input type="text" name="sender" readonly
												form="order_form" id="sender" class="MS_input_txt">
											</td>
										</tr>
										<tr>
											<th scope="row"><div class="txt-l">이메일</div></th>
											<td><input type="text" name="email" form="order_form"
												readonly id="email" value="" class="MS_input_txt"
												maxlength="50"></td>
										</tr>
										<tr>
											<th scope="row"><div class="txt-l">연락처</div></th>
											<td><input type="text" name="emergency11"
												form="order_form" id="emergency11" size="4" maxlength="4"
												class="MS_input_txt w60" readonly> - <input
												type="text" name="emergency12" form="order_form"
												id="emergency12" size="4" maxlength="4"
												class="MS_input_txt w60" readonly> - <input
												type="text" name="emergency13" form="order_form"
												id="emergency13" size="4" maxlength="4" minlength="4"
												class="MS_input_txt w60" readonly></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- .tbl-order -->

							<h3>
								배송 정보 <label> <input type="checkbox" name="same"
									form="order_form" id="same" onclick="copy_data()"> 위
									정보와 같음
								</label>
							</h3>
							<div class="tbl-order">
								<table>
									<caption>배송 정보 입력</caption>
									<colgroup>
										<col style="width: 130px">
										<col>
										<col style="width: 100px">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><div class="txt-l">이름</div></th>
											<td colspan="3"><input type="text" name="receiver"
												form="order_form" id="receiver" class="MS_input_txt"
												value=""></td>
										</tr>
										<tr>
											<th scope="row"><div class="txt-l">연락처 1</div></th>
											<td><input type="text" name="emergency21"
												form="order_form" id="emergency21" size="4" maxlength="4"
												value="" class="MS_input_txt w60"> - <input
												type="text" name="emergency22" form="order_form"
												id="emergency22" size="4" maxlength="4"
												class="MS_input_txt w60" value=""> - <input
												type="text" name="emergency23" form="order_form"
												id="emergency23" size="4" maxlength="4" minlength="4"
												class="MS_input_txt w60" value=""></td>

										</tr>
										<tr>
											<th scope="row"><div class="txt-l">배송지 선택</div></th>
											<td colspan="3"><input type="radio" value="default"
												form="order_form" name="place" id="defaultAddr" onclick="Addr(this)">기본
												배송지 &nbsp;&nbsp;<input type="radio" name="place"
												form="order_form"  id="recentAddr" onclick="Addr(this)">최근 배송지
												&nbsp;&nbsp;<input type="radio" value="" name="place" 
												form="order_form" onclick="execDaumPostcode()">신규
												배송지 &nbsp;<a href="javascript:openAddrList();"
												class="past_list"
												style="display: inline-block; height: 23px; line-height: 25px; padding: 0px 5px; border: 1px solid rgb(221, 221, 221); color: rgb(0, 0, 0); font-weight: bold; letter-spacing: -1px; border-radius: 3px;">주소록</a>
											</td>
										</tr>
										<tr>
											<th scope="row"><div class="txt-l">주소</div></th>
											<td colspan="3">
												<div class="mt-10">
													<div class="post">
														<p class="post-number-input">
															<input type="text" name="postcode" id="postcode"
																placeholder="우편번호" class="MS_input_txt w80" /> <input
																type="button" onclick="execDaumPostcode()" value="주소 찾기"
																class="btn-white"> <br> <input type="text"
																name="address" id="address" placeholder="주소"
																class="MS_input_txt w240" /> <input type="text"
																name="detailAddress" id="detailAddress"
																placeholder="상세주소" class="MS_input_txt w240" /> <input
																type="text" name="extraAddress" id="extraAddress"
																placeholder="참고항목" style="display: none;" />
														</p>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- .tbl-order -->

							<label class="chk-label"> <input type="checkbox" 
								name="regist" form="order_form" id="regist"
								value="Y" onclick="regist_defaultAddr(this)"> 해당 배송지 정보를 나의 기본배송지로 등록합니다.
							</label>

							<h3>주문상품 할인적용</h3>
							<div class="tbl-pay">
								<table>
									<caption>주문상품 할인적용</caption>
									<colgroup>
										<col style="width: 30%; text-align: center;">
										<col style="width: 30%; text-align: center;">
										<col style="width: 30%; text-align: center;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">상품금액</th>
											<th scope="col">배송비</th>
											<th scope="col">결제 예정금액</th>
										</tr>
										<tr>
											<td>
												<div class="base">
													<strong><em><span
															class="op-total block-op-product-price" ><%=price %></span></em>원</strong>
												</div>
											</td>
											<td>
												<div class="base">
													<strong><em><span
															class="op-total block-op-add-price" ><%=delivery %></span></em>원</strong> <a
														class="plus"><img src="cart/img/bul_h23_plus.png"
														alt="plus"></a><a class="minus" style="display: none;"><img
														src="cart/img/bul_h23_minus.png" alt="minus"></a>
												</div>
											</td>
											<td>
												<div class="base">
													<a class="equal"><img src="cart/img/bul_h23_equal.png"
														alt="equal"></a> <strong><em class="fc-red"><span
															class="block-op-sum-price" ><%=total_price %></span></em>원</strong>
												</div>
											</td>
										</tr>
									</thead>
								</table>
							</div>
							<!-- .tbl-pay -->

							<h3>
								결제 정보
							</h3>
							<table class="escrow-info">
								<caption>에스크로</caption>
								<colgroup>
									<col style="width: 150px">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th><img src="cart/img/ico_escrow_allthegate.gif"
											align="absmiddle" border="0"></th>
										<td>고객님은 안전거래를 위해 현금으로결제하실 때 저희 쇼핑몰에 가입한 올더게이트의 구매안전서비스를
											이용할 수 있습니다.</td>
									</tr>
								</tbody>
							</table>
							<div class="tbl-order" style="margin-top: 0; border-top: 0">
								<table>
									<caption>결제 정보</caption>
									<colgroup>
										<col style="width: 110px">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><div class="txt-l">결제방법</div></th>
											<td>
												<ul class="pay-method">
													<li><input type="radio" class="chk-rdo"
														name="pay_method" value="card" checked="checked">
														신용카드 <em><span class="op-card-dc-price fc-red"></span></em>
													</li>
													<li><input type="radio" class="chk-rdo"
														name="pay_method" value="trans" >
														실시간계좌이체 <em><span class="op-card-dc-price fc-red"></span></em>
													</li>
													<li><input type="radio" class="chk-rdo"
														name="pay_method" value="phone">
														휴대폰소액결제 <em><span class="op-card-dc-price fc-red"></span></em>
													</li>
<!-- 													<li><input type="radio" class="chk-rdo" -->
<!-- 														name="pay_method" value="vbank" checked="checked"> -->
<!-- 														가상계좌 <em><span class="op-card-dc-price fc-red"></span></em> -->
<!-- 													</li> -->
<!-- 													<li><input type="radio" class="chk-rdo" -->
<!-- 														name="pay_method" value="cultureland" checked="checked"> -->
<!-- 														문화상품권 <em><span class="op-card-dc-price fc-red"></span></em> -->
<!-- 													</li> -->
<!-- 													<li><input type="radio" class="chk-rdo" -->
<!-- 														name="pay_method" value="booknlife" checked="checked"> -->
<!-- 														도서문화상품권 <em><span class="op-card-dc-price fc-red"></span></em> -->
<!-- 													</li> -->
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

							<div id="paybutton">
								<input type="submit" value="주문하기"
									style="font-size: 1em; text-align: center; padding: 1.23em 3em;"
									class="CSSbuttonWhite"> &nbsp;
								<!-- 								<button class="CSSbuttonWhite" onclick="payment()">주문하기</button> -->
								&nbsp; <input type="reset" value="주문취소"
									style="font-size: 1em; text-align: center; padding: 1.23em 3em;"
									class="CSSbuttonWhite">

							</div>
						</fieldset>
					</form>
				</div>
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