<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../inc/header.jsp"/>
<!-- QuickMenu -->
<jsp:include page="../quickMenu.jsp" />
<!-- Cart -->
<jsp:include page="../sub_cart.jsp"/>
<style>
body .container_comm_write {
  position: relative;
  overflow: auto;
  width: 800px;
  margin: 80px auto 0;
  background-color: #ffffff;
  -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
}
.container_comm_write h1 {
  font-size: 18px;
  font-weight: 700;
  margin-bottom: 23px;
  text-align: center;
  text-indent: 6px;
  letter-spacing: 7px;
  text-transform: uppercase;
  color: #263238;
  margin-top: 50px;
  margin-bottom: 50px;
}
.summernoter{
	resize: none;
}
/* #header-v4 { */
/* color: #424242; */
/* line-height: 1; */
/* font-family: "Noto Sans KR", "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", sans-serif; */
/* -webkit-font-smoothing: antialiased; */
/* letter-spacing: -0.4px; */
/* font-size: 15px; */
/* -webkit-box-direction: normal; */
/* -webkit-tap-highlight-color: transparent; */
/* margin: 0; */
/* padding: 0; */
/* transition: top .1s; */
/* background-color: #fff; */
/* border-bottom: 1px solid #ededed; */
/* z-index: 502; */
/* position: relative; */
/* } */
input[type=text] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 1px solid;
  border-radius: 4px;
}
.wrap-menu-desktop{
	z-index: 2;
}
</style>
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
	<section class="container_comm_write">
		    <article class="half">
		        <div class="content">
		        	<div class = "toolbar-container">
			            <div class="signin-cont cont">
			                <form action="CommWritePro.co" method="post" enctype="multipart/form-data">
			                	<input type="hidden" id="name" name="username" value="호랑이">
			                	<input type="hidden" id="pass" name="pass" value="123">
								<input type="file" name="img" id="img" onchange="setThumbnail(event);"><br>
								<div id="image_container" style="width=100%; height=200px;"></div>
        						<input type="text" id="subject" name="subject" placeholder="제목"><br>
								<textarea id ="summernote" name="content"></textarea><br>
								<input type="submit" id="edit" class="btn btn-primary" value="완료">
								<input type="reset" id="save" class="btn btn-primary" value="취소" >
							</form>
   				        </div>
		        	</div>
		        </div>
		    </article>
	</section>
	<!-- Content page -->
	<jsp:include page="../inc/footer.jsp" />
	<!-- WriteEditor -->
	<jsp:include page="../inc/writeEditor.jsp"/>
	<!-- WriteEditor -->
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

</body>
</html>