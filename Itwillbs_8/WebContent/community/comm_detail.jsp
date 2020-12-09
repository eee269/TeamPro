<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.CommReBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.CommBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CommBean article = (CommBean)request.getAttribute("article");
	String nowPage = request.getParameter("page");
	
//==============댓글시작==============//
// 전달받은 request 객체로부터 데이터 가져오기
ArrayList<CommReBean> commentList = (ArrayList<CommReBean>) request.getAttribute("commentList");

PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
int reNowPage = pageInfo.getPage();
int reMaxPage = pageInfo.getMaxPage();
int reStartPage = pageInfo.getStartPage();
int reEndPage = pageInfo.getEndPage();
int reListCount = pageInfo.getListCount();

// String id = (String)session.getAttribute("id");
String id = "dodo";
int community_num=Integer.parseInt(request.getParameter("num"));

//날짜 => 원하는 모양을 변경 문자열 결과값
SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
%>
<jsp:include page="../inc/header.jsp"/>
<link type="text/css" rel="stylesheet" href="scss/common.css" />
<link type="text/css" rel="stylesheet" href="scss/shopdetail.css" />
<link type="text/css" rel="stylesheet" href="scss/header.1.css" />
<link type="text/css" rel="stylesheet" href="scss/menu.1.css" />
<link type="text/css" rel="stylesheet" href="scss/power_review_custom.4.css" />
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
					<div class="p-r-45 p-r-0-lg">
						<div class="wrap-pic-w how-pos5-parent">
							<img src="communityUpload/<%=article.getImg() %>" alt="<%=article.getImg() %>">
							<div class="flex-col-c-m size-123 bg9 how-pos5">
								<span class="ltext-107 cl2 txt-center">
									22
								</span>
								<span class="stext-109 cl3 txt-center">
									Jan 2018
								</span>
							</div>
						</div>
						<div class="p-t-32">
							<span class="flex-w flex-m stext-111 cl2 p-b-19">
								<span>
									<span class="cl4">By</span> <%=article.getUsername()%>  
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>

								<span>
									<%=article.getDate()%>
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>

								<span>
									태그 자리 
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>

								<span>
									댓글 갯수
								</span>
								<span class="bookmark_count"> 북마크 갯수
								</span>
							</span>

							<h4 class="ltext-109 cl2 p-b-28">
								<%= article.getSubject() %>
							</h4>
						</div>
							<p class="stext-117 cl6 p-b-26">
								<%= article.getContent() %>
							</p>
						<div class="flex-w flex-t p-t-16">
							<span class="size-216 stext-116 cl8 p-t-4">
								Tags
							</span>

							<div class="flex-w size-217">
								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Streetstyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Crafts
								</a>
							</div>
						</div>
						<br>
						<input type="button" class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04"
							value="삭제" onclick="location.href='CommDeleteForm.co?num=<%=article.getNum()%>&page=<%=nowPage%>'">
						<input type="button" class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04"
							value="수정" onclick="location.href='CommModifyForm.co?num=<%=article.getNum()%>&page=<%=nowPage%>'">
						<input type="button" class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04"
							value="북마크" id="bookmark">
						<br>
						
						
						
						<!-- -----------------------------Comment----------------------------- -->
						<h2 class="comment_title">COMMENT</h2>
						<div id="productDetail" style="padding-top:20px;">
							<div class="page-body">
								<div class="cboth">
								<div id="powerReview">
										<div id="listPowerReview" class="MS_power_review_list">
	
	
											<!-- 댓글등록 폼 시작 -->
											<form name="comm_re" id="comm_re" action="CommReWritePro.co" method="post" class="w-full">
											<input type="hidden" name="username" value="<%=id %>">
											<input type="hidden" name="community_num" value="<%=community_num%>">
											<input type="hidden" name="rePage" value="<%=request.getParameter("rePage")%>">
											<div id="writePowerReview">
												<div class="PR15N01-write">
													<form name="prw_form" id="prw_form" action="" method="post"
														autocomplete="off">
														<div class="pr-txtbox">
															<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="contents" name="contents"></textarea>												
															<div class="thumb-wrap"></div>
														</div>
													</form>
												</div>
												<!-- .PR15N01-write -->
												<div class="PR15N01-recmd">
	
													<div class="cvr right">
														<%
														if(id!=null){
															%><input type="submit" value="댓글등록" class="lnk-review review_write"><%
														}else{
															%><input type="submit" value="댓글등록" class="lnk-review review_write" onclick="return loginCheck()"><%
														}
														%>
														
													</div>
												</div>
												<!-- .PR15N01-recmd -->
											</div>
											<div class="cboth"></div><br><br><br>
											<!-- 댓글등록 폼 끝 -->
	
	
	
											
											<ul class="PR15N01-review-wrap">
	
											<!-- 댓글 반복문 시작 -->
											<%
												for(int i = 0; i < commentList.size(); i++) {
											%>
											
												<li id="power_review_block995511"
													class="power-review-list-box">
													<dl class="desc">
														<dt class="first">작성자</dt>
														<dd><%=commentList.get(i).getUsername() %></dd>
														<dt>작성일</dt>
														<dd><%=sdf.format(commentList.get(i).getDate()) %></dd>
													</dl>
													
													
													<%
													if(commentList.get(i).getRe_lev()>0){ //답댓글일경우 왼쪽 여백을 줌 
														%><div class="content" style="padding-left:50px;"><%
													}else{
														%><div class="content"><%
													}
													%>
						

														<p class="content_p">
															<% //답댓글일경우 [RE]를 붙인다
																if(commentList.get(i).getRe_lev()>0){ //댓글인경우
																	%><b>[RE]</b><%
																}
															%>
																									
															<%=commentList.get(i).getContents() %>
														</p>
														<div class="ctr"></div>
													</div>
														
															
	
													<%
														if(id!=null){ //원댓글일 경우에는 답댓글 버튼이보인다
															if(commentList.get(i).getRe_lev()==0){
														%><input type="button" value="답댓글" class="bu_gray_s comment_add"></span><%
														}
													}
													%>
													
													<%if(id!=null){
														if(id.equals(commentList.get(i).getUsername())){%>																					
															<input type="button" value="수정" class="bu_gray_s comment_modify">
	 														<a href="CommReDeletePro.co?num=<%=commentList.get(i).getNum()%>&community_num=<%=commentList.get(i).getCommunity_num() %>&rePage=<%=request.getParameter("rePage") %>" class="bu_gray_s" onclick='return button_event();' style="line-height:1.25;">삭제</a>						
																								
													<%}}%>
													
													
													
													<!-- 댓글 수정 입력폼 시작 -->
													<div id="obj" class="obj reply-wrap">
													<form name="comment" id="comment" action="CommReModifyPro.co" method="post" style="margin-top:0px !important; padding-top:0px !important;">
														<input type="hidden" name="username" value="<%=id %>">
														<input type="hidden" name="community_num" value="<%=community_num%>">
														<input type="hidden" name="num" value="<%=commentList.get(i).getNum()%>">
														<div class="wrt">
															<textarea name="contents" id="contents" ><%=commentList.get(i).getContents()%></textarea>
	<!-- 														<a href="javascript:power_review_comment_write('995511', '995511');">수정</a> -->
															<input type="submit" value="수정" class="btn_comment">
														</div>
													</form>	
													</div>
													<!-- 댓글 수정 입력폼 끝 -->
													
													<!-- 대댓글 입력폼 시작 -->
													<div id="comm_add" class="comm_add reply-wrap">
													<form name="comment" id="comment" action="CommReReWritePro.co" method="post">
													<input type="hidden" name="username" value="<%=id %>">
													<input type="hidden" name="community_num" value="<%=community_num%>">
													<input type="hidden" name="num" value="<%=commentList.get(i).getNum()%>">
													<input type="hidden" name="rePage" value="<%=request.getParameter("rePage")%>">
														<div class="wrt">
															<textarea name="contents" id="contents"></textarea>
															<input type="submit" value="입력" class="btn_comment">
														</div>
													</form>		
													</div>
													<!-- 대댓글 입력폼 끝 -->												
			
	
												</li>
											<%
												}
											%>
											<!-- 댓글 반복문 끝 -->
				
			
												
											</ul>
											<!-- .PR15N01-review-wrap -->
											<div class="paging">
												<section id="pageList">
												<%if(reNowPage <= 1) {%>
														<input type="button" value="이전" style="background-color: #fff !important;">&nbsp;
												<%} else {%>
														<input type="button" value="이전" style="background-color: #fff !important;" onclick="location.href='CommDetail.co?num=<%=community_num%>&rePage=<%=reNowPage - 1 %>'">&nbsp;
												<%} %>
												
												<%for(int i = reStartPage; i <= reEndPage; i++) { 
														if(i == reNowPage) { %>
															<a href="" class="now"><%=i %></a>&nbsp;
														<%} else { %>
															<a href="CommDetail.co?num=<%=community_num%>&rePage=<%=i %>"><%=i %></a>&nbsp;
														<%} %>
												<%} %>
												
												<%if(reNowPage >= reMaxPage) { %>
														<input type="button" value="다음" style="background-color: #fff !important;">
												<%} else { %>
														<input type="button" value="다음" style="background-color: #fff !important;" onclick="location.href='CommDetail.co?num=<%=community_num%>&rePage=<%=reNowPage + 1 %>'">
												<%} %>
												</section>	
											</div>
											<!-- .paging -->
										</div>
									</div>
									<!-- #powerReview-->
									<p style="clear: both"></p>
	
								</div>
								<!-- width1260 -->
							</div>
							<!-- .page-body -->
						</div>						
						
						
		
						
						<!-- -----------------------------Comment----------------------------- -->
					</div>
				</div>
			</div>
		</div>
	</section>	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
