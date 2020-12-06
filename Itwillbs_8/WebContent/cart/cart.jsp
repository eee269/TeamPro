<%@page import="vo.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Cart> cartList = (ArrayList<Cart>) request.getAttribute("cartList");

int sevice = 2500;
int coin = 0;
int cartNo = cartList.size();
int num = 0;
int total = 0;
int cntSet = 0;
int sum = 0;
%>
<script src="js/bootstrap4-rating-input.js"></script>
<style type="text/css">
.rat {
	margin: 150px auto;
	font-size: 20px;
}

#emptyArea {
	margin: auto;
	width: 1024px;
	text-align: center;
}
</style>
<script type="text/javascript" src=js/bootstrap4-rating-input.js></script>
<script type="text/javascript" src=js/jquery-3.5.1.js></script>
<script type="text/javascript">
  $(document).ready(function(){
	  
	  $("#allCheck").click(function(){
		  // 전체 선택
	        if($("#allCheck").prop("checked")){
	            $("input[name=chk]").prop("checked",true);
					            	
	       // 전체 해제
	        } else {
	            $("input[name=chk]").prop("checked",false);
	        }
	    });
	  
	// ---------------------------------------------------------
	

	// ---------------------------------------------------------
	  
	  
	  
	  
	});		
  
  

		  </script>




<jsp:include page="../inc/header.jsp" />

<!-- Cart -->
<jsp:include page="../sub_cart.jsp" />


<!-- breadcrumb -->
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04"> Home
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> Shoping Cart </span>
	</div>
</div>

<link type="text/css" rel="stylesheet" href="scss/common.css" />
<link type="text/css" rel="stylesheet" href="scss/basket.css" />
<link type="text/css" rel="stylesheet" href="scss/header.1.css" />
<link type="text/css" rel="stylesheet" href="scss/menu.1.css" />
<!-- Shoping Cart 시작
<input type="hidden" name="num" value="" />-->

