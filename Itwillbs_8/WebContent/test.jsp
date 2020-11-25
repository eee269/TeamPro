<%@page import="vo.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 전달받은 request 객체로부터 데이터 가져오기
	// "pageInfo" 객체와 "articleList" 객체를 request 객체로부터 꺼내서 저장
	// "pageInfo" 객체로부터 페이지 관련 값들을 꺼내서 변수에 저장
	ArrayList<Cart> cartList = (ArrayList<Cart>)request.getAttribute("cartList");
	
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int listCount = pageInfo.getListCount();
	
%>    
<%=listCount %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">
	#listForm {
		width: 1024px;
		max-height: 610px;
		border: 1p solid red;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 1024px;
	}
	
	#tr_top {
		background: orange;
		text-align: center;
	}
	
	#pageList {
		margin: auto;
		width: 1024px;
		text-align: center;
	}
	
	#emptyArea {
		margin: auto;
		width: 1024px;
		text-align: center;
	}
	
	#buttonArea {
		margin: auto;
		width: 1024px;
		text-align: right;
	}
	
	a {
		text-decoration: none;
	}
	
</style>
</head>
<body>
	<!-- 게시판 리스트 -->
	<section id="listForm">
		<h2>글 목록</h2>
		<table>
			<%
			if(cartList != null || listCount > 0 ) {
			%>
				<tr id="tr_top">
					<td width="100px">번호</td>
					<td>Member_id</td>
					<td width="150px">Goods_name</td>
					<td width="150px">Goods_code</td>
					<td width="100px">Price</td>
					<td width="150px">Color</td>
					<td width="150px"></td>
					<td width="100px">Size</td>
					<td width="150px">Cnt</td>
				</tr>
				<%
				for(int i = 0; i < cartList.size(); i++) {
				%>
				<tr>
					<td align="center"><%=cartList.get(i).getNum() %></td>
					<td align="center"><%=cartList.get(i).getMember_id() %></td>
					<td align="center"><%=cartList.get(i).getGoods_name() %></td>
					<td align="center"><%=cartList.get(i).getGoods_code() %></td>
					<td align="center"><%=cartList.get(i).getPrice() %></td>
					<td align="center"><%=cartList.get(i).getColor() %></td>
					<td align="center"><%=cartList.get(i).getSize() %></td>
					<td align="center"><%=cartList.get(i).getCnt() %></td>
						
				</tr>
				
				<%}%>
		</table>
	</section>
	<section id="buttonArea">
		<input type="button" value="글쓰기" onclick="location.href='BoardWriteForm.bo'" />
	</section>
	<section id="pageList">
	
	
	
	</section>
	<%
	} else {
	%>
	<section id="emptyArea">등록된 글이 없습니다</section>
	<%
	}
	%>
</body>
</html>