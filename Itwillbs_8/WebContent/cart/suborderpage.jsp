<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:include page="../header.jsp" />
    <link type="text/css" rel="stylesheet" href="../css/suborderpage.css" />
    
    
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">		 



<script type="text/javascript" src="/js/jsdomain.js"></script>
<script type="text/javascript" src="/js/common.js?dummy=20200310"></script>
<script type="text/javascript" src="/js/prototype.js"></script>
<script type="text/javascript" src="/js/prototypeUtil.js?dummy=20200310"></script>
<script type="text/javascript" src="/js/alajax.js"></script>
<script type="text/javascript" src="/js/header.js?dummy=20200310"></script>
<script type="text/javascript" src="/js/music.js"></script>
<script type="text/javascript" src="/search/autocomplete/qsChk.js?dummy=20200310"></script>
<script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>

<link href="//image.aladin.co.kr/img/home/aladin.ico" type="image/x-icon" rel="shortcut icon">
<style type="text/css">
    body {
	    margin-left: 0px;
	    margin-top: 0px;
	    margin-right: 0px;
	    margin-bottom: 0px;
    }
    #global_set2_3 {float:left;text-align:center; }
    /* #global_set2_3 ul {} */
    #global_set2_3 li { float:left;margin:0;padding:0;display:inline;list-style:none;font-size:0;height:28px;}
    #global_set2_3 li.set2se {width:1px; background:url(//image.aladin.co.kr/img/header/2011/global_set1_se.gif) right;}

    #re_topmenu_wrap {background:url(//image.aladin.co.kr/img/header/2011/header_menu_bg_new.gif) repeat-x; height:31px;}
    /*검색-키보드 확대시 대비한 css*/
    
    #global_search {background:url(//image.aladin.co.kr/img/header/bg_search.gif) no-repeat; width:535px; position:relative; top:28px; height:41px;}
    
    #global_search dl { float:left; width:78px; margin:12px 0 0 20px;}
    #global_search dt {background:url(//image.aladin.co.kr/img/header/i_arrdown.gif) no-repeat right 5px; color:#2f9ddc; font-weight:bold}
    #global_search img.arrow {position: absolute;right: 122px;top: 8px;}
    #global_search input { width: 280px; margin: 9px 0 0 12px; border: none; font: bold 16px 돋움; background: transparent; color:#006699;}
    #global_search input.searchBtn {width: 40px;height: 20px;position: absolute;right: 72px;top: 1px;}
    #global_search input.searchBtn2 {width: 53px;height: 13px;position: absolute;right:5px;top: 4px;}
</style>

<script type="text/javascript" src="/js/netfunnel.js?ver=202011131055" charset="UTF-8"></script>
<script type="text/javascript" src="/js/NetfunnelSkinUtil.js?ver=202011131055" charset="UTF-8"></script>
<link type="text/css" href="/css/netfunnel.css?ver=202011131055" rel="stylesheet">
 
<script type="text/javascript"> 
    var $j = jQuery.noConflict();
    $j(document).ready(function () {
    $j('.mall_menu_img').hover(
        function () { $j(this).attr("src", $j(this).attr("src").replace(".gif","_on.gif")); },
        function () { $j(this).attr("src", $j(this).attr("src").replace("_on.gif",".gif")); }
    );
    $j('#global_set2_3 ul li').hover(
        function () { $j($j(this).attr("id")).show(); },
        function () { $j($j(this).attr("id")).hide();}
    );
    $j('#global_set3_2 ul li').hover(
        function () { $j($j(this).attr("id")).show(); },
        function () { $j($j(this).attr("id")).hide();}
    );
    $j('#head_layer_menu_container').hover(
        function () { $j("#head_layer_menu").show(); },
        function () { $j("#head_layer_menu").hide();}
    );
    $j('#re_mallmenu ul li').hover(
        function () { $j($j(this).attr("id")).show(); },
        function () { $j($j(this).attr("id")).hide();}
    );
    $j('#re_submallmenu ul li').hover(
        function () { $j($j(this).attr("id")).show(); },
        function () { $j($j(this).attr("id")).hide(); }
    );
    $j('#searchTargetDesc').hover(
        function () { $j("#searchTargetDropDown").show(); },  
        function () { $j("#searchTargetDropDown").hide(); }
    );
});
</script>    

