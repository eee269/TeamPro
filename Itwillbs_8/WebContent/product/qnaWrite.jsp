<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String basicCode = request.getParameter("basicCode");

%>
<jsp:include page="../inc/header.jsp" />
<link rel="shortcut icon" href="http://oryany.co.kr/shopimages/nasign/favicon.ico" type="image/x-icon"><link rel="apple-touch-icon-precomposed" href="http://oryany.co.kr/shopimages/nasign/mobile_web_icon.png" /><title>Q&A</title>
<script type="text/javascript" src="http://oryany.co.kr//wcs.naver.net/wcslog.js"></script>
<!-- 게시판 CSS -->
<link type="text/css" rel="stylesheet" href="http://oryany.co.kr/shopimages/nasign/template/work/33865/board_write.nasign.css?t=202005111439" />
<link type="text/css" rel="stylesheet" href="http://oryany.co.kr/shopimages/nasign/template/work/33865/header.1.css?t=202011161104" />
<link href="https://fonts.googleapis.com/css?family=Roboto:200,300,400,500,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700&display=swap" rel="stylesheet">
<script type="text/javascript" src="http://oryany.co.kr/shopimages/nasign/template/work/33865/header.1.js?t=202011161104"></script>
<div id="wrap">
    <div id="contentWrapper">
	<!-- CS CENTER 상단공통배너 : 가상태그 -->
	<link type="text/css" rel="stylesheet" href="http://oryany.co.kr/shopimages/nasign/template/unit/2/unit_cs_top_ban.css" />
	<!-- CS CENTER 상단 -->
	<div class="cboth sub_top_ban brand">
		<div class="width1260 sub_top_text">CS CENTER</div>
	</div>
        <div id="contentWrap">
			<link type="text/css" rel="stylesheet" href="http://oryany.co.kr/template_common/shop/basic_simple/menu.1.css?t=201711221039" />
             <div id="content">
                <div id="bbsData">
                    <div class="page-body">
                        <!-- //게시판 리스트 -->
                        <div class="bbs-tit">
                            <h3>Q&A</h3>
                        </div>
						<dl class="prd-tinfo">
                            <dt>
                                <a href="/shop/shopdetail.html?branduid=3359780&xcode=001&mcode=001&scode=&GfDT=aWp3UQ%3D%3D"><img src="http://oryany.co.kr/shopimages/nasign/0010010005563.jpg?1564388969" /></a>
                            </dt>
                            <dd>
                                <ul>
                                    <li class="name"><span class="tit">상품명 :</span> <a href="/shop/shopdetail.html?branduid=3359780&xcode=001&mcode=001&scode=&GfDT=aWp3UQ%3D%3D">벤틀리 크로스바디</a> <span class='MK-product-icons'></span></li>
                                    <li class="price"><span class="tit">상품가 :</span> 259,000원</li>
                                </ul>
                            </dd>
                        </dl>
						<div class="bbs-table-write">
							<form name='form1' action="ProdQnaWritePro.po" method='post' enctype="multipart/form-data" style="position:relative;" autocomplete="off">
								<div id='passimg' name='passimg' style=' position:absolute; visibility:hidden;z-index:999; '></div>
								<input type='hidden' name='basicCode' value="<%=basicCode %>" />
								<input type="hidden" name="page" value="">
								<fieldset>
                                	<legend>일반게시판 쓰기</legend>
                                	<table summary="">
                                    	<caption>게시판 글쓰기</caption>
                                    	<colgroup>
	                                        <col width="135" />
	                                        <col width="395" />
	                                        <col width="155" />
	                                        <col width="*" />
                                    	</colgroup>
                                    	<tbody>
                                        	<tr>
	                                            <th><div>이름</div></th>
	                                            <td><div><input id='bw_input_writer' type='text' name='name'  class="MS_input_txt input_style1"  /></div></td>
	                                            <th><div>비밀번호</div></th>
	                                            <td>
                                                	<div>
                                                    	<input id='bw_input_passwd' type='password' name='pass'  class="MS_input_txt input_style"  />                                                    
                                                    	<font color="red">자동 잠금 기능</font>                                                                                                    
                                                   	</div>
                                            	</td>
                                        	</tr>
                                            <tr>
                                            	<th><div>제목</div></th>
                                            	<td colspan="3">
                                                <div class="title">
													<input id='bw_input_subject'   class="MS_input_txt input_style2" type='text' name='subject' value='' />
													<div class="title_select"></div>
                                                </div>
												</td>
                                        	</tr>
                                        	<tr>
	                                            <th><div>내용</div></th>
	                                            <td colspan="3" class="text_content">
                                                <div>
                                                	<textarea id='MS_text_content' name='content' wrap="off" onfocus='clear_content()'  class="MS_input_txt" style='font-family:굴림체;' >
                                                		주문자 : 
														주문번호 : 
														요청사항 :
 													</textarea>
 												</div>
	                                            </td>
    	                                    </tr>
         	                               <tr>
												<th><div>파일</div></th>
                                            	<td colspan="3">
                                                	<div>
                                                    	<input id='bw_input_file' type='file'  class="MS_input_txt input_style2" name="file" />
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
	                                    <input type="submit" value="등록하기" class="CSSbuttonBlack">
	                                    <a href="/board/board.html?code=nasign&page=1&board_cate=&s_id=&stext=&ssubject=&scontent=&shname=&sbrand=&sgid=&branduid=3359780" class="CSSbuttonWhite">목록보기</a>
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
    
