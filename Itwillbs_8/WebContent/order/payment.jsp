<%@page import="org.omg.CORBA.IMP_LIMIT"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
String buyer_name = request.getParameter("receiver");
String buyer_email = request.getParameter("email");
String pay_method = request.getParameter("pay_method");
String buyer_tel = request.getParameter("emergency11") + "-" + request.getParameter("emergency12") + "-"
		+ request.getParameter("emergency13");
String buyer_addr = request.getParameter("address");
String buyer_postcode = request.getParameter("postcode");
String imp_uid = request.getParameter("imp_uid");
String merchant_uid = request.getParameter("merchant_uid");
String status = request.getParameter("status");
%>
<jsp:include page="../inc/header.jsp" />
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
	    amount : 10000,
	    buyer_email : '<%=buyer_email%>',
	    buyer_name : '<%=buyer_name%>',
	    buyer_tel : '<%=buyer_tel%>',
	    buyer_addr : '<%=buyer_addr%>',
	    buyer_postcode : '<%=buyer_postcode%>',
	}, function(rsp) {
	    if ( rsp.success ) {
	    	jQuery.ajax({
	    		url: "paymentResult.jsp",
	    		type : 'POST',
	    		dataType : 'json',
	    		data : {
	    			imp_uid : rsp.imp_uid
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
	    $("#buyer_addr").attr('value','<%=buyer_addr%>');
	    $("#status").attr('value','<%=status%>');
		});
	});
	
	// 아임포트 API 연결을 위한 스크립트 끝
</script>
<body>
	<form action="OrderPro.or" method="post">
		<input type="hidden" value="" id="imp_uid" name="imp_uid"> <input
			type="hidden" value="" id="paid_amount" name="paid_amount"> <input
			type="hidden" value="" id="pay_method" name="pay_method"> <input
			type="hidden" value="" id="buyer_name" name="buyer_name"> <input
			type="hidden" value="" id="buyer_tel" name="buyer_tel"> <input
			type="hidden" value="" id="buyer_email" name="buyer_email"> <input
			type="hidden" value="" id="buyer_postcode" name="buyer_postcode">
		<input type="hidden" value="" id="buyer_addr" name="buyer_addr">
			 <input	type="hidden" value="" id="status" name="status">
		<input type="submit" value="내 주문 목록">
	</form>
<jsp:include page="../inc/footer.jsp" />