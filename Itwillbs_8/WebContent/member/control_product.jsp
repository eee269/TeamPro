<%@page import="vo.ProductOptionBean"%>
<%@page import="vo.ProductBean"%>
<%@page import="java.util.ArrayList"%>
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
<jsp:include page="../inc/header.jsp"/>
<h1>Admin - </h1><h3> &nbsp;Goods</h3>
<table>
<tr><th>행번호</th><th>기본코드</th><th>상품코드</th><th>대분류 카테고리</th><th>소분류 카테고리</th><th>상품명</th><th>색상</th><th>사이즈</th><th>가격</th><th>상품등록일</th><th>재고</th><th>삭제</th></tr>



<%

ArrayList<ProductBean> productList = (ArrayList)request.getAttribute("productList");
ArrayList<ProductOptionBean> optionList = (ArrayList)request.getAttribute("optionList");

for(int i=0; i<productList.size();i++){
	ProductBean product = new ProductBean();
	product = productList.get(i);
	
	for(int j=0; j<optionList.size(); j++) {
		ProductOptionBean option = new ProductOptionBean();
		option = optionList.get(j);
		
		String basicCode = product.getBasicCode();
		%>
		
		<tr>
		<td><%=i-1+j %></td>
		<td><%=option.getProductCode() %></td>
		<td><%=basicCode %></td>
		<td><%=product.getXcode() %></td>
		<td><%=product.getNcode() %></td>
		<td><%=product.getName() %></td>
		<td><%=option.getColor() %></td>
		<td><%=option.getSize() %></td>
		<td><%=product.getLikey()%></td>
		<td><%=product.getPrice()%></td>
		<td><%=product.getStock()%></td>
		<td><%=product.getType()%></td>
		<td><%=product.getMain_img()%></td>
		<td><%=product.getSub_img()%></td>
		<td><input class="in_bu" type="button" value="삭제" onclick="location.href='/DeleteProduct.po?basicCode='+ <%=basicCode%>"></td></tr><%
		}
	}
%>
</table>
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>