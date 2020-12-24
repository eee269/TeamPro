<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
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
    <jsp:include page="../inc/header.jsp"/>
<!-- QuickMenu -->
<jsp:include page="../quickMenu.jsp" />

	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="Main.go" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="CommList.co" class="stext-109 cl8 hov-cl1 trans-04">
				Community
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				Delete
			</span>
		</div>
	</div>
	<!-- Content page -->
	<div class="bbs-table-pwd">
		<form name="form1" action="CommDeletePro.co" method="post" autocomplete="off" >   
			<input type="hidden" name="num" value="<%=request.getParameter("num") %>" />
			<input type="hidden" name="page" value="<%=request.getParameter("page") %>" />
			<!-- 비밀번호 입력 -->
			<fieldset>
				<legend>비밀번호 찾기</legend>
				<table summary="비밀번호찾기테이블">
					<caption>비밀번호 찾기</caption>
					<colgroup>
						<col width="112" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th><div>PASSWORD</div></th>
							<td><div><input id="bp_input_passwd" type="password"  class="MS_input_txt" name="pass" /></div></td>
						</tr>
					</tbody>
				</table>
			</fieldset>
		<!-- //비밀번호 입력 -->
		<div class="bbs-link pwd-link">
			<a href="javascript:document.form1.submit();" class="CSSbuttonBlack">확인</a>
			<a href="javascript:history.go(-1);" class="CSSbuttonWhite">취소하기</a>
			<a href="CommList.co" class="CSSbuttonWhite">목록보기</a>
		</div>
		</form>          
	</div>	
<jsp:include page="../inc/footer.jsp"/>