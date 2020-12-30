<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String member_id =(String)session.getAttribute("member_id");
	String OOTD = "skfkd3123@gmail.com";
	
%>
<style>
th{
	background: #dee2e6;
}
.CSSbuttonBlack {
	-webkit-font-smoothing: antialiased;
	vertical-align: middle;
	text-decoration: none;
	font-family: 'Roboto', 'Nanum Gothic', Dotum, AppleGothic, Helvetica,
		sans-serif;
	display: inline-block;
	border: 1px solid #231f20;
	transition: all 0.3s ease;
	color: #fff;
	background: #000;
	width: 160px;
	line-height: 48px;
	text-align: center;
	font-size: 14px;
	float: right;
	clear: both;
}

.CSSbuttonBlack:hover {
	transition: all 0.3s ease;
	color: #000;
	background: #fff;
}
</style>
<script type="text/javascript"
	src="http://oryany.co.kr//wcs.naver.net/wcslog.js"></script>

<!-- 게시판 CSS -->
<link type="text/css" href="css/common.css" rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="http://oryany.co.kr/shopimages/nasign/template/work/33865/board_write.nasign.css?t=202005111439" />
<!-- 게시판 CSS -->

<div id="wrap">
	<div id="contentWrapper">
		<div id="contentWrap">
			<div id="content">
				<div id="bbsData">
					<div class="page-body">
						<div class="bbs-table-write">
							<form name='sendMailForm' action="sandMail.jsp" method='post'>
								<fieldset>
									<legend>E-Mail 문의</legend>
									<table summary="">
										<colgroup>
											<col width="135" />
											<col width="395" />
											<col width="155" />
											<col width="*" />
										</colgroup>
										<tbody>
											<tr>
												<th><div>회원ID</div></th>
												<td><div>
														<input id='bw_input_writer' type='text' name='sender'
															class="MS_input_txt input_style1" value="<%=member_id%>"/>
													</div></td>
											</tr>
											<tr>
												<th><div>&nbsp;관리자&nbsp; E-Mail</div></th>
												<td><div>
														<input id='bw_input_subject'
															class="MS_input_txt input_style1" type='text'
															name='receiver' value='<%=OOTD %>' />
													</div></td>
											</tr>
											<tr>
												<th><div>제목</div></th>
												<td colspan="3">
													<div class="title">
														<input id='bw_input_subject'
															class="MS_input_txt input_style1" type='text'
															name='subject' />
													</div>
												</td>
											</tr>
											<tr>
												<th><div>내용</div></th>
												<td colspan="3" class="text_content">
													<div>
														<textarea id='MS_text_content' name='content'
															class="MS_input_txt input_style1"
															style='font-family: 굴림체;'></textarea>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									<!-- //게시판 글쓰기 -->
									<!-- 하단 버튼 -->
									<div class="flex-w flex-c-m m-tb-10 float-r">
										<i class="cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
										<input type="submit" value="보내기" class="CSSbuttonBlack">
									</div>
									<!-- //하단 버튼 -->
							</form>
							</fieldset>
						</div>
					</div>
					<!-- .page-body -->
				</div>
				<!-- #bbsData -->
			</div>
			<!-- #content -->
		</div>
		<!-- #contentWrap -->
	</div>
	<!-- #contentWrapper-->
	<hr />
</div>

