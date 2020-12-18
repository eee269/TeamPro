<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.CommReBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.CommBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	CommBean article = (CommBean) request.getAttribute("article");
String nowPage = request.getParameter("page");

//==============댓글시작==============//
// 전달받은 request 객체로부터 데이터 가져오기
ArrayList<CommReBean> commentList = (ArrayList<CommReBean>) request.getAttribute("commentList");

// String id = "dodo";
String id = (String) session.getAttribute("member_id");
int community_num = Integer.parseInt(request.getParameter("num"));

//날짜 => 원하는 모양을 변경 문자열 결과값
SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
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
<link type="text/css" rel="stylesheet" href="css/header.css" />
<link type="text/css" rel="stylesheet" href="css/menu_1.css" />
<link type="text/css" rel="stylesheet"
	href="css/power_review_custom.css" />
<!-- QuickMenu -->
<jsp:include page="../quickMenu.jsp" />
<style>
.rerelist {
	background-color: #e9e9e9;
	padding: 15px !important;
	margin-top: 10px !important;
	margin-left: 30px !important;
	border-radius: 15px;
}

.desc_re {
	/* position: absolute; */
	width: 160px;
	float: right;
}

.content_re {
	/* clear: both; */
	overflow: hidden;
	/* margin: 0px 220px 0 0; */
	color: #89888e;
	line-height: 1.5;
	word-wrap: break-word;
	/*     min-height: 75px; */
	float: left;
	width: 400px;
}

.desc_re dt:first-child {
	border-top: 0;
}

.desc_re dt {
	padding: 0px 0 0 5px;
	color: #a8a8a8;
	border-top: 1px solid #dadada;
}

.desc_re dd {
	padding: 0 0 5px 5px !important;
	color: #000;
}

/*대댓글*/
#re_wrt {
	display: none;
	margin-top: 10px;
}

#re_wrt.on {
	display: block;
}

#re_wrt #rere_contents {
	margin-left: 12px;
}

#re_wrt .btn_comment {
	/*     position: absolute; */
	/*     top: 0; */
	/*     right: 0; */
	/*     height: 72px; */
	line-height: 50px;
	padding: 0 45px;
	background: #f3f3f3;
	border-left: 1px solid #dadada;
	color: #818391;
	font-weight: bold;
	letter-spacing: -1px; *:;
	height: 50px;
}

#powerReview .PR15N01-review-wrap>li .desc dt {
	padding-top: 5px;
}

ul.arraymodeTab>.active a{
font-weight: bold !important;
}
</style>

<!-- breadcrumb -->
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04"> Home
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <a href="blog.html" class="stext-109 cl8 hov-cl1 trans-04"> Blog
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> 8 Inspiring Ways to Wear Dresses
			in the Winter </span>
	</div>