<!-- ClickTale Top part -->
<script type="text/javascript">
  var WRInitTime = (new Date()).getTime();
</script>
<!-- ClickTale end of Top part -->

<link href="/css/style.css?ver=20201113" rel="stylesheet" type="text/css">
<link href="/ucl_editor/css/header_2011.css?dummy=20200310" rel="stylesheet" type="text/css">

    <style type="text/css">
        #wa_header2_headerTop tr, #wa_header2_headerTop td,
        #footer tr, #footer td{ text-align:left; }    
    </style>
    <!--[if IE]>
    <style type="text/css">
        #T { z-index:10;} 
    </style>
    <![endif]-->


<div id="qs_div_iframe" style="display:none;">
	<iframe id="qs_iframe" name="qs_iframe" src="" frameborder="0" marginwidth="0" marginheight="0" topmargin="0" scrolling="no" allowtransparency=""></iframe>
</div>

<script type="text/javascript">
    function headerTopReFormBanner(event){reFormBanner("wa_header2_headerTop");}
    Event.observe(window, "load", headerTopReFormBanner);
    Event.observe(window, "resize", headerTopReFormBanner);    
   
    try{ setHeaderLayer();}
    catch(e) { }    
</script>

<div style="position:relative;background-color:Gray">
    <div style="position: absolute; left:-105px; top:7px; z-index:1;">
	    
















    </div>
</div>


<div class="my_accwrap">



                                    

<h3>주문 조회/변경/취소</h3>

</div>
 


						
                        <!--NPS 배너 -->
			            







<!--상단 알사탕/마일리지/적립금 응모하기-->
                        
    <div class="account_info01_map hidden mt5">
    <div align="center">
    
	</div>
</div>
    
		

<!--외부쿠폰배너 -->
                        
                        <!--외부쿠폰배너 -->
                         
                        <span id="wa_luckylamp_mileage_eventBanner1_lblTag"></span>  <!--행운의램프 복불복 이벤트 배너-->
                         <!--웹표준버전-->
						
						