<link type="text/css" rel="stylesheet" href="http://oryany.co.kr/shopimages/nasign/template/work/33865/footer.1.css?t=202011261717" />

<!-- Enliple Common Tracker v3.5 [공용] start -->
<script type="text/javascript">
<!--
	function mobRf(){
        var rf = new EN();
		rf.setData("userid", "nasign");
        rf.setSSL(true);
        rf.sendRf();
    }
//-->
</script>
<script src="https://cdn.megadata.co.kr/js/en_script/3.5/enliple_min3.5.js" defer="defer" onload="mobRf()"></script>
<!-- Enliple Common Tracker v3.5 [공용] end --></div><!-- #wrap -->
<iframe id="loginiframe" name="loginiframe" style="display: none;" frameborder="no" scrolling="no"></iframe>

<div id="basketpage" name="basketpage" style="position: absolute; visibility: hidden;"></div>

<form name=attachform method=post>
<input type=hidden name=code value="nasign">
<input type=hidden name=size value="512000">
<input type=hidden name=maxsize value="">
<input type=hidden name=img_maxwidth value="550">
<input type=hidden name=img_resize value="Y">
<input type=hidden name=servername value="special328">
<input type=hidden name=url value="oryany.co.kr">
<input type=hidden name=org value="nasign">
<input type="hidden" name="fileobj_name" value="" />
<input type="hidden" name="device_type" value="PC" />
<input type="hidden" name="security" value="N" />
</form>

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
<script type="text/javascript" src="http://oryany.co.kr//astg.widerplanet.com/js/wp_astg_3.0.js" async="true"></script>
<script>
function getInternetExplorerVersion() {
    var rv = -1;
    if (navigator.appName == 'Microsoft Internet Explorer') {
    var ua = navigator.userAgent;
    var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
    if (re.exec(ua) != null)
    rv = parseFloat(RegExp.$1);
    }
    return rv;
}

function showcherrypickerWindow(height,mode,db){
    cherrypicker_width = document.body.clientWidth;
    var isIe = /*@cc_on!@*/false;
    if (isIe) {
        cherrypicker_width = parseInt(cherrypicker_width + 18);
    }
    setCookie('cherrypicker_view','on', 0);

    
    document.getElementById('cherrypicker_layer').style.display = "block";
    document.getElementById('cherrypicker_layer').innerHTML = Createflash_return(cherrypicker_width,'','/flashskin/CherryPicker.swf?initial_xml=/shopimages/nasign/cherrypicker_initial.xml%3Fv=1607416085&product_xml=/shopimages/nasign/%3Fv=1607416085', 'cherrypicker_flash', '');
}

function load_cherrypicker(){
    cherrypicker_check = true;

    if (!document.getElementById('cherrypicker_layer')) {
        return;
    }


}
</script>
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
</script><script type="text/javascript">
if (document.cookie.indexOf("app_agent=power_app") >= 0) {
    
}
</script>
<script type="text/javascript" src="http://oryany.co.kr/template_common/shop/basic_simple/common.js?r=1511314772"></script>


<jsp:include page="../inc/footer.jsp" />