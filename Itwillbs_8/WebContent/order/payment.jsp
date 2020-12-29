<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
// -----------주문자 정보-----------------------------------
String name = request.getParameter("sender");
String phone =request.getParameter("emergency11") + "-" + request.getParameter("emergency12") + "-"
		+ request.getParameter("emergency13");
// -----------주문자 정보 끝---------------------------------
String buyer_name = request.getParameter("receiver");
String buyer_email = request.getParameter("email");
String pay_method = request.getParameter("pay_method");
String buyer_tel = request.getParameter("emergency21") + "-" + request.getParameter("emergency22") + "-"
		+ request.getParameter("emergency23");
String buyer_addr = request.getParameter("address");
String detailAddr = request.getParameter("detailAddress");
String buyer_postcode = request.getParameter("postcode");
String imp_uid = request.getParameter("imp_uid");
String merchant_uid = request.getParameter("merchant_uid");
String status = request.getParameter("status");
String[] nums = request.getParameterValues("num");
int amount = Integer.parseInt(request.getParameter("amount"));
%>
<jsp:include page="../inc/header.jsp" />
<link type="text/css" rel="stylesheet" href="css/common.css" />
<link type="text/css" rel="stylesheet" href="css/order_pay.css" />
<link type="text/css" rel="stylesheet" href="css/header.css" />
<link type="text/css" rel="stylesheet" href="css/menu_1.css" />
<style>
.fail {
	margin-left: 33%;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
//아임포트 API 연결을 위한 스크립트 시작
$(function(){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp80599868'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	IMP.request_pay({
	    pg : 'uplus', // version 1.1.0부터 지원.
	    pay_method : '<%=pay_method%>',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : <%=amount%>,
	    buyer_email : '<%=buyer_email%>',
	    buyer_name : '<%=buyer_name%>',
	    buyer_tel : '<%=buyer_tel%>',
	    buyer_addr : '<%=buyer_addr+" "+detailAddr%>',
	    buyer_postcode : '<%=buyer_postcode%>',
	}, function(rsp) {
	    if ( rsp.success ) {
	    	jQuery.ajax({
	    		url: "paymentResult.jsp",
	    		type : 'POST',
	    		dataType : 'json',
	    		data : {
	    			imp_uid : rsp.imp_uid,
	    			amount : rsp.paid_amount,
	    			status : rsp.status
	    		}
	    	}).done(function(data){
	    		if(everythings_fine) {
	    			 var msg = '결제가 완료되었습니다.';
	    		        msg += '고유ID : ' + rsp.imp_uid;
	    		        msg += '상점 거래ID : ' + rsp.merchant_uid;
	    		        msg += '결제 금액 : ' + rsp.paid_amount;
	    		        msg += '카드 승인번호 : ' + rsp.apply_num;
	    		        alert(msg);
	    		} else {
	    			var msg = '아직 제대로 결제가 되지 않았습니다.';
	    			msg +=  '결제된 금액이 요청한 금액과 달라 결제를 자동취소 처리하였습니다.'
	    		}
	    	});
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);
	    }
	    $("#imp_uid").attr('value',rsp.imp_uid);
	    $("#pay_method").attr('value','<%=pay_method%>');
	    $("#buyer_name").attr('value','<%=buyer_name%>');
	    $("#buyer_tel").attr('value','<%=buyer_tel%>');
	    $("#buyer_email").attr('value','<%=buyer_email%>');
	    $("#buyer_postcode").attr('value','<%=buyer_postcode%>');
	    $("#buyer_addr").attr('value','<%=buyer_addr+" "+detailAddr%>');
			$("#paid_amount").attr('value', rsp.paid_amount);
			$("#status").attr('value', rsp.status);
			$("#name").attr('value', '<%=name%>');
			$("#phone").attr('value', '<%=phone%>');
			$(".imp_uid").text($("#imp_uid").val());
			$(".buyer_name").text($("#buyer_name").val());
			$(".buyer_tel").text($("#buyer_tel").val());
			$(".buyer_addr").text($("#buyer_addr").val());
			$(".pay_method").text($("#pay_method").val());
			$(".paid_amount").text($("#paid_amount").val());

			if ($('#status').val() == "paid") {
				$('.fail').attr("src",'order/payment_success.jpg')
				document.paymentForm.submit();
			} else {
				$('.page-body').show();
				$('.paybutton').show();
				$('.fail').attr("src",'order/payment_fail.jpg')
				$('.fail').show();
			}
		});
	});

	// 아임포트 API 연결을 위한 스크립트 끝

	// 버튼 클릭 시 이동하는 경로 지정하는 함수
	function move(test) {
		// 		var location = 
		var move = document.getElementById(test.getAttribute('id'))
				.getAttribute('id');
		// 		alert(move);
		if (move == "goList") {
			location.href = "MyOrderList.or";
		} else if (move == "goCart") {
			location.href = "Cart.ca";
		} else {
			location.href = "Main.go";
		}
	}
	// 버튼 클릭 시 이동하는 경로 지정하는 함수 끝
</script>
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
						<fieldset>
							<legend>주문 결과</legend>
							<div class="tbl-order">
								<img alt="" src="" class="fail" onerror="this.style.display='none'">
							</div>
							<form action="OrderPro.or" method="post" name="paymentForm">
								<input type="hidden" value="" id="imp_uid" name="imp_uid">
								<input type="hidden" value="" id="paid_amount"
									name="paid_amount"> <input type="hidden" value=""
									id="pay_method" name="pay_method"> <input type="hidden"
									value="" id="buyer_name" name="buyer_name"> <input
									type="hidden" value="" id="buyer_tel" name="buyer_tel">
								<input type="hidden" value="" id="buyer_email"
									name="buyer_email"> <input type="hidden" value=""
									id="buyer_postcode" name="buyer_postcode"> <input
									type="hidden" value="" id="buyer_addr" name="buyer_addr">
								<input type="hidden" value="" id="status" name="status">
								<input type="hidden" value="" id="name" name="name">
								<input type="hidden" value="" id="phone" name="phone">
								<%
								for(int i = 0 ; i < nums.length ; i ++){
								%>
								<input type="hidden" value="<%=nums[i]%>" name="num" id="num">
								<%}	%>
								<div id="paybutton">
									<a class="CSSbuttonWhite" onclick="move(this)" id="goList">내
										주문 목록 보기</a> &nbsp; &nbsp; <a class="CSSbuttonWhite"
										onclick="move(this)" id="goCart">장바구니로 이동</a> &nbsp; &nbsp; <a
										class="CSSbuttonWhite" onclick="move(this)" id="goMain">메인으로
										이동</a>
								</div>
							</form>
					</div>
					</fieldset>
				</div>
				<!-- .page-body -->
			</div>
			<!-- #order -->
		</div>
		<!-- #content -->
	</div>
	<jsp:include page="../inc/footer.jsp" />