<%@page import="vo.ProdQnaBean"%>
<%@page import="vo.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String basicCode = request.getParameter("basicCode");
	String member_id = (String)session.getAttribute("member_id");
	ProductBean productBean = (ProductBean)request.getAttribute("productBean");
	ProdQnaBean prodQnaBean = (ProdQnaBean)request.getAttribute("prodQnaBean");
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
<link type ="text/css" href="css/common.css" rel="stylesheet">
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
                                <img src="upload/prodQnaUpload/<%=productBean.getMain_img() %>" onerror="this.src='images/icons/angry_face.png'" />
                            </dt>
                            <dd>
                                <ul>
                                    <li class="name"><span class="tit">상품명 :</span> <a href="ProductDetail.po?basicCode=<%=basicCode%>"><%=productBean.getName()%></a> <span class='MK-product-icons'></span></li>
                                    <li class="price"><span class="tit">상품가 :</span> <%=productBean.getPrice() %></li>
                                </ul>
                            </dd>
                        </dl>
						<div class="bbs-table-write">
							<form name='form1' action="ProdQnaReplyPro.po" method='post' style="position:relative;" autocomplete="off">
								<input type='hidden' name='basicCode' value="<%=basicCode %>" />
								<input type="hidden" name="page" value="">
								<input type="hidden" name="qna_num" value="<%=prodQnaBean.getQna_num()%>">
								<input type="hidden" name="qna_re_ref" value="<%=prodQnaBean.getQna_re_ref()%>">
								<input type="hidden" name="qna_re_seq" value="<%=prodQnaBean.getQna_re_seq()%>">
								<input type="hidden" name="qna_re_lev" value="<%=prodQnaBean.getQna_re_lev()%>">
								<fieldset>
								<legend>일반게시판 답글</legend>
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
	                                            <%if(member_id!=null){%>
	                                            	value="<%=prodQnaBean.getUsername() %>" readonly="readonly" style="background-color: #BDBDBD;"
	                                            <%} %>
	                                             /></div></td>
	                                            <th><div>비밀번호</div></th>
	                                            <td>
                                                	<div>
                                                    	<input id='bw_input_passwd' type='password' name='qna_pass'  class="MS_input_txt input_style"  />                                                    
<!--                                                     	<font color="red">자동 잠금 기능</font>                                                                                                     -->
                                                   	</div>
                                            	</td>
                                        	</tr>
                                            <tr>
                                            	<th><div>제목</div></th>
                                            	<td colspan="3">
                                                <div class="title">
													<input id='bw_input_subject'   class="MS_input_txt input_style2" type='text' name='qna_subject' value='<%=prodQnaBean.getQna_subject() %>' />
													<div class="title_select"></div>
                                                </div>
												</td>
                                        	</tr>
                                        	<tr>
	                                            <th><div>내용</div></th>
	                                            <td colspan="3" class="text_content">
                                                <div>
                                                	<textarea id='MS_text_content' name='qna_content'  onfocus='clear_content()'  class="MS_input_txt" style='font-family:굴림체;' ><%=prodQnaBean.getQna_content() %></textarea>
 												</div>
	                                            </td>
    	                                    </tr>
										</tbody>
									</table>
								</fieldset>
                           		<!-- //게시판 글쓰기 -->
                            	<!-- 하단 버튼 -->
                            	<div class="flex-w flex-c-m m-tb-10 float-r" >
									<a href="javascript:submit">
										<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn">
										<i class="cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
											글저장
										</div>
									</a>
									<a href="location.href='ProductDetail.po?basicCode=<%=basicCode %>'">
										<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn">
										<i class="cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
											글목록
										</div>
									</a>
								</div>
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