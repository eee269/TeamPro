<%@page import="vo.MemberBean"%>
<%@page import="vo.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String basicCode = request.getParameter("basicCode");
	String member_id = (String)session.getAttribute("member_id");
	ProductBean productBean = (ProductBean)request.getAttribute("productBean");
	
%>
<style>
	.page-body{
		width: 80%;
		margin: 0 auto;
	}
	.width1260 {width:1260px;margin:0 auto;}
	.sub_top_ban {width:100%; height:270px;  line-height:270px;}
	.sub_top_ban.brand {background:#e2e2e0 url('images/sub_top_ban_cs.jpg') center center no-repeat;}
	.sub_top_text {font-family:Roboto Condensed,Nanum Gothic,sans-serif; font-size:28px; letter-spacing:7px; text-align:right;color:#000;}
</style>	
<jsp:include page="../inc/header.jsp" />

<script type="text/javascript" src="http://oryany.co.kr//wcs.naver.net/wcslog.js"></script>

<!-- 게시판 CSS -->
<link type="text/css" rel="stylesheet" href="http://oryany.co.kr/shopimages/nasign/template/work/33865/board_write.nasign.css?t=202005111439" />
<link href="https://fonts.googleapis.com/css?family=Roboto:200,300,400,500,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700&display=swap" rel="stylesheet">
<!-- 게시판 CSS -->

<div id="wrap">
    <div id="contentWrapper">
	<!-- CS CENTER 상단공통배너 : 가상태그 -->
	<!-- CS CENTER 상단 -->
	<div class="cboth sub_top_ban brand">
		<div class="width1260 sub_top_text">CS CENTER</div>
	</div>
        <div id="contentWrap">
             <div id="content">
                <div id="bbsData">
                    <div class="page-body">
                        <!-- //게시판 리스트 -->
                        <div class="bbs-tit">
                            <h3>Q &#38; A</h3>
                        </div>
						<dl class="prd-tinfo">
                            <dt>
                                <img src="upload/prodQnaUpload/<%=productBean.getMain_img() %>" />
                            </dt>
                            <dd>
                                <ul>
                                    <li class="name"><span class="tit">상품명 :</span> <a href="ProductDetail.po?basicCode=<%=basicCode%>"><%=productBean.getName()%></a> <span class='MK-product-icons'></span></li>
                                    <li class="price"><span class="tit">상품가 :</span> <%=productBean.getPrice() %></li>
                                </ul>
                            </dd>
                        </dl>
						<div class="bbs-table-write">
							<form name='form1' action="ProdQnaWritePro.po" method='post' enctype="multipart/form-data" style="position:relative;" autocomplete="off">
								<input type='hidden' name='basicCode' value="<%=basicCode %>" />
								<input type="hidden" name="page" value="">
								<fieldset>
                                	<legend>일반게시판 쓰기</legend>
                                	<table summary="">
                                    	<colgroup>
	                                        <col width="135" />
	                                        <col width="395" />
	                                        <col width="155" />
	                                        <col width="*" />
                                    	</colgroup>
                                    	<tbody>
                                        	<tr>
	                                            <th><div>이름</div></th>
	                                            <td><div><input id='bw_input_writer' type='text' name='qna_name'  class="MS_input_txt input_style1" 
	                                            <%if(member_id!=null){
	                                            	MemberBean memberBean = (MemberBean)request.getAttribute("memberBean");%>
	                                            	value="<%=memberBean.getUsername() %>" readonly="readonly" style="background-color: #BDBDBD;"
	                                            <%} %>
	                                             /></div></td>
	                                            <th><div>비밀번호</div></th>
	                                            <td>
                                                	<div>
                                                    	<input id='bw_input_passwd' type='password' name='qna_pass'  class="MS_input_txt input_style"  />                                                    
                                                    	<font color="red">자동 잠금 기능</font>                                                                                                    
                                                   	</div>
                                            	</td>
                                        	</tr>
                                            <tr>
                                            	<th><div>제목</div></th>
                                            	<td colspan="3">
                                                <div class="title">
													<input id='bw_input_subject'   class="MS_input_txt input_style2" type='text' name='qna_subject' value='' />
													<div class="title_select"></div>
                                                </div>
												</td>
                                        	</tr>
<!--                                             <tr> -->
<!--                                             	<th><div>주문자</div></th> -->
<!--                                             	<td colspan="3"> -->
<!--                                                 <div class="title"> -->
<!-- 													<input id='bw_input_subject'   class="MS_input_txt input_style2" type='text' name='qna_customer' value='' /> -->
<!-- 													<div class="title_select"></div> -->
<!--                                                 </div> -->
<!-- 												</td> -->
<!--                                         	</tr> -->
<!--                                             <tr> -->
<!--                                             	<th><div>주문번호</div></th> -->
<!--                                             	<td colspan="3"> -->
<!--                                                 <div class="title"> -->
<!-- 													<input id='bw_input_subject'   class="MS_input_txt input_style2" type='text' name='qna_orderNum' value='' /> -->
<!-- 													<div class="title_select"></div> -->
<!--                                                 </div> -->
<!-- 												</td> -->
<!--                                         	</tr> -->
                                        	<tr>
	                                            <th><div>내용</div></th>
	                                            <td colspan="3" class="text_content">
                                                <div>
                                                	<textarea id='MS_text_content' name='qna_content'  onfocus='clear_content()'  class="MS_input_txt" style='font-family:굴림체;' ></textarea>
 												</div>
	                                            </td>
    	                                    </tr>
         	                               <tr>
												<th><div>파일</div></th>
                                            	<td colspan="3">
                                                	<div>
                                                    	<input id='bw_input_file' type='file'  class="MS_input_txt input_style2" name="qna_file" />
                                                	</div>
                                            	</td>
                                        	</tr>
										</tbody>
									</table>
								</fieldset>
                           		<!-- //게시판 글쓰기 -->
                            	<!-- 하단 버튼 -->
                            	<dl class="bbs-link bbs-link-btm">
                                	<dt></dt>
                                	<dd>
<!-- 	                                    <a href="#" class="CSSbuttonWhite" onclick="javascript:fileCheck.submit()">등록하기</a> -->
										<input type="submit" value="전송하기">
	                                    <a href="ProductDetail.po?basicCode=<%=basicCode %>" class="CSSbuttonWhite">목록보기</a>
	                                </dd>
	                            </dl>
	                            <!-- //하단 버튼 -->
							</form>
						</div>
                    </div><!-- .page-body -->
                </div><!-- #bbsData -->
            </div><!-- #content -->
        </div><!-- #contentWrap -->
    </div><!-- #contentWrapper-->
    <hr />
</div>
<script type="text/javascript">
function doCenter(_parent, _target, _obj) {

    _set_left = (_parent.offsetWidth - _obj.offsetWidth) / 2 ; 
    if (_set_left > 0 ) {
        _obj.style.left = _set_left  + 'px';
    }

    _set_top = (_parent.offsetHeight - _obj.offsetHeight) / 2 ;
    if (_set_top > 0 ) {
        _obj.style.top = _set_top + 'px';
    }

}var auth_check_flag = false;
function auth_check() {
    var authid = document.getElementById('authid').value;
    var authtext = document.getElementById('authtext').value;
    new Ajax.Request("/shop/auth_check.ajax.html", {
        method: 'post',
        parameters: 'auth_type=auth_check&authid='+ authid + '&authtext=' + authtext,
        onSuccess: function(res) {
        var result = res.responseText;
        result = eval('(' + result + ')');
            if (result.result) {
            // 인증 성공일 경우 
                auth_check_flag = true;
                document.getElementById('authid').value = result.data.authid;
                document.getElementById('authtext').value = result.data.authtext;
                send();
            } else {
                alert(result.message);
                showdiv('visible');
            }
            setTimeout(function() {res.responseText.evalScripts()}, 10);
        }
    });
}

</script>
<div id="wp_tg_cts" style="display:none;"></div>
<script>
var inputs = document.getElementsByTagName("input");
for (x=0; x<=inputs.length; x++) {
    if (inputs[x]) {
        myname = inputs[x].getAttribute("name");
        if(myname == "ssl") {
            inputs[x].checked = 'checked';
        }
    }
}
(function($) {
    $(document).ready(function() {
        jQuery(':checkbox[name=ssl]').click(function() {
            this.checked = true;
        });
    });
})(jQuery);
</script>
<jsp:include page="../inc/footer.jsp" />