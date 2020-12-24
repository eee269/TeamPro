<%@page import="java.sql.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.CommReBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.CommBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
CommBean article = (CommBean) request.getAttribute("article");
ArrayList<CommBean> articleList = (ArrayList<CommBean>)request.getAttribute("articleList");
String nowPage = request.getParameter("page");

//==============댓글시작==============//
// 전달받은 request 객체로부터 데이터 가져오기
ArrayList<CommReBean> commentList = (ArrayList<CommReBean>) request.getAttribute("commentList");

// String id = "dodo";
String id = (String) session.getAttribute("member_id");
int community_num = Integer.parseInt(request.getParameter("num"));

//날짜 => 원하는 모양을 변경 문자열 결과값
SimpleDateFormat sdfYM = new SimpleDateFormat("MMM-yyyy", Locale.ENGLISH);
SimpleDateFormat sdfD = new SimpleDateFormat("dd");
SimpleDateFormat sdfYMD = new SimpleDateFormat("yy-MM-dd");

%>
<jsp:include page="../inc/header.jsp" />

<script type="text/javascript"
	src="fancybox/source/jquery.fancybox.js?v=2.1.5"></script>
<link rel="stylesheet" type="text/css"
	href="fancybox/source/jquery.fancybox.css?v=2.1.5" media="screen" />
<script type="text/javascript">
$(document).ready(function() {
    $('.fancybox').fancybox();
});
</script>

<link type="text/css" rel="stylesheet" href="css/common.css" />
<link type="text/css" rel="stylesheet" href="css/shopdetail.css" />
<link type="text/css" rel="stylesheet" href="css/menu_1.css" />
<link type="text/css" rel="stylesheet" href="css/power_review_custom.css" />
<!-- QuickMenu -->
<jsp:include page="../quickMenu.jsp" />


<!-- breadcrumb -->
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="Main.go" class="stext-109 cl8 hov-cl1 trans-04"> Home
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <a href="CommList.co" class="stext-109 cl8 hov-cl1 trans-04"> Community
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> <%=article.getSubject() %> </span>
	</div>
