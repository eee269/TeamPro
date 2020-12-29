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
	.sub_top_ban {width:100%; height:270px;  line-height:270px;}
	.sub_top_ban.brand {background:#e2e2e0 url('images/sub_top_ban_cs.jpg') center center no-repeat;}
	.sub_top_text {font-family:Roboto Condensed,Nanum Gothic,sans-serif; font-size:28px; letter-spacing:7px; text-align:right;color:#000;}
</style>	
<jsp:include page="../inc/header.jsp" />

<script type="text/javascript" src="http://oryany.co.kr//wcs.naver.net/wcslog.js"></script>

<!-- 게시판 CSS -->
<link type ="text/css" href="css/common.css" rel="stylesheet">
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
					<!-- 상단위치표시 -->
					<dl class="loc-navi"><dd><a href="/">HOME</a> &gt; CS CENTER &gt; Q&A</dd></dl>
					<!-- .bbs-hd -->
					<div class="bbs-tit">
						<h3>Q&A</h3>
					</div>
					<div class="bbs-table-pwd">
						<form name="form1" action="ProdQnaDelete.po" method="post" autocomplete="off" >   
							<input type="hidden" name="basicCode" value="<%=request.getParameter("basicCode") %>" />
							<input type="hidden" name="qna_num" value="<%=request.getParameter("qna_num") %>" />
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
											<td><div><input id="bp_input_passwd" type="password"  class="MS_input_txt" name="qna_pass" /></div></td>
										</tr>
									</tbody>
								</table>
							</fieldset>
						<!-- //비밀번호 입력 -->
						<div class="bbs-link pwd-link">
							<a href="javascript:document.form1.submit();" class="CSSbuttonBlack">확인</a>
							<a href="javascript:history.go(-1);" class="CSSbuttonWhite">뒤로가기</a>
						</div>
						</form>          
					</div>
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