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
							<form name='form1' action="ProdQnaWritePro.po method='post' enctype="multipart/form-data" style="position:relative;" autocomplete="off">
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
                                                    	<input id='bw_input_file' type='text'  class="MS_input_txt input_style2" name="file" value='' onfocus='this.blur();upalert()' /> <a href="javascript:upload('file_name1');" class="btn_file">찾아보기...</a>
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
	                                    <a href="JavaScript:send();" class="CSSbuttonBlack">등록하기</a>
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

        (function ($) {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                url: '/html/user_basket_quantity.html',
                data :{ 'IS_UNIFY_OPT': "true" }, 
                success: function(res) {                                                                                        
                    var _user_basket_quantity = res.user_basket_quantity || 0;
                    $('.user_basket_quantity').html(_user_basket_quantity); 
                },
                error : function(error) {
                    var _user_basket_quantity = 0;
                    $('.user_basket_quantity').html(_user_basket_quantity); 
                }
            });
        })(jQuery);

function upalert() {
   alert('파일첨부 버튼을 클릭하세요');
   document.form1.subject.focus();
}
function clear_content() {
                return;
}

// 네이버 앱에서 window.open("about:blank" 시, 빈창이 먼저 열린채 진행이 되지 않아서 '' 처리함. '' 처리시 about:blank 기본으로 열림. - 개발 2팀 이정애 (https://it.makeshop.co.kr/makeshop/?id=30834 30834-18번 이슈 처리)
function upload(fileobj_name) {
    uploadwin = window.open("","uploadwin","width=350,height=50,toolbars=no,menubar=no,scrollbars=no,status=no");
    document.attachform.action = "//boardupload.makeshop.co.kr/upload.html";

    if (fileobj_name != undefined && document.attachform.fileobj_name) {
        document.attachform.fileobj_name.value = fileobj_name;
    }
    document.attachform.target = "uploadwin";
    document.attachform.submit();
    uploadwin.focus();
}

function send() {
    if (jQuery('#passimg').css('visibility') == 'visible' && auth_check_flag == false) {
        showdiv('visible');
        return ;
    }
    showdiv('hidden', true);
    if (document.form1.ok.value=="Y") {
        location.href='board.html?code=nasign';
        return;
    }
    if (document.form1.hname.value.length==0) {
        alert('이름을 입력하세요.');document.form1.hname.focus();
        return;
    }    if (document.form1.passwd && document.form1.passwd.value.length == 0) {
        alert('비밀번호을 입력하세요.');
        document.form1.passwd.focus();
        return ;
    }    if (document.form1.subject.value.length == 0) {
        alert('제목을 입력하세요.');
        document.form1.subject.focus();
        return;
    }    if (document.form1.content.value.length==0 || document.form1.content.value == '<P>&nbsp;</P>' || document.form1.content.value == '<p>&nbsp;</p>' || document.form1.content.value == '<p><br></p>' || document.form1.content.value == '<p></p>' || document.form1.content.value == '<br>') {
        alert('내용을 입력하세요.');document.form1.content.focus();
        return;
    }
    if (Board_Checklength2(document.form1.content) == false) {
        return;
    }            if (typeof(document.form1.privercy_agree) != 'undefined' && document.form1.privercy_agree[0].checked === false) {
                alert('개인정보 수집·이용에 동의하신 후에 글을 작성 하실 수 있습니다.');
                return;
            }        if (typeof document.form1.authtext=='undefined' || document.form1.authtext.value.length==0 ) {
           showdiv('visible');
           //document.form1.authtext.focus();
           return;
        }        
            if(document.getElementById('rewritecheck')){
        if(document.getElementById('rewritecheck').value == 'rewrite') {
            alert('진행중입니다.');
        }
        
    } else {
        var elem = document.createElement('input')   
        elem.setAttribute('type', 'hidden');   
        elem.setAttribute('id', 'rewritecheck');   
        elem.setAttribute('value', 'rewrite');   
        document.body.appendChild(elem);
        document.form1.submit();     
    }
}

function showdiv(temp, close_chk) {
    if (temp=='visible') {
        var passuid='';
     //if (typeof(document.form1.authid) !='undefined')  passuid = document.form1.authid.value;     // 기존 인증키가 있으면 왜 남겨놨을까? 한번 인증 실패나면 키가 삭제 되는데 
     document.getElementById('passimg').innerHTML = '';
     var pars = 'passuid=' + passuid + '&acmethod=auth_check&used_confirm_btn=Y&closemethod=showdiv&closeparam=hidden&r='+Math.random();
        //var pars = 'passuid=' + passuid + '&acmethod=send&used_confirm_btn=Y&r='+Math.random();
        new Ajax.Request("/shop/authimg.html", {
            method: 'post',
            parameters: pars,
            onSuccess: function(res) {
                
                document.getElementById('passimg').innerHTML = res.responseText.stripScripts();
                setTimeout(function() {res.responseText.evalScripts()}, 10);
            }
        });
    }
    if (typeof(document.getElementById('passimg'))!='undefined') {
        var passimg = document.getElementById('passimg');
        if (temp=='visible') {
                        var location_chk = document.form1.content.parentNode;
            doCenter(document.form1 ,location_chk, passimg);
        } else {
            if (close_chk !== true) {
                jQuery('input[name=authtext], input[name=authid]', '#passimg' ).val('');
            }
        }
        passimg.style.visibility=temp;
    }

}
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