<style type="text/css">
    .textarea_box {font-size:10pt; font-family:"돋움";}
    .table_sep td { padding:0;height:1px; }
    .sortBtn { cursor:pointer; }
    .orgyou_t {font-size:14px;font-weight:bold;letter-spacing:-1px;}
    .orgyou_f {border-top:1px solid #c7c7c7;border-left:1px solid #c7c7c7;border-right:1px solid #dedede;border-bottom:1px solid #dedede;padding:4px;font-family:dotum;font-size:14px;height:26px;}
</style> 




<!-- 품절센터 상태 -->


<!--네이버페이 안내문-->


<!-- 스마트 상담센터 -->




<div class="order_table01">
		<div class="order_table02_tit hidden">
			<h4>기본/배송정보</h4>
               <!--구: Html_butImg-->
            
            
		</div>
		 
        
<script language="javascript">
//     <!--
//         function usedshopcomp(url)
//         {
// //            if (confirm("정말로 승인하시겠습니까?\n승인후에는 반품하실 수 없으니 유의해 주십시오"))
// //            {
//                 window.open(url,'CompleteC2C','width=400,height=357,status=0');
// //            }
//         }

// 		function removeSurvey() {
//             if (confirm("구매만족도를 삭제하시겠습니까?")) {
//                 return true;
//             }
//             return false;
// 		}

        
//         // 웹업데이트 할수 없어서 임시로 넣음 by Gootooc
    

//     -->

        
</script>


<table width="756" cellpadding="0" cellspacing="1" bgcolor="#d1d1d1" summary="">
<caption>기본/배송 정보내역 </caption>
	<colgroup>
       	<col width="16%">
		<col width="34%">
		<col width="17%">
		<col width="33%">
	</colgroup>
		<tbody>
    
    

    
	    <tr>
		    <th scope="row" class="myacc_th02">주문번호</th>
		    <td class="myacc_td01">001-A503991487</td>
		    <th scope="row" class="myacc_th02">배송방법</th>
		    <td class="myacc_td01">택배</td>
	    </tr>
	    <tr>
		    <th scope="row" class="myacc_th02">주문접수일</th>
		    <td class="myacc_td01">2020년 09월 18일 금 10시52분</td>
		     <th scope="row" class="myacc_th02">결제일(입금확인일)</th>
		    <td class="myacc_td01">2020년 09월 18일 금 10시52분</td>
	    </tr>

	    
	    <!--<tr>
		    <td bgcolor="#f5f5f5"><img src="/ucl_editor/img_secur/account/2005/table_t79.gif" height="12"></td>
		    <td class="myacc_td01">2020년 09월 21일 월요일
		    </td>
		     <th scope="row" class="myacc_th02"><img src="/ucl_editor/img_secur/account/2005/table_t80.gif" height="12"></td>
		    <td class="myacc_td01">2020년 09월 21일 월요일</td>
	    </tr>-->
	    
	        <tr>
		       <th scope="row" class="myacc_th02">상태</th>
		       <td colspan="3" class="btn myacc_td01">
                    <div class="text_inline_td"><a href="#help" class="linkblue"><span class="font_386da1">출고완료/집하</span></a> (2020-09-19)</div><div class="mb5">운송장 : 381571187376, CJ대한통운<div class="button_blue ml5"><a href="javascript:window.open('/account/popup/wdeliverytrackingall.aspx?ONO=001-A503991487&amp;DeliveryNo=381571187376','DeliveryTrace','scrollbars=1,resizable=1,width=552,height=578,top=0,left=100').focus();" class="button_small_white">배송추적</a></div></div>
				
		        </td>
	        </tr>
        
            <tr>
                <th scope="row" class="myacc_th02">수령예상일</th>
                <td colspan="3" class="btn myacc_td01">
                    2020년 9월 21일 월 (최근 1주일 96.2%)
                </td>
            </tr>
        
	
	
	<!--C2C중고 상태-->
	
    </tbody>
</table>



 <!--기본/배송정보(웹표준)-->
</div>


        <div class="order_table02">
			<table width="756" cellpadding="0" cellspacing="1" bgcolor="#d1d1d1" summary="">
				<caption>주문 정보</caption>
				<colgroup>
					<col width="16%">
					<col width="34%">
					<col width="17%">
					<col width="33%">
				</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="myacc_th02">
								<div>주문하신 분</div>
							</th>
							<td class="myacc_td01">
								<div>김예진</div>
							</td>
							<th scope="row" class="myacc_th02">
								<div>받으시는 분</div>
							</th>
							<td class="myacc_td01">
								<div>김예진</div>
							</td>
						</tr>
                        
						    <tr>
							    <th scope="row" class="myacc_th02">
								    <div>배송주소</div>
							    </th>
							    <td colspan="3" class="myacc_td01">
								    <div>(47051) 부산광역시 사상구 대동로64번길 25 (학장동, 금강아파트) 102동 610호 - 문앞</div>
							    </td>
						    </tr>
						    <tr>
							    <th scope="row" class="myacc_th02">
								    <div>전화번호</div>
							    </th>
							    <td class="myacc_td01">
								    <div>051-322-4979<div>
							    </div></div></td>
							    <th scope="row" class="myacc_th02">
								    <div>휴대번호</div>
							    </th>
							    <td class="myacc_td01">
								    <div>010-7900-4399<div>
							    </div></div></td>
						    </tr>


                            
                   
						        <tr>
							        <th scope="row" class="myacc_th02">
								        <div>배송메시지</div>
							        </th>
							        <td colspan="3" class="myacc_td01">
								        <div></div>
							        </td>
						        </tr>
				            
	                     <tr>
            		
							<th scope="row" class="myacc_th02">
								<div>거래명세서</div>
							</th>
							<td colspan="3" class="myacc_td01">
								<div>받지 않음 </div>
							</td>
						</tr>
                    
                        <tr>
							<th scope="row" class="myacc_th04">
								<div>선물주문</div>
                                  
							</th>
							<td colspan="3" class="order_table02_tr myacc_td01">
								   
							</td>
						</tr>
                        
					</tbody>
			</table>
		</div>
        

    <!--판매자 정보-->
     
    <!--//판매자 정보-->

 



<!-- 기프티북 -->
 <!--웹표준 변경필요_코딩요청(임의웹표준코딩)-->


<div class="order_table03 detail03">

    



	<!-- 주문 상품 정보 제목 -->
	<div class="order_table03_tit hidden">
		<h4>주문 상품 정보</h4>
	</div>
	
    <!--주문상품정보 리스트 및 각동 정보-->
	<table class="order_table" border="0" cellpadding="0" cellspacing="0" bgcolor="#d1d1d1" summary="">
		<caption>주문 상품 내역</caption>
		<colgroup>
		
			<col width="12%">
			<col width="50%">
			<col width="20%">
			<col width="18%">
		
		</colgroup>
		<thead>
		   	<tr>
		   	 	
				<th scope="col">Thanks to</th>
				<th scope="col">
					<a href="javascript:OrdersItemSorter.doSort(1, this);" title="상품명으로 정렬">
						<span class="font_1b6bbb tabclass" id="nameSortImgBtn"> 상품명</span> <img src="https://image.aladin.co.kr/img/account/blet_align_b.gif" alt="">
					</a>
				</th>
				
				<th scope="col">
					<a href="javascript:OrdersItemSorter.doSort(2,  this);" title="준비수량으로 정렬">
					<span class="font_606060_bold tabclass" id="qtySortImgBtn">주문/준비수량</span> <img src="https://image.aladin.co.kr/img/account/blet_align_b.gif" alt="">
					</a>
				</th>
				
				
				<th scope="col">
					<a href="javascript:OrdersItemSorter.doSort(3, this);" title="가격순으로 정렬">
					<span class="font_606060_bold tabclass" id="priceSortImgBtn">가격</span> <img src="https://image.aladin.co.kr/img/account/blet_align_b.gif" alt="">
					</a>
				</th>
				
				
					
			</tr>
		</thead>
		<tbody id="tblOrdersItem">
		     <tr id="ordersItem_218568947"><td class="td_thanks"><div><img src="/ucl_editor/img_secur/catalog/book/thanks_b.gif" width="50" height="15" border="0"><br><img src="//image.aladin.co.kr/img/catalog/book/thanks_t_link_off.png" width="60" height="14" border="0"></div></td><td class="td_item"> <div><a href="https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=218568947" class="linkblue">  <span class="font_386da1">스프링 부트와 AWS로 혼자 구현하는 웹 서비스</span></a> - 인텔리제이, JPA, JUnit 테스트, 그레이들, 소셜 로그인, AWS 인프라로 무중단 배포까지  <a href="https://www.aladin.co.kr/events/wevent.aspx?EventId=179240"><img src="//image.aladin.co.kr/img/shop/2018/bu_deduct_o.gif" alt="소득공제" align="absmiddle"></a><br><a href="http://blog.aladin.co.kr/MyBlog/newPaper/CommentReview?ISBN=8965402603&amp;CommunityType=CommentReview" target="_blog"><img align="absbottom" alt="100자평쓰기" src="https://image.aladin.co.kr/img/order/button/write_buyercoment_1.gif" style="cursor:pointer;"></a><br><span class="font_919191">이동욱 지음</span></div></td><td class="td_amount" style="text-align:center"><div>1/1</div></td><td class="td_mileage"><div>가격 : 19,800원<br>마일리지 : 1,100원 (5%)</div></td></tr> <!--웹표준버전-->
		</tbody>
	</table>

	<div class="order_table03_info">
                                         <p class="table03_info_p01">이 주문으로 발급되는 마일리지는 배송 처리 이후에 <a href="https://www.aladin.co.kr/account/wSubPayInfo.aspx?pType=SubPayMileage" class="linkblue"><span class="font_386da1">'마일리지 조회'</span></a>에서 확인하실 수 있습니다.</p>
                                         <p class="table03_info_p02"><span class="font_e2508b">5만원 이상 구매시 기존 마일리지 이외에, 추가 마일리지 2,000점을 더 드립니다.</span></p>
                                         <p class="table03_info_p02"><span class="font_e2508b">(단 2천원 이상의 국내도서 외 상품 함께 구매시에만 적립, 발송 다음날 적립)</span><a href="http://blog.aladin.co.kr/aladinservice/4283292"><span class="hellow_left03_span">자세히보기</span></a></p>
                                      </div> 
    </div> <!-- 주문정보 끝-->

    <!-- 품절센터 안내 //-->
     <!--메세지--> 

 


<!-- 사은품 정보 시작 -->
 <!--웹표준적용-->
<!-- 사은품 정보 끝 --> 



<script type="text/javascript">
var OrdersItemSorter = {}

OrdersItemSorter.currentSortType = 0;
OrdersItemSorter.newTrs = [];
OrdersItemSorter.newTrsSep = [];
OrdersItemSorter.trs = [];
OrdersItemSorter.prevImgObj = null;
OrdersItemSorter.data = [['0','8965402603','스프링 부트와 AWS로 혼자 구현하는 웹 서비스','-1','19800'],
[]]; //1,8996540641,제목,-1,13500
OrdersItemSorter.data.pop();


OrdersItemSorter.init = function(){
    var otblOrdersItem = $('tblOrdersItem');
    
    if(!otblOrdersItem) {
        return false;
    }
    
    OrdersItemSorter.trs = otblOrdersItem.getElementsByTagName("TR");

        

    for(var i=0; i<OrdersItemSorter.trs.length; i++){
        
        if(!OrdersItemSorter.trs[i]) {
            continue;
        }
        
         OrdersItemSorter.newTrsSep.push(OrdersItemSorter.trs[i]);
         OrdersItemSorter.newTrs.push(OrdersItemSorter.trs[i]);
        
        
    }
    
    OrdersItemSorter.currentSortType = 1; // "상품순"이 기본 정렬
    OrdersItemSorter.prevImgObj = $("nameSortImgBtn");
    
    return true;
}

OrdersItemSorter.doSort = function (sortType, imgObj){
    if(OrdersItemSorter.currentSortType==sortType) {
        return;
    }
    
    if(!OrdersItemSorter.newTrs || OrdersItemSorter.newTrs.length < 1){
        return;
    }
    
    var sepIndex = 0;
    var data2 = [];
    var tbody = OrdersItemSorter.trs[0].parentNode;
    
    if(!tbody) {
        return;
    }
    
    if(sortType==1){
        OrdersItemSorter.currentSortType = 1;
        data2 = OrdersItemSorter.data.sort(OrdersItemSorter.titleSort);        
    } else if(sortType==2){
        OrdersItemSorter.currentSortType = 2;
        data2 = OrdersItemSorter.data.sort(OrdersItemSorter.qtySort);
    } else if(sortType==3){
        OrdersItemSorter.currentSortType = 3;
        data2 = OrdersItemSorter.data.sort(OrdersItemSorter.priceSort);
    } else {
        return;
    }
    
    for(var i=OrdersItemSorter.trs.length-1; i>=0; i--){
        OrdersItemSorter.trs[i].parentNode.removeChild(OrdersItemSorter.trs[i]);
    }
    
    for(var i=0; i<data2.length; i++){
        var index = data2[i][0];
        var newObj = OrdersItemSorter.newTrs[index];
        tbody.appendChild(newObj);
        //if(i<(data2.length-1)){
        //    tbody.appendChild(OrdersItemSorter.newTrsSep[sepIndex]);
        //    sepIndex++;
        //}
    }
    
    var $j = jQuery.noConflict();
        
        $j(".tabclass").removeClass("font_1b6bbb");
        $j(".tabclass").removeClass("font_606060_bold"); 
        
        if(sortType==1)
        {
            $j("#nameSortImgBtn").addClass("font_1b6bbb");
            $j("#qtySortImgBtn").addClass("font_606060_bold");
            $j("#priceSortImgBtn").addClass("font_606060_bold");
            
        }
        if(sortType==2)
        {
            $j("#nameSortImgBtn").addClass("font_606060_bold");
            $j("#qtySortImgBtn").addClass("font_1b6bbb");
            $j("#priceSortImgBtn").addClass("font_606060_bold");
            
        }   
        if(sortType==3)
        {
           $j("#nameSortImgBtn").addClass("font_606060_bold");
            $j("#qtySortImgBtn").addClass("font_606060_bold");
            $j("#priceSortImgBtn").addClass("font_1b6bbb");
            
            
        }
    return;
}

OrdersItemSorter.titleSort = function(a, b){
	if(a[2] == b[2]) {
        return 0;
	} else if(a[2] > b[2]) {
		return 1;
	} else {
		return -1;
    }
}

OrdersItemSorter.priceSort = function (a, b){
	if(parseInt(a[4]) == parseInt(b[4])) {
		return OrdersItemSorter.titleSort(a,b);
	} else if(parseInt(a[4]) > parseInt(b[4])) {
		return -1;
	} else {
		return 1;
    }		
}

OrdersItemSorter.qtySort = function (a, b){
	if(parseInt(a[3]) == parseInt(b[3])) {
		return OrdersItemSorter.titleSort(a,b);
	} else if(parseInt(a[3]) > parseInt(b[3])) {
		return 1;
	} else {
		return -1;
    }	
}

OrdersItemSorter.init();
</script>


<div class="order_table05 mt20 ">
<div class="order_table05_tit hidden">
<h4>결제 정보</h4>
    <!--div class="button_blue change_btn01">
	    <a href="#" class="button_small_white">변경</a>
    </div-->
    

</div>
   
   
<!-- 결제 정보 시작 -->
    
<div id="Wa_ordersinfo1_pPayInfo">
	
 
	
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#d1d1d1" summary="">
	<caption>결제 내역</caption>
	<colgroup>
        
		    <col width="15%">
		    <col width="85%">
        
	</colgroup>
		<tbody>
			<tr>
				<th scope="row" class="myacc_th02">
					<div>
						총 주문 금액 
					</div>
				</th>
				<td class="myacc_td01">
					<div>
					    <strong>19,800</strong> 원 (상품가격 19,800원 + 배송료 0원 + 선물포장료 0원)
					</div>
				</td>
				
			</tr>
			<tr>
				<th scope="row" class="myacc_th02">
					<div>알라딘 통장 결제</div>
				</th>
				<td class="myacc_td01">
					<div></div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="myacc_th02">
					<div>실 결제 금액</div>
				</th>
				<td class="myacc_td01">
					<div>
					     <span class="font_f5680b_bold">19,800</span> 원
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="myacc_th04">
					<div>결제 방법</div>
				</th>
				<td class="btn myacc_td01">
			        
			        <div class="bank_btn_group"><div class="bank_online mr5">신용카드(하나카드)</div><div class="button  table_btn01 mr5 mb5">
                                                    <a href="javascript:OpenReceipt('/account/popup/wpopup_receipt.aspx?ONO=001-A503991487&amp;type=1')" class="button_small">카드전표</a>
                                                    </div><div class="button  table_btn01 mr5 mb5" name="img_receipt_print">
									                    <a href="javascript:OpenReceipt('/account/evidence/wevidenceByOrder.aspx?ONO=001-A503991487&amp;t=8')" class="button_small">거래명세서</a>
								                    </div></div>
			        
				</td>
			</tr>
            
			<tr>
				<th scope="row" class="myacc_th02">
					<div>소득공제</div>
				</th>
				<td class="myacc_td01">
					<div>
					    하나카드 : <strong>19,800</strong>원
					</div>
				</td>
			</tr>
            
		

		</tbody>
</table>

	
    
	    <div class="order_table05_info" style="margin-bottom:10px;">
</div>

<!--나의계정 >주문 목록 감추기-기존위치에서 하단으로 변경-->

</div>
<!-- 결제 정보 끝 -->

</body>


<jsp:include page="../footer.jsp" />

