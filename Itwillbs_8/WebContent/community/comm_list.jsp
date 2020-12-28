<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.CommBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	.sub_top_ban {width:100%; height:270px;  line-height:270px;}
	.sub_top_ban.brand {background:#e2e2e0 url('images/sub_top_ban_comm.jpg') center center no-repeat;}
	.sub_top_text {font-family:Roboto Condensed,Nanum Gothic,sans-serif; font-size:28px; letter-spacing:7px; text-align:right;color:#000;}
</style>	
	
<%
	ArrayList<CommBean> articleList = (ArrayList<CommBean>)request.getAttribute("articleList");
	String member_id = (String)session.getAttribute("member_id");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int listCount = pageInfo.getListCount();
	
	SimpleDateFormat sdfYMD = new SimpleDateFormat("yy-MM-dd");
%>
<jsp:include page="/inc/header.jsp"/>
<!-- QuickMenu -->
<jsp:include page="/quickMenu.jsp" />
<!-- Title page -->
<div class="cboth sub_top_ban brand">
	<div class="width1260 sub_top_text">CS CENTER</div>
</div>
<!-- Product -->
	<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 " id="new" onclick="javascript:commSort('new');">
						최신순
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" id="readcount" onclick="javascript:commSort('readcount');">
						조회순
					</button>
					
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" id="bookmark" onclick="javascript:commSort('bookmark');">
						북마크순
					</button>

				</div>

				<div class="flex-w flex-c-m m-tb-10" >
					<div id="commWrite">
						<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn">
							<i class="cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
							글쓰기
						</div>
					</div>

					<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
							검색
					</div>
				</div>
				
				<!-- Search product -->
				<div class="dis-none panel-search w-full p-t-10 p-b-15">
					<form action="CommList.co" method="post" id="fr">
						<div class="bor8 dis-flex p-l-15">
<!-- 							<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04" onclick="javascript:submit()"> -->
							<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04" onclick="commSubmit()">
								<i class="zmdi zmdi-search"></i>
							</button>
							<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" required="required">
						</div>	
					</form>
				</div>
			</div>

<!-- ---------------------------Content page--------------------------- -->
			<div class="row isotope-grid">
				<%for(int i  = 0 ; i < articleList.size(); i++) { %>
					<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0">
								<a href="CommDetail.co?num=<%=articleList.get(i).getNum() %>&page=<%=nowPage %>" class="hov-img0 how-pos5-parent">
									<img src="upload/commUpload/<%=articleList.get(i).getImg() %>" alt="IMG-BLOG" onerror="this.style.display='none'"/>
								</a>
							</div>
							<div id="how-pos6" class="bookimg<%=articleList.get(i).getNum() %>" onclick="checkBook(<%=articleList.get(i).getNum() %>)">
								<img src="images/icons/bookmark_before.png" onerror="this.style.display='none'"/>
							</div>
	
							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l ">
									<a href="CommDetail.co?num=<%=articleList.get(i).getNum() %>&page=<%=nowPage %>"  class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
										<%=articleList.get(i).getSubject() %>
									</a>
									<div class="stext-105 cl3 w-full">
										<span>
											<%=articleList.get(i).getUsername() %>
										</span>
										<span class="float-r">
											<%=sdfYMD.format(articleList.get(i).getDate()) %>
										</span>
									</div>
									<div class="stext-105 cl3">
										<span>조회수 <%=articleList.get(i).getReadCount()%> &#183;</span>
										<span class="bookCount<%=articleList.get(i).getNum()%>">북마크 <%=articleList.get(i).getBookCount()%></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				<%} %>	
			</div>
			<!-- paging -->
			<div class="flex-w w-full p-t-10 m-lr--7 flex-c">
			<%if(nowPage <= 1) {%>
					<a href="javascript:void(0);" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination">&lt; <!-- '<' 의 코드--></a>
				<%}else {%>
					<a href="CommList.co?page=<%=nowPage - 1 %>" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination">&lt;</a>
				<%} %>
				<%for(int i = startPage; i <= endPage; i++) { 
					if(i == nowPage) { %>
						<a href="javascript:void(0);" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"><%=i %></a>
					<%}else { %>
						<a href="CommList.co?page=<%=i %>" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination2"><%=i %></a>
					<%} %>
				<%} %>
				<%if(nowPage >= maxPage) { %>
					<a href="javascript:void(0);" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination">&gt; <!-- '>' 의 코드 --></a>
				<%}else { %>
					<a href="CommList.co?page=<%=nowPage + 1 %>" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination">&gt;</a>
				<%}%>
			<!-- Pagination -->
			</div>
		</div>
	</div>
<!-- ---------------------------Content page--------------------------- -->

<jsp:include page="/inc/footer.jsp" />
<script>
		// 북마크버튼 클릭시(북마크 추가 또는 북마크 제거)
		function checkBook(num){
			var member_id = '<%=member_id%>';
			if(member_id=='null'){
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
	                    num: num,
	                },
	                success: function () {
	                	var path = $('.bookimg'+num).children("img");
	                	path.attr("src",function(index,attr){
	                		if(attr.match('before')){
	                			swal("٩(ˊᗜˋ*)و" ,"게시글이 북마크에 추가됬습니다!", "success");
	                			return attr.replace("before","after");
	                		}else{
	                			swal("(｡•́︿•̀｡)","게시글이 북마크에서 삭제됬습니다!", "success");
	                			return attr.replace("after","before");
	                		}
	                	});
				        bookmarkCount(num);
	                },
				});
			}
		}
		// 게시글 북마크 수
	    function bookmarkCount(num) {
			var articleNum = num;
			$.ajax({
				url: "CommBookCount.co",
                type: "POST",
                data: {
                    num: articleNum
				},
				success : function(json) {
					var img = "images/icons/bookmark_after.png";
					var jsonP = JSON.parse(json);
					var book = "북마크 "+jsonP.total;
					if(!num){
						for(key in jsonP.list){
							var num = jsonP.list[key][key];
							$(".bookimg"+num).children().attr("src",img);
						}
					}
					$(".bookCount"+articleNum).html(book);
				},
			})
		};
		bookmarkCount();
</script>
<script type="text/javascript">
	// 비회원 글쓰기 클릭 시 로그인 유도 
	$(function(){
		$('#commWrite').click(function(){
			var member_id = "<%=member_id%>";
			if(member_id == 'null'){
				if(!confirm("로그인을 하셔야 이용 가능합니다. 로그인을 하시겠습니까?")){
					return false;
				}else{
					location.href='MemberLoginForm.mo';
				}
			}else{
				location.href='CommWriteForm.co';
			}
		});
	});
	// 게시글 검색
	function commSubmit(){
		$('#fr').submit();
		window.location = window.location.pathname;
	}
	// 게시글 정렬
	function commSort(sort){
		location.href="CommList.co?sort="+sort;
	}
	
</script>
<script>
	function nowSort(){
		// 최신순, 조회순, 추천순 탭에 이벤트 처리
		var sort = '<%=request.getParameter("sort") %>'
		if(sort === 'null'){
			sort = "new";
		}
		$('#'+sort).addClass('how-active1');
	}
	nowSort();
</script>
</body>
</html>