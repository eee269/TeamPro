<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = (String) session.getAttribute("member_id");
%>

<jsp:include page="/inc/header.jsp" />
<link type="text/css" rel="stylesheet" href="scss/common.css" />
<link type="text/css" rel="stylesheet" href="scss/mp_main.css" />
<link type="text/css" rel="stylesheet" href="scss/header.1.css" />
<link type="text/css" rel="stylesheet" href="scss/menu.2.css" />

<div id="contentWrapper">
	<div id="contentWrap">
		<hr>
		<div id="content">
		
		<div id="aside">
			<h2 class="aside-tit"> 비밀번호 수정</h2>
		</div>
			<div class="page-body">
			<form action="MemberPassPro.mo" method="POST"
				style="border: 0.1px gray dashed; margin: 100px 20%; padding: 50px 10%; text-align: center;">
				<label style="font-size: 30px"><strong><%=id %></strong> 고객님</label>
				<br><br><br>
				
				<strong style="font-size: 18px">비밀번호를 수정하시겠습니까?</strong>
				
				<br><br><hr><br><br><br>
				
				<input type="password" name="password" placeholder="비밀번호를 입력하세요" 
				style="width: 450px; padding: 5px; text-align: center;" required="required">
				<br><br><br>
				
				<input type="password" name="password" placeholder="확인 비밀번호를 입력하세요" 
				style="width: 450px; padding: 5px; text-align: center;" required="required">
				
				<input type="submit" value="확인" style="padding: 15px 20px; cursor: pointer;">
			</form>
			
			<!-- 하단 여백 -->
<div style="height: 150px"></div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/inc/footer.jsp" />