</div>
<!-- Content page -->
<section class="bg0 p-t-52 p-b-20">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-9 p-b-80">
				<div class="p-r-45 p-r-0-lg">
					<div class="wrap-pic-w how-pos5-parent">
						<img src="communityUpload/<%=article.getImg()%>"
							alt="<%=article.getImg()%>">
						<div class="flex-col-c-m size-123 bg9 how-pos5">
							<span class="ltext-107 cl2 txt-center"> 22 </span> <span
								class="stext-109 cl3 txt-center"> Jan 2018 </span>
						</div>
					</div>
					<div class="p-t-32">
						<span class="flex-w flex-m stext-111 cl2 p-b-19"> <span>
								<span class="cl4">By</span> <%=article.getUsername()%> <span
								class="cl12 m-l-4 m-r-6">|</span>
						</span> <span> <%=article.getDate()%> <span
								class="cl12 m-l-4 m-r-6">|</span>
						</span> <span> 태그 자리 <span class="cl12 m-l-4 m-r-6">|</span>
						</span> <span> 댓글 갯수 </span> <span class="bookmark_count"> 북마크 갯수
						</span>
						</span>

						<h4 class="ltext-109 cl2 p-b-28">
							<%=article.getSubject()%>
						</h4>
					</div>
					<p class="stext-117 cl6 p-b-26">
						<%=article.getContent()%>
					</p>
					<div class="flex-w flex-t p-t-16">
						<span class="size-216 stext-116 cl8 p-t-4"> Tags </span>

						<div class="flex-w size-217">
							<a href="#"
								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
								Streetstyle </a> <a href="#"
								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
								Crafts </a>
						</div>
					</div>
					<br> <input type="button"
						class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04"
						value="삭제"
						onclick="location.href='CommDeleteForm.co?num=<%=article.getNum()%>&page=<%=nowPage%>'">
					<input type="button"
						class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04"
						value="수정"
						onclick="location.href='CommModifyForm.co?num=<%=article.getNum()%>&page=<%=nowPage%>'">
					<input type="button"
						class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04"
						value="북마크" id="bookmark"> <br>



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
																class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10"
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
																class="lnk-review review_write">
															<%
																} else {
															%><input type="button" value="댓글등록"
																class="lnk-review review_write"
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
											<li class="arraymode popular active"><a href="#popular">답댓글많은순</a></li>
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
	                    	var core_username = coReply.username;
	                    	output += "<li id='power_review_block995511' class='power-review-list-box'><dl class='desc'><dt class='first'>작성자</dt><dd>"+core_username+"</dd>";
	                    }else if(j == 1){
	                    	output += "<dt>작성일</dt><dd>"+moment(coReply.date).format("YY-MM-DD ")+"</dd></dl>";
								
	                    }else if(j == 2){
	                    	var core_content = coReply.content;
	                    	output += "<div class='content'><p class='content_p'>"+coReply.content;
	                  
	                    }else if(j == 3){
	                    	var img = coReply.img;
	                    	if(img != ""){
	                    	output += "<br><br><input type='hidden' id='img' value='"+img+"'><a class='image_view_load'><img src='upload/commReUpload/"+img+"' width='150px' style='padding-bottom:10px;'></a>";
	                    	}
	                    	output += "</p><div class'ctr'></div></div><div style='clear: both;'></div>";
	                    }else if(j == 4){	
	                    	var core_num = coReply.num;
	                    	output += "<input type='hidden' class='comment_num' value='"+core_num+"'>";
	                    }else if(j == 5){		
	                    	output += "<input type='hidden' class='num' value='"+community_num+"'>";
	                    	output += "<div id='replyCount'></div>";
	                    	
	                    	output += "<input type='button' value='답댓글 열기' class='bu_gray_p recomment_load on'> ";
	                    	output += "<input type='button' value='답댓글 닫기' class='bu_gray_p recomment_close'> ";
	                    	output += "<input type='hidden' value='카운트' class='bu_gray_s recomment_count'> ";
	                    	
	                    	if(core_username != "<span class='del'>-</span>"){
	                    	output += "<input type='button' value='답댓글 쓰기' class='bu_gray_s comment_add'> ";
	                    	}
	                    	
	                    	if(core_username == id){
	                    	output += "<input type='button' value='수정' class='bu_gray_s comment_modify'> ";	
	                    	output += "<input type='button' value='삭제' class='bu_gray_s comment_delete'> ";
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
			    		alert("리뷰를 입력하세요.");
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
    	                    	var reply_contents = reply.contents;
    	                    	output += "<ul class='rerelist'><li class='content_re'>"+reply.contents+"</li>";
    	                    }else if(j == 1){
    	                    	var re_name = reply.name;
    	                    	output += "<li class='desc_re'><dl><dt>작성자</dt><dd>"+reply.name+"</dd>";
    	                    }else if(j == 2){
    	                    	
    	                    	
    	                    	output += "<dt>작성일 </dt><dd>"+moment(reply.date).format("YY-MM-DD ")+"</dd></dl></li><div style='clear: both;'></div>";
    	                    }else if(j == 3){
	    	                   
    	                    	if(id!=null){
									if(re_name != id){
									output += "</ul>"
	    	                    	}else{
									
	    	                    	output += "<li><input type='button' value='수정' class='bu_gray_s rerere_write_open'> <input type='hidden' class='rere_num' value='"+reply.comm_re_num+"'><input type='button' value='삭제' class='bu_gray_s rere_delete'></li>";
	    	                    	
	    	                    	output += "<div id='re_wrt' class='re_wrt'><input type='hidden' name='username' id='username' value='"+re_name+"'><input type='hidden' name='community_num' id='community_num' value='"+num+"'><input type='hidden' name='num' id='num' value='"+reply.comm_re_num+"'>";
	    	                    	output += "<textarea name='rere_contents' id='rere_contents' class='rere_contents' autofocus='' onfocus='this.setSelectionRange(this.value.length,this.value.length);'>"+reply_contents+"</textarea><input type='button' value='수정' class='btn_comment rerereWrite'></div></ul>";
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
//  		$(".reReWrite").click(function(){
			 	var a = $(this).parents('li').find('#comm_add'); 
			 	var b = $(this).parents('li'); 
			 	
			 	var username = a.find('#username').val();
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
 				 var output = ""; 
 				 output += "<DIV id='inline' style='max-width:600px; display: none;'><img src='upload/commReUpload/"+img+"' width='100%' height='auto'><br><br>"+content+"</DIV>"; 
 				 
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
                    num: "<%=article.getNum()%>
	"
				},
				success : function(count) {
					$(".bookmark_count").html(count);
				},
			})
		}
		;

	})
</script>

<jsp:include page="../inc/footer.jsp" />
</body>
</html>