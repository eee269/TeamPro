<%@page import="java.util.HashMap"%>
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
<link type="text/css" rel="stylesheet" href="css/control.css" />
</head>
<body>
	<jsp:include page="../inc/header.jsp" />
	<h1 style="margin: 50px 100px">Admin - Product</h1>
	<table
		style="border: 0.3px solid lightgray; text-align: center; margin: 100px 50px; width: 80%; min-height: 500px;">
		<tr>
			<th>기본코드</th>
			<th>상품명</th>
			<th>대분류 카테고리</th>
			<th>소분류 카테고리</th>
			<th>상품코드</th>
			<th>색상</th>
			<th>사이즈</th>
			<th>가격</th>
			<th>상품등록일</th>
			<th>재고</th>
			<th>좋아요</th>
			<th>썸네일 이미지</th>
			<th>상세설명 이미지</th>
			<th>삭제</th>
		</tr>

		<%
			ArrayList<ProductBean> productList = (ArrayList) request.getAttribute("productList");
		HashMap<String, ArrayList<ProductOptionBean>> optionList = (HashMap) request.getAttribute("optionList");
		for (int i = productList.size() - 1; i >= 0; i--) {
			int total = 0;
			ProductBean product = new ProductBean();
			product = productList.get(i);
			String basicCode = product.getBasicCode();

			ArrayList<ProductOptionBean> subOptionList = new ArrayList<ProductOptionBean>();
			subOptionList = optionList.get(basicCode);

			for (int j = 0; j < subOptionList.size(); j++) {
				ProductOptionBean option = new ProductOptionBean();
				option = subOptionList.get(j);
				total += option.getStock();
		%>

		<tr>
			<td><%=basicCode%></td>
			<td><%=product.getName()%></td>
			<td><%=product.getXcode()%></td>
			<td><%=product.getNcode()%></td>
			<td><%=option.getProductCode()%></td>
			<td><%=option.getColor()%></td>
			<td><%=option.getSize()%></td>
			<td><%=product.getPrice()%> 원</td>
			<td><%=product.getDate()%></td>
			<td><%=option.getStock()%> 개</td>
			<td><%=product.getLikey()%></td>
			<td><%=product.getMain_img()%></td>
			<td><%=product.getSub_img()%></td>
			<td><input class="in_bu" type="button" value="삭제"
				onclick="location.href='OptionDelete.po?productCode=<%=option.getProductCode()%>&basicCode=<%=basicCode%>'"></td>
		</tr>
		<%
			}
		%>
		<tr>
			<td colspan="14"><span><%=basicCode%>, <%=product.getName()%>
					의 총 옵션 갯수: <%=total%> 개</span></td>
		</tr>
		<%
			}
		%>
	</table>
	<jsp:include page="../inc/footer.jsp" />
</body>
</html>