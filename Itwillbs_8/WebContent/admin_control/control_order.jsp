<%@page import="vo.DetailOrderBean"%>
<%@page import="java.util.HashMap"%>
<%@page import="vo.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/control.css" />
<script type="text/javascript">

// Java 시간에 했던 HTML Object 참고해서 다시 짜기
function changeStatus(code, id) {
	var selectId = id.replace("bnt", "sel");
	
	var option = document.getElementById(selectId);
	var val = option.options[option.selectedIndex].value;
	
// 	alert(selectId + val + code);
	location.href="UpdateOrderStatus.or?code="+code+"&status="+val;
}
</script>

</head>
<body>
	<jsp:include page="../inc/header.jsp" />
	<%
	// mainorder 가져오기
		ArrayList<OrderBean> mainorderList = (ArrayList<OrderBean>) request.getAttribute("mainorderList");
	// detailorder 가져오는데 한개의 mainorder-code(Key)에 해당하는 DetailOrderBean을 가진 리스트(Value)를 가져오는 해쉬맵 형식 
		HashMap<String, ArrayList<DetailOrderBean>> detailorderList = (HashMap<String, ArrayList<DetailOrderBean>>) request
			.getAttribute("detailorderList");
	%>
	<h1 style="margin: 50px 100px">Admin - Order</h1>
	<table
		style="border: 0.3px solid lightgray; text-align: center; margin: 100px 50px; width: 90%; min-height: 500px;">
		<tr>
			<th>순서</th>
			<th>주문번호</th>
			<th>주문날짜</th>
			<th>주문자(id/email)</th>
			<th>수신인</th>
			<th>핸드폰번호</th>
			<th>주소</th>
			<th>상품명</th>
			<th>결제수단</th>
			<th>배송현황</th>
			<th>주문취소</th>
		</tr>

		<%
			for (int i = 0; i < mainorderList.size(); i++) {
			OrderBean mor = new OrderBean();
			mor = mainorderList.get(i);
			String mainorder_code = mor.getCode();
			
			int total = 0, cash = 0;
		%>
		<tr>
			<td><%=i+1 %></td>
			<td><%=mor.getCode()%></td>
			<td><%=mor.getDate()%></td>
			<td><%=mor.getMember_id()%></td>
			<td><%=mor.getName()%></td>
			<td><%=mor.getPhone()%></td>
			<td><%=mor.getAddress()%></td>
			<td width="200px">
				<%
				// 밑 두 구문은 두번째 for문 전에 있어야 함
				ArrayList<DetailOrderBean> subDetailorder = new ArrayList<DetailOrderBean>();
				subDetailorder = detailorderList.get(mainorder_code);

				// DetailOrderBean 꺼내서 출력
				for (int j = 0; j < subDetailorder.size(); j++) {
					DetailOrderBean dor = new DetailOrderBean();
					dor = subDetailorder.get(j);
					total += dor.getCnt();
					cash += dor.getPrice() * dor.getCnt();
				%> <span><%=dor.getName()%> (<%=dor.getColor()%> / <%=dor.getSize()%>):
					<%=dor.getCnt()%> 개 <%=dor.getPrice()%> 원</span><br> <%
 				}
 			%>
			</td>
			<td>결제수단</td>
			
			
			<td><select id="sta-sel<%=i%>">
			<%
				switch(mor.getStatus()) {
				
				case "상품준비중":
					%>
					<option value="결제완료">결제완료</option>
					<option value="상품준비중" selected="selected">상품준비중</option>
					<option value="배송중">배송중</option>
					<option value="배송완료">배송완료</option>
					<%
					break;
				case "배송중":
					%>
					<option value="결제완료">결제완료</option>
					<option value="상품준비중">상품준비중</option>
					<option value="배송중" selected="selected">배송중</option>
					<option value="배송완료">배송완료</option>
					<%
					break;
				case "배송완료":
					%>
					<option value="결제완료">결제완료</option>
					<option value="상품준비중">상품준비중</option>
					<option value="배송중">배송중</option>
					<option value="배송완료" selected="selected">배송완료</option>
					<%
					break;
				default:
					%>
					<option value="결제완료" selected="selected">결제완료</option>
					<option value="상품준비중">상품준비중</option>
					<option value="배송중">배송중</option>
					<option value="배송완료">배송완료</option>
					<%
				}
			
			%>
					
			</select> <input type="button" value="상태변경" id="sta-bnt<%=i%>"
				onclick="changeStatus('<%=mainorder_code%>', this.id)"></td>
			<td>
				<!-- <select id=""> --> <!-- 	<option>주문취소</option><option>교환</option><option>환불</option> -->
				<!-- </select> --> <input type="button" value="주문취소"
				onclick="location.href='DeleteMainorder.or?code=<%=mainorder_code%>'">
			</td>

		</tr>
		<tr>
			<td colspan="11"><span>총 <%=total%> 개 구매, <%=cash%> 원</span></td>
		</tr>
		<%
			}
		%>
	</table>
	<jsp:include page="../inc/footer.jsp" />

</body>
</html>