</div>
<!-- Content page -->
<section class="bg0 p-t-52 p-b-20">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-9 p-b-80">
				<div class="p-r-45 p-r-0-lg">
					<!-- 게시물 썸네일 -->
					<div class="how-pos5-parent">
						<img src="communityUpload/<%=article.getImg()%>" alt="<%=article.getImg()%>" onerror="this.src='images/icons/angry_face.png'">
						<div class="flex-col-c-m size-123 bg9 how-pos5">
							<span class="ltext-107 cl2 txt-center">
								 <%=sdfD.format(article.getDate()) %> 
							</span> 
							<span class="stext-109 cl3 txt-center"> 
								<%=sdfYM.format(article.getDate()) %> 
							</span>
						</div>
					</div>
					<!-- 게시물 썸네일 -->
					
					<div class="p-t-32">
						<span class="flex-w flex-m stext-111 cl2 p-b-19"> 
							<span class="m-b-30 m-r-8">
								<span class="cl4 size-214"><img src="upload/commUpload/<%=article.getM_img() %>" alt="<%=article.getM_img()%>"></span> 
							</span> 
							<span>
								<span class="cl4">By</span> <%=article.getUsername()%> 
								<span class="cl12 m-l-4 m-r-6">|</span>
							</span> 
							
							<span> 
								<%=sdfYMD.format(article.getDate()) %>
								<span class="cl12 m-l-4 m-r-6">|</span>
							</span> 
							<span>
								StreetStyle, Fashion, Couple 
								<span class="cl12 m-l-4 m-r-6">|</span>
							</span> 
							<span>
								댓글 갯수
								<span class="cl12 m-l-4 m-r-6">|</span>
							</span> 
							<span class = "bookmark_count">
								<span class="cl12 m-l-4 m-r-6">|</span>
							</span> 
						</span>
						<!-- 제목, 내용 -->
						<h4 class="ltext-109 cl2 p-b-28">
							<%=article.getSubject()%>
						</h4>
						<div class="stext-117 cl6 p-b-26 min-h-300px">
							<p><%=article.getContent()%></p>
						</div>
					</div>
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
							<div class="flex-w flex-c-m m-tb-10 float-r" >
					<%if(id!=null){
						if(id.equals(article.getMember_id())){ %>
								<a href="CommDeleteForm.co?num=<%=article.getNum()%>&page=<%=nowPage%>">
									<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn">
									<i class="cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
									삭제
									</div>
								</a>
								<a href="CommModifyForm.co?num=<%=article.getNum()%>&page=<%=nowPage%>">
									<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn">
									<i class="cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
									수정
									</div>
								</a>
					<%	}
					}%>
								<a href="CommList.co?page=<%=nowPage %>">
									<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn">
									<i class="cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
									글목록
									</div>
								</a>
								<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn" id="bookmark">
									<i class="cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
									북마크
								</div>
							</div>
					<!-- -----------------------------Comment----------------------------- -->
					<h2 class="comment_title">COMMENT</h2>
					<div id="productDetail" style="padding-top: 20px;">
						<div class="page-body">
							<div class="cboth">
								<div id="powerReview">
									<div id="listPowerReview" class="MS_power_review_list">


										<!-- 댓글등록 폼 시작 -->
										<form name="comm_re_form" id="comm_re_form" method="post"
											autocomplete="off" enctype="multipart/form-data">
											<div name="comm_re" id="comm_re">
												<input type="hidden" id="username" name="username"
													value="<%=id%>"> <input type="hidden"
													id="community_num" name="community_num"
													value="<%=community_num%>">
												<div id="writePowerReview">
													<div class="PR15N01-write">

														<div class="pr-txtbox">
															<textarea
																class="size-110 bor8 stext-102 cl2 p-tb-10"
																id="reply_contents" name="reply_contents"></textarea>
															<div class="thumb-wrap"></div>
														</div>
														<input type="file" name="reply_file" id="reply_file"
															class="trick file-attach">
													</div>
													<!-- .PR15N01-write -->
													<div class="PR15N01-recmd">

														<div class="cvr right">
															<%
																if (id != null) {
															%><input type="button" value="댓글등록"
																class="review_btn review_write">
															<%
																} else {
															%><input type="button" value="댓글등록"
																class="review_btn"
																onclick="return loginCheck()">
															<%
																}
															%>

														</div>
													</div>
													<!-- .PR15N01-recmd -->
												</div>
											</div>
											<!-- comm_re 끝 -->
										</form>
										<div class="cboth"></div>
										<br>
										<br>
										<br>
										<!-- 댓글등록 폼 끝 -->


										<ul class="arraymodeTab">
											<li class="arraymode popular active"><a href="#popular">답댓글많은순</a></li>|
											<li class="arraymode newest"><a href="#newest">최신순</a></li>
										</ul>


										<ul class="PR15N01-review-wrap"></ul>

										<!-- .PR15N01-review-wrap -->

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
					<div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">
<!-- 						<div> -->
<!-- 							<h4 class="mtext-112 cl2 p-b-33"> -->
<!-- 								Categories -->
<!-- 							</h4> -->

<!-- 							<ul> -->
<!-- 								<li class="bor18"> -->
<!-- 									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"> -->
<!-- 										Fashion -->
<!-- 									</a> -->
<!-- 								</li> -->

<!-- 								<li class="bor18"> -->
<!-- 									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"> -->
<!-- 										Beauty -->
<!-- 									</a> -->
<!-- 								</li> -->

<!-- 								<li class="bor18"> -->
<!-- 									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"> -->
<!-- 										Street Style -->
<!-- 									</a> -->
<!-- 								</li> -->

<!-- 								<li class="bor18"> -->
<!-- 									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"> -->
<!-- 										Life Style -->
<!-- 									</a> -->
<!-- 								</li> -->

