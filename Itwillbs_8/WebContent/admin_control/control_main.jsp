<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<jsp:include page="/inc/header.jsp" />

<link type="text/css" rel="stylesheet" href="css/common.css" />
<link type="text/css" rel="stylesheet" href="css/mp_order.css" />
<link type="text/css" rel="stylesheet" href="css/header.css" />
<link type="text/css" rel="stylesheet" href="css/menu_2.css" />

<style>
h1 {
font-size : 40px;
}
span, a {
	font-size: 20px;
}
#body {
	padding: 150px;
}
</style>

<div align="center" id="body">
	<h1>Control</h1>
	<br><br><br><br>

	<a href="ControlMemberList.mo" >Member &nbsp;&nbsp;&nbsp; 관리하기 </a><br><br>
	<a href="ControlProductList.po">Product &nbsp;&nbsp;&nbsp; 관리하기 </a><br><br>
	<a href="ControlOrderList.or">Order &nbsp;&nbsp;&nbsp; 관리하기 </a>
	
</div>

<jsp:include page="/inc/footer.jsp" />