<div id="content">
	<div id="cartWrap">
		<dl class="loc-navi">
			<dt class="blind">현재 위치</dt>
			<dd>
				<a href="/">HOME</a> &gt; CART
			</dd>
		</dl>

		<form action="CartDelete.ca" method="post" name="cartForm">

			<h2 class="tit-page">장바구니</h2>
			<div class="page-body">
				<div class="table-cart table-fill-prd">
					<table summary="번호, 사진, 제품명, 수량, 기본금액, 가격, 배송비, 취소">
						<caption>장바구니 담긴 상품</caption>

						<colgroup>
							<col width="75">
							<col width="90">
							<col width="*">
							<col width="115">
							<col width="95">
							<col width="105">
							<col width="95">
							<col width="95">
							<col width="95">
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><div class="tb-center">번호</div></th>
								<th scope="col"><div class="tb-center">사진</div></th>
								<th scope="col"><div class="tb-center">상품명</div></th>
								<th scope="col"><div class="tb-center">수량</div></th>
								<th scope="col"><div class="tb-center">기본금액</div></th>
								<th scope="col"><div class="tb-center">금액</div></th>
								<th scope="col"><div class="tb-center">배송비</div></th>
								<th scope="col"><div class="tb-center">취소</div></th>
								<th scope="col"><div class="tb-center">
										<input type="checkbox" id="allCheck" class="checkSelect">
									</div></th>
							</tr>
						</thead>


						<tbody>

							<%
								for (int i = 0; i < cartList.size(); i++) {
								if (cartList.size() > 0) {
							%>
							<input type="hidden" name="num"
								value="<%=cartList.get(i).getNum()%>">
							<%
								}
							coin += cartList.get(i).getPrice();
							%>
							<tr class="nbg">
								<!-- 2019.07.03 -->


								<td><div class="tb-center">

										<%=cartNo%>


									</div></td>


								<td>
									<div class="tb-center">
										<div class="thumb">
											<a href=""><img
												src="http://oryany.co.kr/shopimages/nasign/0010010007533.jpg?1597366090"
												alt="상품 섬네일" title="상품 섬네일" width="1"></a>
										</div>
									</div>
								</td>
								<td>
									<div class="tb-left">
										<a href="" class="tb-bold"><%=cartList.get(i).getProduct_name()%></a>
										<div id="3360797_1" class="tb-opt">
											<span class="tb-dl"><span class="opt_dd">색상 : <%=cartList.get(i).getColor()%></span></span>
										</div>
										<div id="3360797_1" class="tb-opt">
											<span class="tb-dl"><span class="opt_dd">사이즈 :
													<%=cartList.get(i).getSize()%></span></span>
										</div>
									</div>
								</td>
								<td>
									<!-- ----------------------------------------------------------------------------------------------------------------------------------- -->
									<div class="tb-center">
										<div class="opt-spin">
							
							<input type="button" id="btn-down<%=i%>" class="btn-dw"	onclick="cntDown(this.id)" value="-">
							<input type="text" id="btn-num<%=i%>" name="amount"	 value="<%=cartList.get(i).getCnt() %>" class="txt-spin"> 
						<span class="btns">		<input type="button" id="btn-up<%=i%>" class="btn-up" onclick="cntUp(this.id)" value="+">
													
											</span>
										</div>
										<a class="CSSbuttonWhite btn_option" id="btn-Save<%=i %>" onclick="cntUpdate(<%=cartList.get(i).getNum()%>, this.id)" >EDIT</a>
									</div> <!-- ----------------------------------------------------------------------------------------------------------------------------------- -->


							
								</td>
								<td><div class="tb-center "><span class="back"><b><%=cartList.get(i).getPrice()%></b></span>원</div></td>
								<td><div class="tb-center tb-bold tb-price">
								<%
								 cntSet = cartList.get(i).getCnt() * cartList.get(i).getPrice() ;
								%>
										<span><%=cntSet %></span>원
									</div></td>
								<td><div class="tb-center tb-delivery">
										<div class="MS_tb_delivery">
											<div id="deliverycase0" class="MS_layer_delivery">

												<dl>
													<dt>기본배송</dt>
												</dl>

											</div>
										</div>
									</div></td>
								<td>
									<div class="tb-center">
										<span class="d-block"><a
											onclick="location.href='CartDelete.ca?chk=<%=cartList.get(i).getNum()%>'"
											class="CSSbuttonWhite btn_select">DELETE</a></span>
									</div>
								</td>
								
								
								
								
									<!-- -----------------------------체크박스--------------------------------------------- -->
									
									
								<td align="center"><input type="checkbox" name="chk"  id="chk-num<%=i %>" class="checkSelect" value="<%=cartList.get(i).getNum()%>" onclick="chkOk()" >
									<input type="hidden" name="checkNum" value="<%=cartList.get(i).getNum()%>"> 
									
									<!-- -------------------------------------------------------------------------------------- -->
									
									
									
									
									
									
									<input	type="hidden" name="basket_item" value="{&quot;uid&quot;:&quot;3360797&quot;,&quot;cart_id&quot;:&quot;1&quot;,&quot;cart_type&quot;:&quot;NORMAL&quot;,&quot;pack_uid&quot;:&quot;&quot;,&quot;use_tax&quot;:&quot;N&quot;}">
									<input type="hidden" name="extra_item"
									value="{&quot;extra_require_uid&quot;:null,&quot;extra_require&quot;:null,&quot;extra_main_brandname&quot;:&quot;&quot;}"></td>
							</tr>
							<%
								cartNo--;

							}
							%>

						</tbody>
						<tfoot>
							<tr>
								<td colspan="8">
									<div class="tb-right">
										<span class="MK_none_groupsale_total_price_sell"> 총
											구매금액<span
											class="MK_chg_none_groupsale_total_price_sell MK_change_price">

												<!--                               if($("input:checkbox[name=chk]").is(":checked") == true) { -->


												</span>원
										</span><span class="MK_total_delivery">+ 배송비<span
											class="MK_chg_total_delivery MK_change_price">
												<%
													if (cartList.size() == 0) {
													sevice = 0;
												%> <%=sevice%> <%
												 	} else if (cartList.size() >= 1) {
												 if (coin >= 30000) {
												 	sevice = 0;
												 %> <%=sevice%> <%
												 	} else {
												 sevice = 2500;
												 %> <%=sevice%> <%
												 	}
												 }
												 %>
										</span>원
										</span> = <strong><span class="MK_total_price"><span
												class="MK_chg_total_price MK_change_price"><%=sevice%></span>원</span></strong><br>
<!-- 										                           <span class="MK_total_reserve">기본금액<span -->
<!-- 										                              class="MK_chg_total_reserve MK_change_price">4,380</span>원 -->
<!-- 										                           </span><span class="MK_group_sale_reserve"> (그룹적립금 원) </span><span -->
<!-- 										                              class="MK_total_point"> / 포인트 </span> -->
									</div>
								</td>
							</tr>
						</tfoot>

					</table>
				</div>
				<!--          .table-fill-prd -->

				<div class="btn-order-ctrl">
					<a href="javascript:multi_order()" class="CSSbuttonBlack">주문하기</a>
					<a href="/html/mainm.html" class="CSSbuttonWhite">계속 쇼핑하기</a>
					 <a	class="CSSbuttonWhite" onclick="document.cartForm.submit()">장바구니 비우기</a>
				</div>

				<!--          .table-fill-prd -->
			</div>
		</form>
		<!-- .page-body -->
	</div>
	<!-- #cartWrap -->
</div>
<!-- Shoping Cart 끝 -->
<script type="text/javascript">

	// 상품개수증가
  function cntUp(id) {
		var numid = id.replace("up", "num");
		var result = parseInt(numid)+1
		var cnt = Number($('#'+numid).val());
		cnt += 1;
		
		$('#'+numid).val(cnt);
		
	};
	
	// 상품개수감소
	function cntDown(id) {
		var numid = id.replace("down", "num");
		
		var cnt = Number($('#'+numid).val());
		if(cnt > 1) {
			cnt -= 1;
			$('#'+numid).val(cnt);
		}
	};
	
	
	// 수량 변경
	function cntUpdate(num , id){
		
		var numid = id.replace("Save", "num");
		var cnt = Number($('#'+numid).val());
		alert(cnt);
		
	location.href='CartUpdate.ca?num='+num+'&cnt='+cnt+'&member_id=dodo';
	
	};
		
	
// 	체크 확인
// 	function chkOk(){
		
// 		var currentRow=$(this).closest("tr"); 
        
//         var money = currentRow.find(".back").html();
// 		alert(money);
	
// 	}
	
	
	// 주문 
// 	$(".checkSelect").click(function(){ 
		
// 		var rowData = new Array();
// 		var tdArr = new Array();
		
// 		var checkbox = $("input[name=chk]:checked");
// 		checkbox.each(function(i) {
			
		
// 			var tr = checkbox.parent().parent().eq(i);
// 			var td = tr.children();
// 			// 배열에 담기
// 			rowData.push(tr.text());
			
// 			var in0 = td.eq(0).text();
// 			var in1 = td.eq(2).text();
// 			var in2 = td.eq(2).text();
// 			var in3 = td.eq(3).text();
// 			var in4 = td.eq(4).text();
// 			var in5 = td.eq(5).text();
// 			var in6 = td.eq(6).text();
// 			var in7 = td.eq(7).text();
// 		}
		
// 	location.href='CartUpdate.ca?num='+num+'&cnt='+cnt+'&member_id=dodo';
	
// 	}

	
		// 체크박스 선택된 한줄 값 가져오기
		$(".checkSelect").click(function(){ 
			var rowData = new Array();
			var tdArr = new Array();
			var checkbox = $("input[name=chk]:checked");
			var chArr = new Array();
			
			// 체크된 체크박스 값을 가져온다
			checkbox.each(function(i) {
				// checkbox.parent() : checkbox의 부모는 <td>이다.
				// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();
				
				// 체크된 row의 모든 값을 배열에 담는다.
				rowData.push(tr.text());
				
				// 0번 num값
				var in0 = td.eq(0).text();
				// 1번 사진 -> PASS
				// 2번  상품명 (상품명 , 색상 , 사이즈)
				var in2 = td.eq(2).text();
				// cnt => input type="text" 벨류 값 가져오기  
				var in3 = Number(td.eq(3).find('.txt-spin').val());
				// 4번 상품 기본금액
				var in4 = td.eq(4).text();
				// 숫자 뒤에 원 없애기
				in4 = Number(in4.substr(0, in4.length -1));        
// 				alert(in4);
				
				// 가져온 값을 배열에 담는다.
				tdArr.push(in3);
				tdArr.push(in4);
// 					alert(typeof(in3));
// 					alert(typeof(in4));
// 				document.write("<br>in0 : " + in0);
// 				document.write("<br>in2 : " + in2);
// 				document.write("<br>in3 : " + in3 + "개");
// 				document.write("<br>in4 : " + in4);

				// cnt * 상품의 기본금액 
// 				document.write("<Br>sum : " + sum);
// 				document.write("<br>in3 * in4 : " + (in3 * in4) + "원");
// 				alert("sum : " + sum);

				// 할일 
				// cnt * 상품의 기본금액  값을 금액에 출력 !
		
				sum = in3 * in4;
				// 배열.unshift (앞쪽으로 넣음)
						alert(chArr); 
			});
				
			});
			
	
	
	
</script>
<jsp:include page="../inc/footer.jsp" />