<!-- 								<li class="bor18"> -->
<!-- 									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"> -->
<!-- 										DIY & Crafts -->
<!-- 									</a> -->
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 						</div> -->

						<div class="size-304">
							<h4 class="mtext-112 cl2 p-b-33">
								베스트 게시물
							</h4>

							<ul>
								<%for(CommBean cb : articleList){ %>
									<li class="flex-w flex-t p-b-30">
										<a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
											<img src="upload/commUpload/<%=cb.getImg() %>" alt="PRODUCT">
										</a>
	
										<div class="size-215 flex-col-t p-t-8">
											<a href="#" class="stext-116 cl8 hov-cl1 trans-04">
												<%=cb.getSubject() %>
											</a>
	
											<span class="stext-116 cl6 p-t-20">
												<%=cb.getUsername() %>
											</span>
										</div>
									</li>
								<%} %>
							</ul>
						</div>
						<div class="p-t-65 size-304">
							<h4 class="mtext-112 cl2 p-b-33">
								베스트 상품
							</h4>

							<ul>
								<%for(CommBean cb : articleList){ %>
									<li class="flex-w flex-t p-b-30">
										<a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
											<img src="upload/commUpload/<%=cb.getImg() %>" alt="PRODUCT">
										</a>
	
										<div class="size-215 flex-col-t p-t-8">
											<a href="#" class="stext-116 cl8 hov-cl1 trans-04">
												<%=cb.getSubject() %>
											</a>
	
											<span class="stext-116 cl6 p-t-20">
												<%=cb.getUsername() %>
											</span>
										</div>
									</li>
								<%} %>
							</ul>
						</div>
						<div class="p-t-50">
							<h4 class="mtext-112 cl2 p-b-27">
								Tags
							</h4>

							<div class="flex-w m-r--5">
								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Fashion
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Lifestyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Denim
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Streetstyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Crafts
								</a>
							</div>
						</div>
					</div>
				</div>
				</div>
			
		
	</div>
</section>
<div id="image_view_load"></div>
<a class="fancybox" href="#inline"></a>

<script>

