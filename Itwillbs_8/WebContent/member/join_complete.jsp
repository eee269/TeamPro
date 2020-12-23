<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// String id=(String)request.getAttribute("id");
String id=request.getParameter("id");
// String id=(String)session.getAttribute("id");
String name=request.getParameter("name");



%>
<jsp:include page="../inc/header.jsp"/>

<style>
#header, #layerWrap, #contentWrap, #ftLink .link, #footer { width:1260px; }
#content { width:1260px;min-height:600px;background-color:#fff; margin:20px auto 0px;}
#contentWrap {background-color:#fff;}
body {min-width:1260px;}
a {text-decoration:none;}
body, h1, h2, h3, h4, h5, h6, table, input, select, textarea, a {font-family:'Roboto', 'Nanum Gothic',Dotum, AppleGothic, Helvetica, sans-serif;}

.cbtn{display:inline-block;font-size:11px;color:#000;min-width:98px;height:31px;line-height:32px;border:1px solid #000;text-align:center;-webkit-transition:all 0.3s ease;transition:all 0.3s ease;}
.cbtn.form{}
.cbtn.form.action{background-color:#000;color:#fff;}
.cbtn.form:hover{background-color:#000;color:#fff;}
.cbtn.form.action:hover{background-color:#fff;color:#000;}

#join-complete{padding-bottom:80px;color:#000;}
.imgWrap.title-img{text-align:center; padding:100px 0 40px }
.tit-join-complete{font-size:44px;letter-spacing:-2px;color:#000;font-weight:bold;line-height:54px;text-align:center;}
.complete-box{padding-top:16px;line-height:20px;color:#7f7f7f;font-size:14px;text-align:center;}
							
.join-footer{text-align:center;padding-top:50px }
.join-footer .cbtn.form{width:228px;height:58px;line-height:58px;font-size:16px;margin:0 5px;}

</style>
<script type="text/javascript">
function pValue(){
	document.getElementById("userId").value = opener.document.fr.id.value;
}
</script>




	<!-- Content page -->
	
	<body  onload="pValue()">
	<section class="bg0 p-t-75 p-b-120">
		<div class="container" >




				<div id="content">
					<div id="join-complete">
						<div class="imgWrap title-img">
							<img src="//image.makeshop.co.kr/makeshop/d3/basic_simple/member/member_join_complete.png" alt="회원가입이 완료되었습니다.">
						</div>
						<h1 class="tit-join-complete">회원가입 완료</h1>
						<div class="complete-box" >
							<dl>
								<dt>
<%-- 								<%= id%>님의  --%>
								회원가입이 성공적으로 이루어졌습니다.</dt>
								<dd>
									<p>
										SHOP OOTD 함께 즐거운 쇼핑 되세요!<br>										
<%-- 											<%= name %>님의  --%>
											축하적립금은 <span class="join-point">5000원</span> 입니다.<br>
																													</p>
								</dd>
							</dl>
							
							<div class="btnArea join-footer">
								<div class="center">									
									<a href="Main.go" class="cbtn form">메인화면</a>
								</div>
							</div>
						</div>
					</div>
                </div>







		</div>
	</section>	
</body>
<jsp:include page="../inc/footer.jsp"/>