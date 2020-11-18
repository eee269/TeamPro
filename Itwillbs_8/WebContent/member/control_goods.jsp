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
<h1>Admin - </h1><h3> &nbsp;Goods</h3>
<table>
<tr><th>행번호</th><th>상품코드</th><th>카테고리</th><th>상품명</th><th>색상</th><th>사이즈</th><th>가격</th><th>상품등록일</th><th>재고</th><th>삭제</th></tr>


<%
for(int i=0; i<10;i++){
%><tr><td><%=i %></td><th>상품코드</th><th>카테고리</th><th>상품명</th><th>색상</th><th>사이즈</th><th>가격</th><th>상품등록일</th><th>재고</th><td><input class="in_bu" type="button" value="삭제"></td></tr><%
}
%>
</table>
<jsp:include page="../footer.jsp"/>
</body>
</html>