//==================== 원댓글 로딩  ====================//
$(function(){
    function getCommReply(page){
    	var id = "<%=id%>";
	    var community_num = "<%=community_num%>";

	    if(!page){
    		var page = 1;
    	}  
	    
	    var limit = 5;
	    
	    if($('.active').text()=="답댓글많은순"){
    		var arraymode = 0;
    	}else{
    		var arraymode = 1;
    	}

		var allData = { "community_num": community_num,"page": page,"limit":limit,"arraymode":arraymode};
		$.ajax({
			url: "CommReListPro.co", // 요청 url
            type: "POST", // post 방식
            data: allData,
            success: function (json) { 
            	json = json.replace(/\n/gi,"\\r\\n");
            	var obj = JSON.parse(json);
            	var coReplyList = obj.coReplyList; 
            	var output = "";
//             	alert(obj.listCount);
            	for (var i = 0; i < coReplyList.length; i++) {
	                 for (var j = 0; j < coReplyList[i].length; j++) {
	                    var coReply = coReplyList[i][j];
	                    
	                    if(j == 0){
	                    	var core_del = coReply.del;
	                    }else if(j == 1){
	                    	var core_mem_id = coReply.mem_id;
	                    }else if(j == 2){
	                    	var core_username = coReply.username;
	                    	output += "<li id='power_review_block995511' class='power-review-list-box'><dl class='desc'>"	                    		                    	
	                    		if(core_del == "N"){
		                    		output += "<dt class='first'>작성자</dt><dd class='re_name'>"+core_mem_id+"</dd>";
			                    }else{
			                    	output += "<dt class='first'>작성자</dt><dd class='re_name'><span class='del'>-</span></dd>"
		 	                    }  				
	                    }else if(j == 3){
	                    	output += "<dt>작성일</dt><dd class='re_date'>"+moment(coReply.date).format("YY-MM-DD ")+"</dd></dl>";	
	                    }else if(j == 4){
	                    	var core_content = coReply.content;
	                    	if(core_del == "N"){
	                    		output += "<div class='content'><p class='content_p'>"+coReply.content;
		                    }else{
		                    	output += "<div class='content'><span class='del'>작성자에 의해 삭제된 댓글입니다.</span>"
	 	                    }
	                    }else if(j == 5){
	                    	var img = coReply.img;
	                    	var none = '"none"';
	                    	if(core_del == "N"){
		                    	if(img != ""){
			                    	output += "<br><br><input type='hidden' id='img' value='"+img+"'>"
			                    			+"<a class='image_view_load'>"
			                    			+"<img src='upload/commReUpload/"+img+"' onerror='this.style.display="+none+";'></a>";
			                    	}
			                    output += "</p><div class'ctr'></div></div><div style='clear: both;'></div>";
		                    }else{
	                    		output += "</p><div class'ctr'></div></div><div style='clear: both;'></div>";
	 	                    }             	
	                    }else if(j == 6){	
	                    	var core_num = coReply.num;
	                    	output += "<input type='hidden' class='comment_num' value='"+core_num+"'>";
	                    }else if(j == 7){		
	                    	output += "<input type='hidden' class='num' value='"+community_num+"'>";
	                    	output += "<div id='replyCount'></div>";
	                    	
	                    	output += "<input type='button' value='답댓글 열기' class='bu_gray_p recomment_load on'> ";
	                    	output += "<input type='button' value='답댓글 닫기' class='bu_gray_p recomment_close'> ";
	                    	output += "<input type='hidden' value='카운트' class='bu_gray_s recomment_count'> ";                    	
                    		if(core_del == "N"){
                    			if(id != "null"){
                    				output += "<input type='button' value='답댓글 쓰기' class='bu_gray_s comment_add'> ";
                    			}else{
                    				output += "<input type='button' value='답댓글 쓰기' class='bu_gray_s' onclick='return loginCheck()'>";
                    			}
		                    }                 		
                    		if(core_del == "N"){
		                    	if(core_username == id){
		                    	output += "<input type='button' value='수정' class='bu_gray_s comment_modify'> ";	
		                    	output += "<input type='button' value='삭제' class='bu_gray_s comment_delete'> ";
		                    	}
                    		}                  		
	                    	output += "<div id='obj' class='obj reply-wrap'>";
	                    	output += "<form name='comment' id='comment' action='CommReModifyPro.co' method='post' style='margin-top:0px !important; padding-top:0px !important;'>";
	                    	output += "	<input type='hidden' id='username' name='username' value='"+core_username+"'>";
	                    	output += "	<input type='hidden' id='community_num' name='community_num' value='"+community_num+"'>";
	                    	output += "	<input type='hidden' id='num' name='num' value='"+core_num+"'>";
	                    	output += "	<div class='wrt'>";
	                    	output += "		<textarea name='content' id='contents' >"+core_content+"</textarea>";
	                    	output += "		<input type='button' value='수정' class='btn_comment reReModify'>";
	                    	output += "	</div>";
	                    	output += "</form>	";
	                    	output += "</div>";
	                    	 	                    	             	
	                    	output += "<div id='comm_add' class='comm_add reply-wrap'>";
	                    	output += "<form name='comment' id='comment' action='CommReReWritePro.co' method='post'>";
	                    	output += "<input type='hidden' name='username' value='"+core_username+"' id='username'>";
	                    	output += "<input type='hidden' name='community_num' value='"+community_num+"' id='community_num'>";
	                    	output += "<input type='hidden' name='num' value='"+core_num+"' id='num'>";
	                    	output += "	<div class='wrt'>";
	                    	output += "		<textarea name='contents' id='contents'></textarea>";
	                    	output += "		<input type='button' value='입력' class='btn_comment reReWrite'>";
	                    	output += "	</div>";
	                    	output += "</form>	";	
	                    	output += "</div><div id='replyList'></div></li>";                    	
	                    } //if문	                      
		        		};//for문  	        		
            	};//for문
            	            	
    			var pageInfo = paging(obj.listCount, page, limit);
    			output+="<div class='paging'>";
        					if(page <= 1){
  				output+=			"<input type='button' value='이전' style='background-color: #fff !important;'> &nbsp;";
        					}else{
  				output+=			"<input type='button' value='이전'  style='background-color: #fff !important;' onclick='getReplyCall("+(page-1)+");'> &nbsp";
        					}
    						for(var i = pageInfo.startPage; i <= pageInfo.endPage; i++){
    							if(i == page){
  				output+=			"<a href='javascript:void(0);' class='now'>"+i+"</a>&nbsp;";
    							}else{
  				output+=			"<a href='javascript:getReplyCall("+i+");'>"+i+"</a>&nbsp;";
    							}
    						}	
        					if(page >= pageInfo.maxPage){
  				output+=			"<input type='button' value='다음' style='background-color: #fff !important;'> &nbsp;";
        					}else{
  				output+=			"<input type='button' value='다음'  style='background-color: #fff !important;' onclick='getReplyCall("+(page+1)+");'> &nbsp";//   				"<input type='button' value='다음'  style='background-color: #fff !important;' onclick='location.href='javascript:getReplyCall('"+(page+1)+"');''> &nbsp";
        					}
    						+"</div>";
     	
	              	$(".PR15N01-review-wrap").html(output);
	                $(".recomment_count").trigger('click');
            },
        	error: function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	      	}
    	})
    }
    getReplyCall = getCommReply;
    getCommReply(); // 해당 페이지 실행 시 해당 함수 호출
    
})	

	$(function(){		
	    //==================== 원댓글 쓰기 버튼 클릭 ====================//    
		    $(".review_write").click(function(){
			    	if($("#reply_contents").val().trim() === ""){
			    		alert("댓글을 입력하세요.");
			    		$("#reply_contents").val("").focus();
			    	}else{
			            var form = $('#comm_re_form')[0];
			            var data = new FormData(form);
			    		$.ajax({
			                type: "POST",
			    			enctype: 'multipart/form-data',
			    			url: "CommReWritePro.co",
			    			processData: false,
			                contentType: false,
			                data: data,
			                success: function () {
// 			                	alert("리뷰 등록 완료");
			                	$("#reply_contents").val("");
			                	$("#reply_file").val("");
			                	$('.popular').removeClass("active");
			      			  	$('.newest').addClass('active');
			                	getReplyCall();
			                },
			    			error: function(request,status,error){
			    		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    		       }
			    		}); // ajax 종료
			    	}; // else end
			    	
		    });	    
	    
	    //==================== 원댓글 수정 ====================//
 		$(document).on("click", ".reReModify", function () {
			 	var a = $(this).parents('li').find('#obj'); 
			 	var b = $(this).parents('li'); 
			 	
			 	var username = a.find('#username').val();
				var community_num = a.find('#community_num').val();
				var num = a.find('#num').val();
				var contents = a.find('#contents').val();
				var allData = { "username":username,"community_num":community_num,"num": num,"contents":contents};
	    		$.ajax({
	                type: "POST",
	    			url: "CommReModifyPro.co",
// 	    			processData: false,
// 	                contentType: false,
	                data: allData,
	                success: function () {
	                	getReplyCall();
	                },
	    			error: function(request,status,error){
	    		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    		       }
	    		})	    	
	    })
	    
	    //==================== 원댓글 삭제 ====================//
 		$(document).on("click", ".comment_delete", function () {			 	
	    	if (confirm("정말 삭제하시겠습니까?") == true){    //확인

				var a = $(this).parents('li'); 
			 	
				var community_num = a.find('#community_num').val();
				var num = a.find('#num').val();

				var allData = { "community_num":community_num,"num": num};
	    		$.ajax({
	                type: "POST",
	    			url: "CommReDeletePro.co",
// 	    			processData: false,
// 	                contentType: false,
	                data: allData,
	                success: function () {
	                	getReplyCall();
	                },
	    			error: function(request,status,error){
	    		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    		       }
	    		})    		
	    	}else{   //취소
	        	return false;
	    	}	
	    })
	    

	    
		//==================== 대댓글 보기  ====================//
		$(document).on("click", ".recomment_load", function () {
			      var id = "<%=id%>";
				  var a = $(this).parents('li'); 
				  var comment_num = a.find('.comment_num').val();
				  var num = a.find('.num').val();
		  
				  var allData = { "comment_num": comment_num,"num": num};
			  
				  $.ajax({
    				url: "CommReReListPro.co", // 요청 url
                	type: "POST", // post 방식
                	data: allData,
//	                async:false,
               		success: function (json) { 
                	json = json.replace(/\n/gi,"\\r\\n");

                	var obj = JSON.parse(json);                	
                	var replyList = obj.replyList; 
                	var output = ""; 
                	
                	for (var i = 0; i < replyList.length; i++) {
                	
   	                for (var j = 0; j < replyList[i].length; j++) {
    	                    var reply = replyList[i][j];
    	                    if(j == 0){
    	                    	var reply_del = reply.del;
    	                    }else if(j == 1){
    	                    	var reply_contents = reply.contents;
    	                    	if(reply_del=="N"){
    	                    		output += "<ul class='rerelist'><li class='content_re'>"+reply.contents+"</li>";
    	                    	}else{
    	                    		output += "<ul class='rerelist'><li class='content_re'><span class='del'>작성자에 의해 삭제된 댓글입니다.</span></li>";
    	                    	}
    	                    	
    	                    }else if(j == 2){
    	                    	var reply_mem_id = reply.mem_id;
   	                		}else if(j == 3){
    	                    	var re_name = reply.name;
    	                    	if(reply_del=="N"){
    	                    		output += "<li class='desc_re'><dl><dt>작성자</dt><dd>"+reply_mem_id+"</dd>";
    	                    	}else{
    	                    		output += "<li class='desc_re'><dl><dt>작성자</dt><dd><span class='del'>-</span></dd>";
    	                    	}
    	                    	
    	                    }else if(j == 4){    	    	                    	
    	                    	output += "<dt>작성일 </dt><dd>"+moment(reply.date).format("YY-MM-DD ")+"</dd></dl></li><div style='clear: both;'></div>";
    	                    }else if(j == 5){
	    	                   
    	                    	if(id!="null"){
									if(reply_del=="Y"){
										output += "</ul>"
	    	                    	}else if(id == re_name){			
	    	                    		output += "<li><input type='button' value='수정' class='bu_gray_s rerere_write_open'>"
	    	                    				   +"<input type='hidden' class='rere_num' value='"+reply.comm_re_num+"'>"
	    	                    				   +"<input type='button' value='삭제' class='bu_gray_s rere_delete'></li>";
	    	                    	
	    	                    		output += "<div id='re_wrt' class='re_wrt'><input type='hidden' name='username' id='username' value='"+re_name+"'>"
	    	                    		           +"<input type='hidden' name='community_num' id='community_num' value='"+num+"'>"
	    	                    		           +"<input type='hidden' name='num' id='num' value='"+reply.comm_re_num+"'>";
	    	                    		output += "<textarea name='rere_contents' id='rere_contents' class='rere_contents' autofocus='' onfocus='this.setSelectionRange(this.value.length,this.value.length);'>"
	    	                    		           +reply_contents+"</textarea><input type='button' value='수정' class='btn_comment rerereWrite'></div></ul>";
	    	                    	}else{
	    	                    		output += "</ul>";
	    	                    	}
	    	                    }else{
									output += "</ul>";   	                    		    	                    	
    	                    	}	
    	                    };
    	        		}; 	        	
                	};

					if(a.find('.recomment_close').hasClass("on")){
						a.find("#replyList").html(output);
	   	             	a.find('.recomment_load').removeClass("on");
	   	             	a.find('.recomment_close').addClass("on"); 
					}else{
						a.find("#replyList").html(output).hide().slideDown(800);
	   	             	a.find('.recomment_load').removeClass("on");
	   	             	a.find('.recomment_close').addClass("on");
					};


                },
            	error: function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		      	}
	    	})

		});
		
 			    
 		//==================== 댓글보기 닫기  ====================// 	
 		$(document).on("click", ".recomment_close", function () {
 				  var a = $(this).parents('li'); 
 				  a.find("#replyList").slideUp(800); 
	   	          a.find('.recomment_close').removeClass("on");
	   	          a.find('.recomment_load').addClass("on"); 

 		}); 
 		
 		
 		//==================== 대댓글 쓰기  ====================//
 		$(document).on("click", ".reReWrite", function () {
 			var id = "<%=id%>";
 			var a = $(this).parents('li').find('#comm_add'); 
		 	var b = $(this).parents('li'); 
 			
		 	if(a.find("#contents").val() == ""){
	    		alert("대댓글을 입력하세요.");
	    		a.find("#contents").focus();
	    	}else{	    		
			 	var username = id;
				var community_num = a.find('#community_num').val();
				var num = a.find('#num').val();
				var contents = a.find('#contents').val();
				var allData = { "username":username,"community_num":community_num,"num": num,"contents":contents};
	    		$.ajax({
	                type: "POST",
	    			url: "CommReReWritePro.co",
// 	    			processData: false,
// 	                contentType: false,
	                data: allData,
	                success: function () {
	                	a.find('#contents').val("");
	                	b.find(".recomment_load").trigger("click");
	                	b.find(".recomment_count").trigger("click");
	                },
	    			error: function(request,status,error){
	    		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    		       }
	    		})
	    	}	
	    }) 		
 		
	     		
 		//==================== 대댓글 수정  ====================//
 		$(document).on("click", ".rerereWrite", function () {
		 	var a = $(this) 
		 	var b = $(this).parents('li');
		 
		 	var username = a.siblings('#username').val();
			var community_num = a.siblings('#community_num').val();
			var num = a.siblings('#num').val();
			var rePage = a.siblings('#rePage').val();
			var contents = a.siblings('#rere_contents').val();
			
			var allData = { "username":username,"community_num":community_num,"num": num,"rePage": rePage,"contents":contents};

    		$.ajax({
                type: "POST",
    			url: "CommReModifyPro.co",
//	    			processData: false,
//	                contentType: false,
                data: allData,
                success: function () {
                	a.siblings('#rere_contents').val("");
                	b.find(".recomment_load").trigger("click");
                	b.find(".recomment_count").trigger("click");
                },
    			error: function(request,status,error){
    		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		       }
    		})
	    	
	    })
	    

 		//==================== 대댓글 삭제  ====================//
 		$(document).on("click", ".rere_delete", function () {

 		    if (confirm("정말 삭제하시겠습니까?") == true){    // 삭제 확인
 		  	
	 			var num = $(this).siblings('.rere_num').val();

	 			var community_num = <%=community_num%>;
				var rePage = <%=request.getParameter("rePage")%>;
				
				var allData = {"community_num": community_num,"num": num,"rePage":rePage};
				
				var b = $(this).parents("li");
		
				$.ajax({
		            type: "POST",
					url: "CommReDeletePro.co",
		// 			processData: false,
		//          contentType: false,
		            data: allData,
		            success: function () {
						b.find(".recomment_load").trigger("click");
		            },
					error: function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       }
				})
				
 		   	}else{   // 삭제 확인 안할경우
		        return false;
		    }
			
	 	}) // 삭제끝


	 	
	 	//==================== 대댓글 카운트 구하기  ====================//
 		$(document).on("click", ".recomment_count", function () {	
			var a = $(this).parents('li'); 
			var comment_num = a.find('.comment_num').val();
			var num = a.find('.num').val();
			  
			var allData = { "comment_num": comment_num,"num": num};
			
	    	$.ajax({
    			url: "CommReReCountProAction.co", // 요청 url
                type: "POST", // post 방식
                data: allData,
                success: function (reReCount) {
                	
          		  	if(reReCount==0){
        				  a.find('.recomment_load').removeClass("on");
        			}else{
        				  a.find("#replyCount").html("댓글수 : "+reReCount);
        			}
                	
                },
            error: function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		      	}
	    	})
 		});  


 		//==================== 상세 이미지 보기  ====================//
 		$(document).on("click", ".image_view_load", function () {				 
 				 var a = $(this).parents('li'); 
 				 var content = a.find('.content_p').text();
 				 var img = a.find('#img').val();
 				 var name = a.find('.re_name').text();
 				 var date = a.find('.re_date').text();
 				 
 				 var output = ""; 
 				 output += "<div id='inline' style='max-width:600px; display: none;'>"
 	 					  +"<div class='popup-img'><img src='upload/commReUpload/"+img+"' width='100%' height='auto'></div>"
 	 					  +"<div class='popup-txt' style='margin-top:20px;'>"+content+"</div>"
 	 					  +"<div class='popup-name-date' style='padding-top:10px; margin-top:30px; border-top:1px solid #ccc;'><b>작성자</b> : "+name+" | <b>작성일</b> : "+date+"</div></div>"
 				 
 				 $("#image_view_load").html(output); 
 				 $(".fancybox").trigger("click");

 		});
 			
	 	
 	}) //$(function()
 		    

	//==================== 페이징  ====================//
	function paging(listCount ,page ,limit){
		var listCount = listCount;
		var maxPage = Math.ceil(listCount / limit);
		var startPage = Math.floor(page / 10) * 10 +1;
		var endPage = startPage + 10 -1;
		
		if(endPage > maxPage){
			endPage = maxPage
		}
		
		return {
			maxPage : maxPage,
			startPage : startPage,
			endPage : endPage
		};
	};
	
	
	// 댓글많은순, 최신순 불러오기
	$(document).ready(function(){
		  $(document).on("click", ".popular", function () {	
			  $('.newest').removeClass("active");
			  $(this).addClass('active');
			  getReplyCall();	  
		  });
	});
	

	$(document).ready(function(){
		  $(document).on("click", ".newest", function () {	
			  $('.popular').removeClass("active");
			  $(this).addClass('active');
			  getReplyCall();	  
		  });
	});	
		
