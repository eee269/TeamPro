<%@page import="java.text.DecimalFormat"%>
<%@page import="vo.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.CommBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<CommBean> articleList = (ArrayList<CommBean>)request.getAttribute("articleList");
	CommBean article = (CommBean)request.getAttribute("article");
	String member_id = (String)session.getAttribute("member_id");
	ArrayList<ProductBean> bestList = (ArrayList<ProductBean>)request.getAttribute("bestList");
	DecimalFormat priceFormat = new DecimalFormat("###,###");
	
	if(member_id == null){
		%>
		<script>
			alert("잘못된 접근입니다!");
			history.back();
		</script>
		<%
	}
	
	String nowPage = request.getParameter("page");
	if(nowPage==null){nowPage="1";} // 마이페이지 통해 들어올 경우 null 대신 1 값 줌
%>
<style>
.wrap-menu-desktop{z-index: 1050;}
.container-menu-desktop{z-index: 1000;}
</style>
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
				Write
			</span>
		</div>
	</div>
	<section class="bg0 p-t-52 p-b-20">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-9 p-b-80">
				<div class="p-r-45 p-r-0-lg">
					<!-- 글쓰기 폼 -->
					<div class="bbs-table-write">
					<form action="CommModifyPro.co" method="post" enctype="multipart/form-data">
	                	<input type="hidden" id="num" name="num" value="<%=article.getNum()%>">
	                	<input type="hidden" name="page" value="<%=request.getParameter("page") %>" />
	                	<table summary="">
                                    	<colgroup>
	                                        <col width="135" />
	                                        <col width="395" />
	                                        <col width="155" />
	                                        <col width="*" />
                                    	</colgroup>
                                    	<tbody>
                                        	<tr>
												<th><div>미리보기</div></th>
                                            	<td colspan="3">
                                                	<div style="text-align: center;">
                                                    	<img id="blah" src="upload/commUpload/<%=article.getImg() %>" alt="<%=article.getImg() %>" style="width: 300px; height:300px;" onerror="this.style.visibility='hidden'"/><br>
                                                	</div>
                                                    	<input type="file" name="img" id="imgInput" value="<%=article.getImg() %>" onchange="readURL(this);" required="required">
                                            	</td>
                                        	</tr>
                                            <tr>
                                            	<th><div>제목</div></th>
                                            	<td colspan="3">
                                                <div class="title">
													<input id='bw_input_subject' class="MS_input_txt input_style2" type='text' name='subject' value='<%=article.getSubject() %>' required="required"
													style="width:100%; height:100%;"/>
													<div class="title_select"></div>
                                                </div>
												</td>
                                        	</tr>
                                            <tr>
                                            	<th><div>비밀번호</div></th>
                                            	<td colspan="3">
                                                <div class="title">
													<input id='bw_input_subject' class="MS_input_txt input_style2" type="password" name='pass' value='' required="required"
													style="width:100%; height:100%;"/>
													<div class="title_select"></div>
                                                </div>
												</td>
                                        	</tr>
                                        	<tr>
	                                            <th><div>내용</div></th>
	                                            <td colspan="3" class="text_content">
                                                <div>
                                                	<textarea id ="summernote" name='content'  class="MS_input_txt" style='font-family:굴림체;' required="required"><%=article.getContent() %></textarea>
 												</div>
	                                            </td>
    	                                    </tr>
										</tbody>
									</table>
						<div class="flex-w flex-c-m m-tb-10 float-r" >
							<i class="cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
							<input type="submit" value="수정" class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn bg-none">
							<a href="CommList.co?page=<%=nowPage%>">
								<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn">
								<i class="cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
								글목록
								</div>
							</a>
						</div>
					</form>
					</div>
					<!-- 글쓰기 폼 -->
				</div>
			</div>
			<div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">
						<div class="size-304">
							<h4 class="mtext-112 cl2 p-b-33">
								베스트 게시물
							</h4>

							<ul>
								<%for(CommBean cb : articleList){ %>
									<li class="flex-w flex-t p-b-30">
										<a href="CommDetail.co?num=<%=cb.getNum() %>&page=<%=nowPage %>" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
											<img src="upload/commUpload/<%=cb.getImg() %>" alt="PRODUCT">
										</a>
											<div class="size-215 flex-col-t p-t-8">
												<a href="CommDetail.co?num=<%=cb.getNum() %>&page=<%=nowPage %>" class="stext-116 cl8 hov-cl1 trans-04">
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
								<%for(int i=0; i<(bestList.size() < 4 ? bestList.size() : 4); i++){
									String[] main = bestList.get(i).getMain_img().split("/");
								
								%>
									<li class="flex-w flex-t p-b-30">
										<a href="ProductDetail.po?basicCode=<%=bestList.get(i).getBasicCode() %>" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
											<img src="upload/productUploadImg/<%=main[0]%>" alt="PRODUCT">
										</a>
	
										<div class="size-215 flex-col-t p-t-8">
											<a href="ProductDetail.po?basicCode=<%=bestList.get(i).getBasicCode() %>" class="stext-116 cl8 hov-cl1 trans-04">
												<%=bestList.get(i).getName() %>
											</a>
											<span class="stext-116 cl6 p-t-20">
												<%=priceFormat.format(bestList.get(i).getPrice())%>
											</span>
										</div>
									</li>
								<%} %>
							</ul>
						</div>
					</div>
				</div>
		</div>
	</div>
</section>
<script>
function readURL(input) {
	var i3 = document.getElementById("blah").style.visibility="visible";

    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#blah').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
	<jsp:include page="../inc/footer.jsp" />
	<!-- WriteEditor -->
	<jsp:include page="../inc/writeEditor.jsp"/>
	<!-- WriteEditor -->
</body>
</html>