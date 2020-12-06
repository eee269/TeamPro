<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
%>
    <jsp:include page="../inc/header.jsp"/>
<!-- QuickMenu -->
<jsp:include page="../quickMenu.jsp" />

	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="blog.html" class="stext-109 cl8 hov-cl1 trans-04">
				Blog
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				8 Inspiring Ways to Wear Dresses in the Winter
			</span>
		</div>
	</div>
	<!-- Content page -->
	<section class="bg0 p-t-52 p-b-20">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<form action="CommDeletePro.co" method="post">
						<input type = "hidden" name = "num" value = "<%=num%>"/>
						<input type = "hidden" name = "page" value = "<%=request.getParameter("page") %>"/>
						비밀번호 : <input type="password" name ="pass" placeholder="비밀번호를 입력해주세요"> 
						<input type="submit" value="입력">
					</form>
				</div>
			</div>
		</div>
	</section>	
<jsp:include page="../inc/footer.jsp"/>