</script>


<script>



function loginCheck() {
	alert("회원전용입니다.");
	return false;
}

//==================== 원댓글 수정창 열기  ====================//
$(document).ready(function(){
	  $(document).on("click", ".comment_modify", function () {	
		  $('.comm_add').removeClass("on");
		  var a = $(this).parents('li'); 
		  
		  if(a.find('.obj').hasClass("on")){
			  a.find('.obj').removeClass("on");
		  }else{
			  a.find('.obj').addClass("on"); 
		  }
		  	  
	  });
});

//==================== 원댓글 댓글쓰기창 열기  ====================//
$(document).ready(function(){
	$(document).on("click", ".comment_add", function () {	  
		  $('.obj').removeClass("on");
		  var a = $(this).parents('li');
		  
		  if(a.find('.comm_add').hasClass("on")){
			  a.find('.comm_add').removeClass("on");
		  }else{
			  a.find('.comm_add').addClass("on"); 
		  }
		  
	  });
});

//==================== 대댓글 수정창 열기  ====================//
$(document).on("click", ".rerere_write_open", function () {
	
 		 var a = $(this).parents('li');

 		 if(a.siblings('.re_wrt').hasClass("on")){
			  a.siblings('.re_wrt').removeClass("on");
 		 }else{
			  a.siblings('.re_wrt').addClass("on"); 
			  a.siblings('.re_wrt').find('#rere_contents').focus(); 
 		 }	  
})


 
	
</script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<script>
$(function(){
		// 북마크버튼 클릭시(북마크 추가 또는 북마크 제거)
		$("#bookmark").click(function(){
			var id = '<%=id%>';
			if(id=='null'){
				if(!confirm("로그인을 하셔야 이용 가능합니다. 로그인을 하시겠습니까?")){
					return;
				}else{
					location.href='MemberLoginForm.mo';
				}
			}else{
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
			}
		})
		
		// 게시글 북마크 수
	    function bookmarkCount() {
			var articleNum = '<%=article.getNum()%>';
			$.ajax({
				url: "CommBookCount.co",
                type: "POST",
                data: {
                    num: articleNum
				},
				success : function(count) {
					$(".bookmark_count").html(count);
				},
			})
		};
		// 페이지 첫 로딩 시 호출
		bookmarkCount();
	})
</script>

<jsp:include page="../inc/footer.jsp" />
</body>
</html>