function loginCheck() {
	alert("회원전용입니다.");
	return false;
}

$(document).ready(function(){
	  $(".comment_modify").click(function(){
		  $('.comm_add').removeClass("on");
		  var a = $(this).parents('li'); 
		  
		  if(a.find('.obj').hasClass("on")){
			  a.find('.obj').removeClass("on");
		  }else{
			  a.find('.obj').addClass("on"); 
		  }
		  	  
	  });
});

$(document).ready(function(){
	  $(".comment_add").click(function(){
		  $('.obj').removeClass("on");
		  var a = $(this).parents('li');
		  
		  if(a.find('.comm_add').hasClass("on")){
			  a.find('.comm_add').removeClass("on");
		  }else{
			  a.find('.comm_add').addClass("on"); 
		  }
		  
	  });
});

function button_event(){
    if (confirm("정말 삭제하시겠습니까?") == true){    //확인
        document.form.submit();
    }else{   //취소
        return false;
    }
}
</script>
	
<script>
$(function(){
		// 추천버튼 클릭시(추천 추가 또는 추천 제거)
		$("#bookmark").click(function(){
			$.ajax({
				url: "CommBook.co",
                type: "POST",
                data: {
                    num: "<%=article.getNum()%>",
                },
                success: function () {
			        bookmarkCount();
                },
			})
		})
		
		// 게시글 추천수
	    function bookmarkCount() {
			$.ajax({
				url: "CommBookCount.co",
                type: "POST",
                data: {
                    num: "<%=article.getNum()%>"
                },
                success: function (count) {
                	$(".bookmark_count").html(count);
                },
			})
	    };
	    bookmarkCount(); // 처음 시작했을 때 실행되도록 해당 함수 호출
})
</script>
	    
<jsp:include page="../inc/footer.jsp"/>