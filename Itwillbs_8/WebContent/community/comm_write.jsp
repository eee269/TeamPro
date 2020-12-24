<%@page import="vo.CommBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   	String member_id = (String)session.getAttribute("member_id");
	if(member_id == null){
		%>
		<script>
			alert("잘못된 접근입니다!");
			history.back();
		</script>
		<%
	} 
%>
<link rel="stylesheet" type="text/css" href="css/comm_write.css">
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
				Community
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				Write
			</span>
		</div>
	</div>
	<!-- Content page -->
	<section class="bg0 p-t-52 p-b-20">
		<div class="container">
			 <div class="content">
	        	<div class = "toolbar-container">
		            <div class="signin-cont cont">
		                <form action="CommWritePro.co" method="post" enctype="multipart/form-data">
							<input type="file" name="img" id="img" onchange="setThumbnail(event);"><br>
							<div id="image_container" style="width=100%; height=200px;"></div>
       						<input type="text" id="subject" name="subject" placeholder="제목"><br>
							<textarea id ="summernote" name="content"></textarea><br>
							<div id="writeBtn">
								<input type="submit" id="edit" class="btn btn-primary" value="완료">
								<input type="reset" id="save" class="btn btn-primary" value="취소" >
							</div>
						</form>
  				        </div>
	        	</div>
	        </div>
		</div>
	</section>	
<script>
	function setThumbnail(event) {
			document.getElementById("file").select();
			document.selection.clear();
	};
	function setThumbnail(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
			
		};
		reader.readAsDataURL(event.target.files[0]);
	}
</script>
<jsp:include page="../inc/footer.jsp"/>
<!-- WriteEditor -->
<jsp:include page="../inc/writeEditor.jsp"/>
<!-- WriteEditor -->
</body>
</html>