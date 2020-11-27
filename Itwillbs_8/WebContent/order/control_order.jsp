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
function changeStatus(code) {
	
}
</script>

</head>
<body>
	<jsp:include page="../inc/header.jsp" />
	<%
		ArrayList<OrderBean> mainorder = (ArrayList) request.getAttribute("mainorderList");
	HashMap<String, ArrayList<DetailOrderBean>> detailorder = (HashMap) request.getAttribute("detailorderList");
	%>
	<h1 style="margin: 50px 100px">Admin - Order</h1>
	<table
		style="border: 0.3px solid lightgray; text-align: center; margin: 100px 50px; width: 80%; min-height: 500px;">
		<tr>
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
			for (int i = mainorder.size() - 1; i >= 0; i--) {
			OrderBean mor = new OrderBean();
			mor = mainorder.get(i);
			String mainorder_code = mor.getCode();

			
			int total = 0, cash = 0;
		%>
		<tr>
			<td><%=mor.getCode()%></td>
			<td><%=mor.getDate()%></td>
			<td><%=mor.getMember_id()%></td>
			<td><%=mor.getName()%></td>
			<td><%=mor.getPhone()%></td>
			<td><%=mor.getAddress()%></td>
			<td>
				<%
					for (int j = 0; j < detailorder.size(); j++) {
						ArrayList<DetailOrderBean> subDetailorder = detailorder.get(mainorder_code);
						System.out.println(subDetailorder.get(j));
						DetailOrderBean dor = new DetailOrderBean();
						dor = subDetailorder.get(j);
						total++;
						cash += dor.getPrice() * dor.getCnt();
				%> <span><%=dor.getName()%> (<%=dor.getColor()%> / <%=dor.getSize()%>):
					<%=dor.getCnt()%> 개 <%=dor.getPrice()%></span> <%
 	}
 %>
			</td>
			<td>결제수단</td>
			<td><select id="status" onfocus="<%=mor.getStatus()%>">
					<option value="결제완료">결제완료</option>
					<option value="상품준비중">상품준비중</option>
					<option value="배송중">배송중</option>
					<option value="배소완료">배송완료</option>
			</select> <input type="button" value="적용"
				onclick="changeStatus(<%=mainorder_code%>)"></td>
			<td>
				<!-- <select id=""> --> <!-- 	<option>주문취소</option><option>교환</option><option>환불</option> -->
				<!-- </select> --> <input type="button" value="주문취소"
				onclick="location.href='DeleteOrder.or?code=<%=mainorder_code%>'">
			</td>
			<td colspan="10"><span>총 <%=total%> 개 구매, <%=cash%> 원
			</span></td>
		</tr>
		<%
			}
		%>
	</table>
	<jsp:include page="../inc/footer.jsp" />
</body>
</html>