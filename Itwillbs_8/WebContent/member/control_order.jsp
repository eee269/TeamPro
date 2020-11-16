<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/control_mem_order.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../header.jsp"/>
<h1>Admin - </h1><h3>&nbsp;Order</h3>
<table>
<tr><th>행번호</th><th>주문번호</th><th>주문날짜</th><th>주문자(id/email)</th><th>수신인</th><th>핸드폰번호</th><th>주소</th><th>상품명</th><th>색상</th><th>사이즈</th><th>결제수단</th><th>배송현황</th><th>주문취소/교환/환불</th></tr>

<% 
for(int i=0;i<10;i++){
%>
<tr><td><%=i %></td><td>주문번호</td><td>주문날짜</td><td>주문자(id/email)</td><td>수신인</td><td>핸드폰번호</td><td>주소</td><td>상품명</td><td>색상</td><td>사이즈</td><td>결제수단</td><td><select><option>결제완료</option><option>상품준비중</option><option>배송중</option><option>배송완료</option></select></td><td><select><option>주문취소</option><option>교환</option><option>환불</option></select></td></tr>
<%
}
%>
</table>
<jsp:include page="../footer.jsp"/>
</body>
</html>