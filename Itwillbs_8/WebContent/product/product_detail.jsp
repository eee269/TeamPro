<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.ProdQnaBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.HashMap"%>
<%@page import="vo.ProductOptionBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.ProdReviewBean"%>
<%@page import="vo.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   String member_id= (String)session.getAttribute("member_id");
   ArrayList<ProdQnaBean> qnaList = (ArrayList<ProdQnaBean>)request.getAttribute("qnaList");
   PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
   int nowPage = pageInfo.getPage();
   int maxPage = pageInfo.getMaxPage();
   int startPage = pageInfo.getStartPage();
   int endPage = pageInfo.getEndPage();
   int listCount = pageInfo.getListCount();
   
   String basicCode = request.getParameter("basicCode"); 
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<jsp:include page="/inc/header.jsp" />
<!-- QuickMenu -->
<jsp:include page="/quickMenu.jsp" />

<!-- 카카오 SDK -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 별점 스크립트 -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.3.1/flatly/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="css/power_review_custom.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://use.fontawesome.com/5ac93d4ca8.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- TAB기능 스타일 -->
<style>
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);

#powerReview .tabs {
   width: 100%;
   margin-bottom: 29px;
   border-bottom: 1px solid #d9d9d9;
}

#powerReview .tabs .tab {
   display: inline-block;
   margin-bottom: -1px;
   padding: 20px 15px 10px;
   cursor: pointer;
   letter-spacing: 0;
   border-bottom: 1px solid #d9d9d9;
   /*-moz-user-select: -moz-none;*/
   -ms-user-select: none;
   -webkit-user-select: none;
   user-select: none;
   transition: all 0.1s ease-in-out;
}

#powerReview .tabs .tab a {
   font-size: 11px;
   text-decoration: none;
   text-transform: uppercase;
   color: #d9d9d9;
   transition: all 0.1s ease-in-out;
}

#powerReview .tabs .tab.active a, body .container .tabs .tab:hover a {
   color: #263238;
}

#powerReview .tabs .tab.active {
   border-bottom: 1px solid #263238;
}

#show-option>li {
    margin: 10px 0px 20px 0px;
}
a:hover{
    text-decoration: none;
}
#show-option>li:last-child {
    padding-bottom: 10px;
    border-bottom: 1px solid #ccc;
}

/*====================옵션 css====================*/
.wrap-num-product {
	width: auto;
	height: 25px;
	border: 1px solid #e6e6e6;
	border-radius: 3px;
	overflow: hidden;
}

.btn-num-product-up, .btn-num-product-down {
	width: 25px;
	height: auto;
	cursor: pointer;
}

.btn-num-product-up, .btn-num-product-down {
	width: 25px;
	height: auto;
	cursor: pointer;
}
.num-product {
	width: 30px;
	height: 100%;
	border-left: 1px solid #e6e6e6;
	border-right: 1px solid #e6e6e6;
	background-color: #f7f7f7;
}
#show-option{
	width: 100%;
}
#show-option>li{
	margin:10px 0px 20px 0px;
}
#show-option>li:last-child{
	padding-bottom :10px;
	border-bottom : 1px solid #ccc;
}
</style>

<!-- 끝 -->


<link type="text/css" rel="stylesheet" href="css/common.css" />
<link type="text/css" rel="stylesheet" href="css/shopdetail.css" />
<link type="text/css" rel="stylesheet" href="css/header.css" />
<link type="text/css" rel="stylesheet" href="css/menu_1.css" />

<script type="text/javascript">
   // option으로 선택한 값 받아와서 임시 저장
   
   var mixopt = [];
   function submix(id, val) {
	   if (val != null) {
		   if(id == 'opt1') {
			   mixopt[0] = val;
		   } else if(id == 'opt2') {
			   mixopt[1] = val;
		   }
	   } else return;
	   
	   if(mixopt[0] != null && mixopt[1] != null) {
		   optcheck(mixopt);
		   $('#opt1 option:eq(0)').prop('selected', true);
		   $('#opt2 option:eq(0)').prop('selected', true);
		   mixopt =[]; 
		   return;
	   }
	   
   }
var productCode = "";
   // 선택된 옵션체크
   function optcheck(mixopt) {
       productCode = <%=basicCode%> + mixopt[0] + mixopt[1];
    
       $("#slick-slide03").attr('value', mixopt[0]); 	// 사이즈
       $("#slick-slide04").attr('value', mixopt[1]);	// 컬러
      
      var oldopt = [];
      // 이미 선택된 옵션인지 확인 
      var isEquals = false;
      var newopt = mixopt[0] + "/" + mixopt[1];
      
      $('ul#show-option li p.show-value').each(function() {
			oldopt = $(this).text();
	        console.log(oldopt);
	        if(oldopt == newopt) {
		         isEquals = true;
		    }
	  });
     
      if(isEquals) {
	    	$('#opt1 option:eq(0)').prop('selected', true);
			$('#opt2 option:eq(0)').prop('selected', true);
		    alert('이미 선택된 옵션입니다.');
		    isEquals = false;
			return;
      } else {
    	    showlist(newopt, productCode);
      }
      
   }
   
   // option 2개 다 선택됐으면 값 전달받고 화면에 출력
   // ul뒤에 li 형식으로 달아놓기
   // 선택된 옵션명: '.show-value', 수량 감소: '#optminus', 수량 증가: '#o`ptplus'
   // 선택된 수량: '#optnum', 선택 옵션 삭제: '#optdel'
   function showlist(mixopt, productCode) {
      // 선택된 opt 수 가져와서 다음 번호 만들기
      // 선택된 옵션이 0개 -> resultcount = 1
      var resultcount = $('ul#show-option li').length+1+'';
      
      // ul 뒤에 붙일 거라 li태그 들어가게 만들기
      var optcol=document.createElement('li');
      // optcol id 설정 -> 이런모양( <li id="optcol1"> )
      var id = "optcol"+resultcount;
      optcol.id = id; 

   // body에서 id가 show-option인 ul을 찾아서 li추가 
      $('ul#show-option').append(optcol);
//       alert(mixopt);
      var html = "<input type='hidden' value= '<%=basicCode%>' id = 'basicCode' name='basicCode'>" +
      "<input type='hidden' value='"+mixopt+"' name = 'mixopt'>"+
      // 옵션 이름
          "<p class='respon6 show-value p-b-10' name='optname' style='float: left; display:inline-block;'>" + mixopt + "</p>"+
      // 옵션 삭제 아이콘
          "<div style='display:inline-block; float:right;'><span style='cursor: pointer' id='optdel" + resultcount + "' onclick='optDelete("+ id + ")'>" + 
          "<img src='https://img.icons8.com/fluent-systems-regular/24/000000/cancel.png'/></span></div><br><br>"+
          // 옵션 수량 선택
          "<div class='size-204 flex-w flex-m respon6-next'>" + 
          "<div class='wrap-num-product flex-w' id='itemcnt" + resultcount + "'>" +
          "<span class='btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m' id='optminus" + resultcount + "' onclick='cntMinus(this.id)'>" + 
          "<i class='fs-16 zmdi zmdi-minus'></i></span>" + 
          "<input class='mtext-104 cl3 txt-center num-product' type='number' id='optnum" + resultcount + "' name='num-product'  value='1'>" + 
          "<span class='btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m' id='optplus" + resultcount + "' onclick='cntPlus(this.id)'>" + 
          "<i class='fs-16 zmdi zmdi-plus'></i></span></div></div>";

      $('#'+id).append(html);
      
      // cnt 값 보내기
      $("#slick-slide06").attr('value', 1);
      calculatePrice('optnum'+resultcount);
      
   }

   // 선택된 옵션 수량에 따른 가격 계산후 출력, 가격: '.price', '#total'
   // 수량의 id를 넘겨 받고
   function calculatePrice(id) {
      var totalprice = 0, itcnt = [];
      var itemprice = parseInt($('span#item-price').text().replace(/[^0-9]/g, ''));
      var resultcount = $('ul#show-option li').length;
      
      console.log(resultcount);
      
      if(resultcount < 1) {
         	$('#total').css('display', 'none');
      } else {
         	$('#total').css('display', 'inline');
      }
      
      for(var s = 1; s <= resultcount; s++) {
    	  console.log(id.charAt(id.length-1));
    	  id = id.replace(id.charAt(id.length-1), s);
    	  
    	  console.log(id);
		  itcnt[s-1] = parseInt($('#'+id).val());
		  console.log(itcnt[s-1]);
		  console.log(totalprice);
		  console.log(itemprice);
      }
		  
      for(var i=0; i<resultcount; i++) {
	       totalprice += itemprice * itcnt[i];
      }
      
      console.log(totalprice);
      $('#total span').text(totalprice + '원');
   }

   // 상품개수증가
   function cntPlus(id) {
      var numid = id.replace("plus", "num")
      var cnt = Number($('#'+numid).val());
      cnt += 1;
     
      $('#'+numid).attr('value', cnt);
      // cnt 값 보내기 
      $("#slick-slide06").attr('value', cnt);
      calculatePrice(numid);
   }
   
   // 상품개수감소
   function cntMinus(id) {
      var numid = id.replace("minus", "num");
      // optminus1 에서 minus를 num으로 고쳐서 optnum1으로 고침, optnum1은 상품 갯수 id
      var cnt = Number($('#'+numid).val());
      // optnum1에 있는 value 값을 받아와서 cnt에 저장

      if(cnt > 1) {
         cnt -= 1;
         $('#'+numid).attr('value', cnt);
         // cnt 값 보내기
         $("#slick-slide06").attr('value', cnt);
       

      }
      // 갯수가 1보다 크면 감소 1과 같거나 작으면 아무것도 안함
      
      calculatePrice(numid);
   }

   // 선택옵션삭제
	function optDelete(li) {
	  console.log(li);
//       var id = document.this.getElementsByName('num-product').id;
	  console.log(id);
      $(li).remove();
      calculatePrice(id);
   }
   
   // 옵션 관련 스크립트 끝
</script>


<!-- productDetail 관련  -->
<%
    ArrayList<ProductBean> productDetailList =(ArrayList<ProductBean>)request.getAttribute("productDetailList");
    ArrayList<ProductOptionBean> productColorList =(ArrayList<ProductOptionBean>)request.getAttribute("productColorList");
    ArrayList<ProductOptionBean> productSizeList =(ArrayList<ProductOptionBean>)request.getAttribute("productSizeList");
   ArrayList<String> likeBaiscCodeList = (ArrayList<String>)request.getAttribute("likeBasicCodeList");
    

    String[] main = productDetailList.get(0).getMain_img().split("/");
    String[] sub = productDetailList.get(0).getSub_img().split("/");
    
    String likeCheck = member_id+"/"+productDetailList.get(0).getBasicCode();
	DecimalFormat priceFormat = new DecimalFormat("###,###");
	System.out.println(productDetailList.size());
%>
<!-- 끝 -->

<!-- breadcrumb -->
<!-- <div class="container"> -->
<!--    <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg"> -->
<!--       <a href="main.go" class="stext-109 cl8 hov-cl1 trans-04">HOME -->
<!--          <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i> -->
<%--       </a> <a href="ProductShop.po?type=X&xcode=<%=productDetailList.get(0).getXcode()%>&ncode=<%=productDetailList.get(0).getNcode()%>" class="stext-109 cl8 hov-cl1 trans-04"> --%>
<%--          <%=productDetailList.get(0).getNcode() %><i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i> --%>
<!--       </a> <span class="stext-109 cl4"> Jacket </span> -->
<!--    </div> -->
<!-- </div> -->


<!-- Product Detail -->
<section class="sec-product-detail bg0 p-t-65 p-b-60">
   <div class="container">
      <!-- 폼 -->
      <!-- 폼 -->
      <div class="row">
         <div class="col-md-6 col-lg-7 p-b-30">
            <div class="p-l-25 p-r-30 p-lr-0-lg">
               <div class="wrap-slick3 flex-sb flex-w">
                  <div class="wrap-slick3-dots"></div>
                  <div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

                  <div class="slick3 gallery-lb">
                  <%for(int i=0; i<main.length; i++){%>
                  
<%-- 							<%=productDetailList.get(0).getName() %> --%>
<%-- 							<%=productDetailList.get(0).getPrice()%> --%>
<%-- 							<%=productSizeList.get(i).getSize()%> --%>
<%-- 							<%=productColorList.get(i).getColor() %> --%>
<%-- 							<%=basicCode%> --%>
						<!-- 	------------------------------------------------     -->
						
                     <div class="item-slick3"
                        data-thumb="upload/productUploadImg/<%=main[i] %>">
                        <div class="wrap-pic-w pos-relative">
                           <img src="upload/productUploadImg/<%=main[i] %>" alt="IMG-PRODUCT">
                           <input type="hidden" name = "main_img" value="upload/productUploadImg/<%=main[i] %>">

                           <a
                              class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
                              href="product/uploadImg/<%=main[i] %>"> <i
                              class="fa fa-expand"></i>
                           </a>
                        </div>
                     </div>
                  <%}%>
                  
                  </div>
               </div>
            </div>
         </div>

         <div class="col-md-6 col-lg-5 p-b-30">
            <form action="cartGetPlusAction.ca" method="post" name="cartUp">
            <div class="p-r-50 p-t-5 p-lr-0-lg">
            <!-- 상품코드 -->
            <input type="hidden" id="item-code" value="code,,">
            <input type="hidden" name="name" value="<%=productDetailList.get(0).getName() %>">
			<input type="hidden" name="price" value="<%=productDetailList.get(0).getPrice()%>">
            <!-- 상품명 -->
               <h4 class="mtext-105 cl2 js-name-detail p-b-14" id="item-name"><%=productDetailList.get(0).getName() %>
                  </h4>
            <!-- 상품가격 -->
               <span class="mtext-106 cl2" id="item-price"><%=priceFormat.format(productDetailList.get(0).getPrice())%>원</span>

<!--                <p class="stext-102 cl3 p-t-23">Nulla eget sem vitae eros -->
<!--                   pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare -->
<!--                   feugiat.</p> -->

               <!-- 상품 옵션 -->
               <div class="p-t-33" id="select-opt">
                  <div class="flex-w flex-r-m p-b-10">
                     <div class="size-203 flex-c-m respon6">Size</div>

                     <div class="size-204 respon6-next rs1-select2 bor8 bg0">
                        <select class="js-select2" id="opt1" name="time"
                           onchange="submix(this.id, this.value)">
                           <option value="" selected>Choose an option</option>
                           <%for(int i=0; i<productSizeList.size(); i++){%>
                              <option value="<%=productSizeList.get(i).getSize()%>"><%=productSizeList.get(i).getSize() %></option>
                           <% }%>
                        </select>
                        <div class="dropDownSelect2"></div>
                     </div>
                  </div>

                  <div class="flex-w flex-r-m p-b-10">
                     <div class="size-203 flex-c-m respon6">Color</div>

                     <div class="size-204 respon6-next rs1-select2 bor8 bg0">
                        <select class="js-select2" id="opt2" name="time"
                           onchange="submix(this.id, this.value)">
                           <option value="" selected>Choose an option</option>
                           <%for(int i=0; i<productColorList.size(); i++){%>
                              <option value="<%=productColorList.get(i).getColor()%>"><%=productColorList.get(i).getColor() %></option>
                           <% }%>
                        </select>
                        <div class="dropDownSelect2"></div>
                     </div>
                  </div>


                  <div class="flex-w flex-r-m p-b-10"
                     style="text-align: right; width: 500px; padding: 10px 30px;">

                     <%-- 선택한 옵션 블럭 --%>
							<ul id="show-option">
								<%-- 한 옵션이 들어가는 li--%>
								<%-- 한 옵션이 들어가는 li 끝 --%>
							</ul>

							<div class="price" class="size-203 flex-c-m respon6 " id="total" style="text-align: right; font-size: 18px; font-weight: bold;">
								<span></span>
							</div>

							<div class="flex-w flex-r-m p-b-10"
								style="text-align: right; width: 500px; padding: 10px 30px;">
								<div class="size-204 flex-w flex-m respon6-next">
									<br><input type="submit" value="Add to cart"
										class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail"
										name="cartSubmit">
								</div>
							</div>
               </div>

               <%-- 좋아요 + 각종 공유 / yj --%>
               <div class="flex-w flex-m p-l-100 p-t-40 respon7">
                  <div class="flex-m bor9 p-r-10 m-r-11">
                  <%if(member_id !=null){%>
                     
                     <button 
                        class="btn-addwish-b2 dis-block pos-relative js-addwish-b2 <%if(likeBaiscCodeList.contains(productDetailList.get(0).getBasicCode())){%> js-addedwish-b2 <%}else{%>js-addedwish-b1<%}%>" value="<%=likeCheck%>">
                        <img class="icon-heart1 dis-block trans-04"
                        src="images/icons/icon-heart-01.png" alt="ICON"> 
                        <img class="icon-heart2 dis-block trans-04 ab-t-l"
                        src="images/icons/icon-heart-02.png" alt="ICON">
                     </button>
                  <% }else{%>
                     <a href="#"
                        class="not_member">
                        <img class="icon-heart1 dis-block trans-04"
                        src="images/icons/icon-heart-01.png" alt="ICON">
                     </a>
                   <% } %>
                   <!-- 카카오톡으로 공유하기 기능 -->
                   &nbsp;&nbsp;&nbsp;
                   <a id="kakao-link-btn" href="javascript:sendLink()">
  					<img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" width="20px"/>
				   </a>
                  </div>

                  <a href="#"
                     class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
                     data-tooltip="Facebook"> <i class="fa fa-facebook"></i>
                  </a> <a href="#"
                     class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
                     data-tooltip="Twitter"> <i class="fa fa-twitter"></i>
                  </a> <a href="#"
                     class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
                     data-tooltip="Google Plus"> <i class="fa fa-google-plus"></i>
                  </a>
               </div>
            </div>
      </form>
         </div>
      </div>

<!--    폼 끝 -->
      
      <!-- 상세정보 시작 -->
      <div id="productDetail">
         <div class="cboth width1260">

            <div id="page01" class="cboth pdt100"></div>
            <!-- 중복되는 탭 메뉴 include 로 뺌 -BIN- -->
            <jsp:include page="../inc/detail_tabmenu.jsp" />
            <div class="prd-detail">
               <form name="allbasket" method="post" action="/shop/basket.html">

                  <!-- //item-wrap -->
                  <div class="related-allbasket none">
                     <a href="javascript:send_multi('3', '', 'relation', 'YES')">ADD
                        TO CART</a>
                  </div>
               </form>

               <div id="videotalk_area"></div>
               <!-- [OPENEDITOR] -->
               <table width="750" align="center" border="0" cellspacing="0"
                  cellpadding="0">
                  <tbody>
                     <tr>
                        <td align="center">
                        <%for(int i=0; i<sub.length; i++){%>
                        <img src="upload/productUploadImg/<%=sub[i] %>" imgborder="0"><br> 
                        <% }%>
                        </td>
                     </tr>
                  </tbody>
               </table>

               &gt;
               <!-- 몰티비 플레이어 노출 위치 -->
               <div id="malltb_video_player"
                  style="margin-top: 10px; margin-bottom: 10px; text-align: center; display: none;"></div>

            </div>

            <a name="reviewboard"></a>
            <div class="cboth pdt100"></div>
            <div id="page02" class="cboth pdt100"></div>
            <!-- 중복되는 탭 메뉴 include 로 뺌 -BIN- -->
            <jsp:include page="../inc/detail_tabmenu.jsp" />
			<script src="js/bootstrap4-rating-input.js"></script>
				<!-- BIN -->
				<!-- ------------------------------상품리뷰---------------------------------------  -->
				<div id="powerReview">
					<div class="hd-t">
						<h2>POWER REVIEW</h2>
					</div>
					<div id="writePowerReview">
						<div class="PR15N01-write">
							<form name="prw_form" id="prw_form" method="post" autocomplete="off" enctype="multipart/form-data">
								<input type="hidden" name="basicCode" value="<%=basicCode%>">
								<p><strong>별점을 매겨주세요</strong></p>
								<!-- 별점 -->
								<div class="rat">
									<input type="number" name="starScore" id="rating1" class="rating text-warning" value="0" />
								</div>
								<!-- 별점 -->
								<textarea name="content" id="prw_content" placeholder="리뷰 내용을 입력해주세요" required></textarea>
								<div class="thumb-wrap"></div>
								<input type="file" name="prw_file" class="trick file-attach" id="prw_file" > 
								<input type="button" value="리뷰 등록" id="lnk-review" class="lnk-review" style="text-align: right; padding: 20px 50px; cursor: pointer;">
							</form>
						</div>
					</div>
					<div class="PR15N01-info">
						<dl class="score">
							<dt></dt>
							<dd><span></span>개 리뷰 평점</dd>
						</dl>
						<div class="chart">
							<ul>
							</ul>
						</div>
						<div class="photo">
							<ul>
<!-- 								<li><a -->
<!-- 									href="javascript:power_review_view_show('995649','00000', 0, 'photo');"><span></span><img -->
<!-- 										src="http://board.makeshop.co.kr/board/special328/nasign_board8/square::201021181313.jpeg" -->
<!-- 										alt=""></a> -->
<!-- 								</li> -->
							</ul>
						</div>
						<p class="like">
						</p>
					</div>
					<div class="PR15N01-hd" id="viewPoint">
								<h2>
									프리미엄 상품평<span>(<span class="totalReview_count"></span>)</span>
								</h2>
								<ul class="sort">
									<li class="now" value="date"><a href="javascript:getReplyCall();">최신 순</a></li>
									<li value="score"><a href="javascript:getReplyCall('','1');">평점 순</a></li>
									<li value="good"><a href="javascript:getReplyCall();">추천 순</a></li>
								</ul>
							</div>
					<div class="tabs">
						<ul class="reviewTabs">
							<li class="tab signin active"><a href="#signin">포토리뷰(<span class="photoReview_count"></span>)</a></li>
							<li class="tab signup"><a href="#signup">일반리뷰(<span class="review_count"></span>)</a></li>
						</ul>
					</div>
					<div id="listPowerReview" class="MS_power_review_list">
						<div class="signup-cont"></div>
						<div class="signin-cont" style="display:none;"></div>
					</div>
					<!-- ------------------------------상품리뷰---------------------------------------  -->
				</div>
				<!-- #powerReview-->
				<p style="clear: both"></p>
            <div class="cboth pdt100"></div>
            <div id="page03" class="cboth pdt100"></div>
            <!-- 중복되는 탭 메뉴 include 로 뺌 -BIN- -->
            <jsp:include page="../inc/detail_tabmenu.jsp" />
            <div class="tit-detail">
            </div>
            <!-- qna 리스트 시작 -BIN- -->
            <div class="table-slide qna-list">
               <table summary="번호, 제목, 작성자, 작성일, 조회">
                  <caption>QnA 리스트</caption>
                  <colgroup>
                     <col width="80">
                     <col width="30">
                     <col width="*">
                     <col width="100">
                     <col width="100">
                     <col width="80">
                  </colgroup>
                  <thead>
                     <tr>
                        <th scope="col"><div class="tb-center">NO</div></th>
                        <th scope="col"></th>
                        <th scope="col"><div class="tb-center">SUBJECT</div></th>
                        <th scope="col"><div class="tb-center">NAME</div></th>
                        <th scope="col"><div class="tb-center">DATE</div></th>
                        <th scope="col"><div class="tb-center">HIT</div></th>
                     </tr>
                  </thead>
                  <%
                     for (int i = 0; i < qnaList.size(); i++) {
                        if(qnaList.get(i).getQna_re_seq()==0){
                  %>
                  <tbody>
                     <tr class="nbg">
                        <td>
                           <div class="tb-center">
                              <span class="qnanum"><%=qnaList.get(i).getQna_num()%></span>
                           </div>
                        </td>
                        <td>
                           <div class="tb-center"></div>
                        </td>
                        <td>
                           <div class="tb-left reply_depth0">
                              <span><a href="javascript:void(0)" onclick = "show_hide(this); return false;"><%=qnaList.get(i).getQna_subject()%></a></span>
                              <span style="font-size: 8pt;"></span>
                           </div>
                        </td>
                        <td>
                           <div class="tb-center">
                           <%=qnaList.get(i).getUsername()%>
                           </div>
                        </td>
                        <td>
                           <div class="tb-center">
                           <%=sdf.format(qnaList.get(i).getQna_date())%>
                           </div>
                        </td>
                        <td>
                           <div class="tb-center">
                              <span id="qna_board_showhits1" class="qnahit"><%=qnaList.get(i).getQna_readcount()%></span>
                           </div>
                        </td>
                     </tr>
                     <tr class="MS_qna_content_box cnt2" id="qna_board_block1" style="display: none;">
                        <td colspan="6">
                           <div class="tb-left">
                              <div class="qna_board_content">
                              	<img src="upload/prodQnaUpload/<%=qnaList.get(i).getQna_file() %>" alt="<%=qnaList.get(i).getQna_file() %>" onerror="this.style.display='none'" style="max-height: 50px; max-width: 50px;">
                                 <div style="padding-bottom: 15px; padding-left: 80px; padding-right: 15px; padding-top: 15px">
                                    <%=qnaList.get(i).getQna_content() %>
                                 </div>
	                                <%if(member_id != null){if(qnaList.get(i).getMember_id().equals(member_id)){ %>
		                                 <div class="flex-w flex-r m-t-10 m-r-40 p-b-0" >
			                                 <a href="ProdQnaModifyForm.po?basicCode=<%=basicCode%>&qna_num=<%=qnaList.get(i).getQna_num()%>">
		                                 		<div class="flex-c-m stext-109 cl6 size-126 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn">
													<i class="cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
														수정
												</div>
			                                 </a>
			                                 <a href="ProdQnaDeleteForm.po?basicCode=<%=basicCode%>&qna_num=<%=qnaList.get(i).getQna_num()%>">
		                                 		<div class="flex-c-m stext-109 cl6 size-126 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn">
													<i class="cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
														삭제
												</div>
			                                 </a>
			                                </div>
			                                 <%} else if(member_id.equals("admin")){ %>
			                                 <div class="flex-w flex-r m-t-10 m-r-40 p-b-0" >
			                                 <a href="ProdQnaDeleteForm.po?basicCode=<%=basicCode%>&qna_num=<%=qnaList.get(i).getQna_num()%>">
		                                 		<div class="flex-c-m stext-109 cl6 size-126 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn">
													<i class="cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
														삭제
												</div>
			                                 </a>
				                                 <a href="ProdQnaReplyForm.po?basicCode=<%=basicCode%>&qna_num=<%=qnaList.get(i).getQna_num()%>">
		                                 		<div class="flex-c-m stext-109 cl6 size-126 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn">
													<i class="cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
														답글
												</div>
			                                 </a>
										</div>
			                                 <%}
	                                	}%>
                                 <%}else if(qnaList.get(i).getQna_re_seq()>0){ %>
                                 <div class="MS_cmt_list_box">
                                    <div class="comment_depth1">
                                       <table class="MS_cmt_list" border="0" cellspacing="0" cellpadding="0">
                                          <tbody>
                                             <tr>
                                                <td class="MS_cmt_detail">
														<div class="comments">
															<div class="comments__arrow_top"></div>
															<div class="comment__inner">
																<div class="comment__lpane"><%= qnaList.get(i).getUsername() %></div>
																<div class="comment__rpane">
																	<div class="comment__error_message"></div>
																<div class="comment__message">
																	<span class="comment__message_text"><%= qnaList.get(i).getQna_content() %></span>
																</div>
					    	                					<%if(member_id != null && member_id.equals("admin")){ %>
					    	                					<div class="flex-w flex-r m-t-10 m-r-40 p-b-0" >
							    	                    			<a href="ProdQnaModifyForm.po?basicCode=<%=basicCode%>&qna_num=<%=qnaList.get(i).getQna_num()%>">
		                                 								<div class="flex-c-m stext-109 cl6 size-126 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn">
																			<i class="cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
																			수정
																		</div>
							    	                    			</a>
									                                <a href="ProdQnaDeleteForm.po?basicCode=<%=basicCode%>&qna_num=<%=qnaList.get(i).getQna_num()%>">
		                                 								<div class="flex-c-m stext-109 cl6 size-126 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn">
																			<i class="cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
																			삭제
																		</div>
									                                </a>
																</div>
						    	                    			<%} %>
		    	                							</div>
		    	                						</div>
		    	                					</div>
		    	                			
                                                </td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </div>
                                 </div>
                                 <%}else if(qnaList.get(i+1).getQna_re_seq()==0){%>
                              </div>
                           </div>
                        </td>
                     </tr>
                  </tbody>
                     <%}
	                }
                  %>
                  </table>
                 <div class="flex-w w-full p-t-10 m-lr--7 flex-c">
				<%if(nowPage <= 1) {%>
					<a href="javascript:void(0);" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination">&lt; <!-- '<' 의 코드--></a>
				<%}else {%>
					<a href="ProductDetail.po?basicCode=<%=basicCode%>&page=<%=nowPage - 1%>" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination">&lt;</a>
				<%} %>
				<%for(int i = startPage; i <= endPage; i++) { 
					if(i == nowPage) { %>
						<a href="javascript:void(0);" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"><%=i %></a>
					<%}else { %>
						<a href="ProductDetail.po?basicCode=<%=basicCode%>&page=<%=i %>" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination2"><%=i %></a>
					<%} %>
				<%} %>
				<%if(nowPage >= maxPage) { %>
					<a href="javascript:void(0);" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination">&gt; <!-- '>' 의 코드 --></a>
				<%}else { %>
					<a href="ProductDetail.po?basicCode=<%=basicCode%>&page=<%=nowPage + 1%>" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination">&gt;</a>
				<%}%>
			</div>
			<!-- Pagination -->
               <div class="btm_write">
                  <a href="ProdQnaWriteForm.po?basicCode=<%=basicCode%>">WRITE</a>
               </div>
            </div>
               <!-- qna pagin -->
               <!-- qna 리스트 끝 -BIN- -->

            <div class="cboth pdt100"></div>
            <div id="page04" class="cboth pdt100"></div>
            <!-- 중복되는 탭 메뉴 include 로 뺌 -BIN- -->
            <jsp:include page="../inc/detail_tabmenu.jsp" />

            <div class="cboth pdt30"></div>

            <!-- s: 상품 일반정보(상품정보제공 고시) -->
            <div id="productWrap">
               <table>
                  <colgroup>
                     <col width="210">
                     <col width="*">
                  </colgroup>
                  <tbody>
                     <tr>
                        <th><span>종류</span></th>
                        <td><span>상세설명참조</span></td>
                     </tr>
                     <tr>
                        <th><span>소재</span></th>
                        <td><span>상세설명참조</span></td>
                     </tr>
                     <tr>
                        <th><span>색상</span></th>
                        <td><span>상세설명참조</span></td>
                     </tr>
                     <tr>
                        <th><span>크기</span></th>
                        <td><span>상세설명참조</span></td>
                     </tr>
                     <tr>
                        <th><span>제조자</span></th>
                        <td><span>상세설명참조</span></td>
                     </tr>
                     <tr>
                        <th><span>제조국</span></th>
                        <td><span>상세설명참조</span></td>
                     </tr>
                     <tr>
                        <th><span>품질보증기준</span></th>
                        <td><span>관련법 및 소비자 분쟁해결 규정에 따름</span></td>
                     </tr>
                     <tr>
                        <th><span>A/S 책임자와 전화번호</span></th>
                        <td><span>(주)내자인/051-803-0909</span></td>
                     </tr>
                  </tbody>
               </table>
            </div>


            <!-- e: 상품 일반정보(상품정보제공 고시) -->

            <div class="cboth pdt100"></div>
            <div id="page05" class="cboth pdt100"></div>
            <!-- 중복되는 탭 메뉴 include 로 뺌 -BIN- -->
            <jsp:include page="../inc/detail_tabmenu.jsp" />


            <!-- 배송/반품안내 내용 삽입영역 -->
            <div class="deli_info_area">
               <div class="deli_title">1. 주문 및 배송</div>
               <div class="deli_txt01">
                  - 평일 오전 9시 이전 주문건은 당일 출고 진행되며, 이후 주문건은 익일(평일 기준) 출고 됩니다.<br>
                  - 당일 주문 건 중 물류에 재고가 없을 경우, 약 2~3일의 재고 수급 기간이 소요될 수 있으며,<br>
                  &nbsp;&nbsp;부득이하게 재고 수급이 불가할 경우, 품절 안내를 드릴 수 있으니 구매 시 참고 부탁 드립니다.<br>
                  - 사이즈 및 무게는 기준에 따라 약간의 오차가 있을 수 있으며, 모니터 사양에 따라 색상이 다르게 보일 수 있습니다.
               </div>

               <div class="deli_txt02">
                  <div class="deli_title02">
                     <span></span> 주문 전 SHOP OOTD 프리미엄 가죽에 대한 정보를 확인해 주세요.
                  </div>
                  글로벌 토탈 패션 브랜드 SHOP OOTD는 명품 하우스에서 사용하는 최고급 소재를 고집하여 세계 최고의 검사,
                  검증,<br> 테스트를 인증하는 SGS*의 인증처에서 엄격한 품질, 공정관리를 거쳐 제작되었습니다. 패셔너블한
                  디자인으로 최상의 제품<br> 퀄리티를 선보이는 동시에 최고의 가치소비를 지향하며 합리적인 가격대를
                  제시합니다.<br> SHOP OOTD의 가죽은 천연가죽으로, 미세한 핏줄자국, 주름, 반점 등이 보일 수 있습니다.
                  천연가죽의 특성으로 인한 가죽의 상태와,<br> 제거가 가능한 실밥, 봉제선의 미세한 흔들림 등 핸드메이드
                  공정 중 발생할 수 있는 현상들은 제품의 불량 사유에 해당하지<br> 않으니, 참고 부탁 드립니다.<br>
                  * SGS는 국제표준(ISO)절차를 준수하는 세계 최고의 검사, 검증, 테스트 및 인증 회사입니다.
                  <div class="deli_title02">
                     <span></span> LAUNDRY &amp; FABRIC CARE
                  </div>
                  - 천연가죽은 사람 피부와 동일 하므로 사용시 표면에 흠집 또는 색이 벗겨질 수 있습니다. 이는 제품의 하자가 아닌
                  사용에 의한<br> &nbsp;&nbsp;자연적인 현상입니다.<br> - 상품 보관시 직사광선이나
                  온도, 또는 습기가 높은 곳을 피하십시오.<br> - 가죽 염료는 수성이므로 면,마, 린넨 등의 흰 천연
                  섬유에 오염될 염려가 있으므로 습기,땀 등에 주의하셔야 합니다.<br> - 천연가죽(스웨이드) 제품은 물에
                  젖었을 경우 물이 빠질 수 있습니다.<br> - 에나멜, 가죽 및 합성피혁은 다른 소재와 밀착시 색이 이염되는
                  현상이 있사오니, 취급 또는 보관시 주의하십시오.<br> - 볼펜이나 신문, 잡지 등에 색이 이염될 수 있으니
                  주의해주시기 바랍니다.<br> - 물에 젖었을 경우 직사광선이나 열로 직접 건조하면 변질될 수 있으니 통풍이
                  잘 되는 그늘에서 건조하시기 바랍니다.<br> - 가죽전용 크림으로 주 1회 정도 손질하여 주시면 제품을 오래
                  사용하실 수 있습니다.<br> &nbsp;&nbsp;(단, 소재가 세무 종류일 경우에는 가죽 전용솔 및 깨끗한
                  고무 지우개만 사용 가능)<br> - 오염되었을 때는 가죽전용 크림으로 세척하시고 일반세척제나 벤졸은 절대
                  사용하시면 안됩니다.
               </div>

               <div class="deli_title">2. 교환 및 반품</div>
               <div class="deli_txt01">
                  - 교환/반품 신청은 구매하신 사이트를 통해 접수 가능합니다.<br> - 상품 수령 후 7일 이내 미사용
                  제품에 한해 신청 가능하며, 반품 상품 입고 확인 후 약 2~3일의 검품기간을 거쳐 교환/반품 진행됩니다.<br>
                  &nbsp;&nbsp;(무통장 입금 건의 경우, 검품 완료 후 약 4~5일 정도의 환불 기간이 소요될 수 있습니다.)<br>
                  - 오야니 직영몰 회원분께는 교환/반품 신청시 회수 접수 진행을 해드리고 있으며, 1회에 한해 무료 교환/반품
                  가능합니다.
               </div>

               <div class="deli_txt02">
                  <div class="deli_title02">
                     <span></span> 교환/반품 불가 사유
                  </div>
                  - 상품 TAG을 제거 또는 포장 등의 손상이 있을 경우<br> - 제품을 사용했거나 사용 흔적이 있을 경우
                  / 향수 또는 화장품 등 이물이 묻었을 경우<br> - 제품 구성품을 분실 또는 동봉하지 않은 경우<br>
                  - 미세한 스크래치 또는 실밥, 이중 봉제 등 불량이 아닌 사유로 교환/반품 신청할 경우<br> - 포장 상태
                  불량으로 인한 제품 훼손의 경우<br> - 구매 내역이 확인되지 않을 경우<br> - 교환/반품
                  접수를 하지 않고 상품만 반송한 경우
               </div>

               <div class="deli_title">3. A/S 접수</div>
               <div class="deli_txt01">
                  - 품질 보증 기준 : 구입일로부터 1년 (수선 내용에 따라 무상 또는 유상 수선 진행)<br> - 구매하시는
                  고객님께는 개런티 카드가 발송되며, 개런티 카드를 지참하셔야 A/S가 가능합니다.<br> 1) 전국 SHOP OOTD
                  매장 방문 접수 (면세점 접수 불가)<br> 2) 택배 접수<br> - 고객정보, 구매정보, 수선
                  요청 사항 기재 / 개런티 카드 (또는 구매내역서) 동봉<br> - 택배지 주소 : (04995) 부산시
                  부산진구 동천로 109 삼한골든게이트빌딩 7층 SHOP OOTD 담당자 앞 (T.051-803-0909)
               </div>

            </div>

         </div>

      </div>
      <!-- productDetail -->
      <!-- 상세정보 끝 -->

   </div>

   <div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
      <span class="stext-107 cl6 p-lr-25"> SKU: JAK-01 </span> 
<%--       <span class="stext-107 cl6 p-lr-25"> Categories: <%=productDetailList.get(0).getBasicCode() %>, Men </span> --%>
   </div>
</section>
<script type="text/javascript">
	var basicCode = '<%=basicCode%>';
	var member_id = '<%=member_id%>';
	//BIN 상품 리뷰 입력
	$(function(){
	    $(".PR15N01-write").click(function(){
	    	// 로그인 판별
			if(member_id=='null'){
				if(!confirm("로그인을 하셔야 이용 가능합니다. 로그인을 하시겠습니까?")){
					return;
				}else{
					location.href='MemberLoginForm.mo';
				}
			}
		});		
	    $("#lnk-review").click(function(){
	    	if($('#rating1').val() == 0){
	    		alert("별점을 입력하세요.");
	    		$('.fa fa-star').data-val(1).focus();
	    	}else if($("#prw_content").val().trim() === ""){
		    		alert("리뷰를 입력하세요.");
		    		$("#prw_content").val("").focus();
		    	}else{
		            var form = $('#prw_form')[0];
		            var data = new FormData(form);
		    		$.ajax({
		                type: "POST",
		    			enctype: 'multipart/form-data',
		    			url: "ProdReviewWrite.po",
		    			processData: false,
		                contentType: false,
		                data: data,
		                success: function () {
		                	alert("리뷰 등록 완료");
		                	$("#prw_content").val("");
		                	$("#prw_file").val("");
		                	$('.fa-star').attr('class','fa fa-star-o');
		                	getReply();
		                },
		    			error: function(request,status,error){
		    		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    		       }
		    		}); // ajax 종료
		    	}; // else end
	    });
	    // BIN 리뷰 리스트 호출
	    function getReply(page,sort){
	    	var totalReview_count = 0;
	    	var limit = 10;
	    	var loop = 1;
	    	// 리뷰 추천에 사용할 변수
	    	var good = 0;
	    	var bad = 1;
	    	// 처음 들어오거나 새로고침 시 기본설정
	    	if(!page){
	    		var page = 1;
	    		loop = $('.reviewTabs > li').length; // tabs 수 만큼 반복
	    		$("#powerReviewList").text("");
	    		// 상품 별점 계산 함수 호출
	    		starScoreCount(basicCode);
	    	}else{
	    		// 0 일 때 포토리뷰
		    	if($('.active').text()=="포토리뷰()"){
		    		var pic = 0;
		    		$("#signup-cont").text("");
		    	// 1 일 때 일반리뷰
		    	}else{
		    		var pic = 1;
		    		$("#signin-cont").text(""); 
		    	}
    		}
	    	if(!sort){
	    		var sort = 0;
	    	}
	    	$.ajax({
    			url: "ProdReviewList.po", // 요청 url
                type: "POST", // post 방식
                data: {
                	basicCode : basicCode,
                	pic : pic,
                	page : page,
                	limit : limit,
                	loop : loop,
                	sort : sort
                },
                success: function (jsonObject) { 
                	// jsonObject 에 다시 별점 부트스트랩 적용하기 위해 재선언
                	$('head').append('<script src=\'js/bootstrap4-rating-input.js\'><\/script>');
                	jsonObject = jsonObject.replace(/\n/gi,"\\r\\n");
            		var json = JSON.parse(jsonObject);
            		// 평점 옆 사진 초기화
            		$('.photo ul').html("");
            		// 포토리뷰, 일반리뷰 따로 가져오기 위해 2번 반복
                	for (key in json){
                		jsonReplace = json[key].replace(/\s{2,}/gi,"\\r\\n");
                		var newJson = JSON.parse(jsonReplace);
                		if(newJson.replyList!=null){
	                			
		                	var replyList = newJson.replyList;
		                	var output = "";
		                	output += "<ul class='PR15N01-review-wrap'>";
		                	// 포토 또는 일반 전체 리뷰에 대한 반복문
		                	for (var i = 0; i < replyList.length; i++) {
		                		var isImg = false;
		                		// 리뷰 하나에 대한 반복문	
		   	                	for (var j = 0; j < replyList[i].length; j++) {
		   	                		var reply = replyList[i][j];
		    	                	
		    	                	// 상품 리뷰 관리자 답글
		    	                	if(replyList[i][0].id == 'admin'){
		    	                		if(j==0){
												output += "<li id='power_review_block"+reply.num+"' class='power-review-list-box'>"
															+"<a href='javascript:showReply("+reply.num+");'><span style='color: orange;'>답글이 있습니다!</span></a><br><br>"
															+"<form name='prm_form' id='prm_form"+reply.num+"' method='post' enctype='multipart/form-data' style='display:none;'>"
															+"<div class='comments'>"
															+"<div class='comments__arrow_top'></div>"
															+"<div class='comment__inner'>"
															+"<div class='comment__lpane'>"+reply.id+"</div>"
															+"<div class='comment__rpane'>"
															+"<div class='comment__error_message'></div>";
		    	                		}else if(j == 3){
												output +=	"<div class='comment__message'>"
															+"<span class='comment__message_text'>"+reply.content+"</span>"
															+"</div>";
		    	                		}else if(j == 5){
						    	              output +=		"<div class='flex-w flex-r m-t-10 m-r-40 p-b-0' >";
							                                 +"<a href='javascript:prm_modify("+reply.num+")'>"
						                                 		+"<div class='flex-c-m stext-109 cl6 size-126 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn'>"
																	+"<i class='cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none'></i>"
																		+"수정"
																+"</div>"
							                                 +"</a>"
							                                 +"<a href='javascript:prd_review("+reply.num+")'>"
						                                 		+"<div class='flex-c-m stext-109 cl6 size-126 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn'>"
																	+"<i class='cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none'></i>"
																		+"삭제"
																+"</div>"
							                                 +"</a>"
			    	                    						+"<input type='hidden' id='prm_submit' class='flex-c-m stext-109 cl6 size-126 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn bg-none' "
			    	                    						+"value='수정완료' onclick='javascript:prm_modifySub("+reply.num+")'>"
														+"</div>";
		    	                					}
		    	                	}else{
			    	                	if(j == 0){
												output += "<li id='power_review_block"+reply.num+"' class='power-review-list-box'>"
															+"<form name='prm_form' id='prm_form"+reply.num+"' method='post' enctype='multipart/form-data'>";
												output +=	"<div id='modifyPowerReview'>"
															+"<div id='PR15N01-modify'>"
																+"<dl class='desc'>"
																+"<dt class='first'>작성자</dt>"
																	+"<dd class='re_name'>"+reply.id+"</dd>";
			    	                    }else if(j == 1){
				    	                    output +=		"<dt>작성일</dt><dd class='re_date'>"+reply.date+"</dd>"
				    	                    				+"</dl>";
			    	                    }else if(j == 2){
			    	                    	output +=		"<div class='hd-box'>"
			    	                    			 			+"<div class='star-icon'>"
	    	                    									+"<input type='number' name='starScore' class='rating' id='rating-readonly' data-clearable='remove' value='"+reply.starScore+"' data-readonly/>"
	    	                    								+"</div>"
    	                    						 		+"</div>";
			    	                    }else if(j == 3){
			    	                    	output += 	"<div class='pr-options' style='display: none;'>"
			    	                    					+"<dl><dt class='emp'>구매한 옵션</dt><dd class='emp'>컬러 : BLACK, 사이즈 : S</dd></dl>"
		    	                    				 	+"</div>"
			    	                    			 	+"<div class='content'>"
		    	                    				 		+"<p class='content_p'>"
		    	                    				 			+"<a href='javascript:power_review_more("+reply.num+", '00000');' class='more-options' id='review_content'>"
			    	                    				 		+"<textarea name='content'class='content' disabled style='border:none;resize:none;'>"+reply.content+"</textarea></a>"
				    	                    			 		+"<a class='pr-close' href='javascript:power_review_more_close("+reply.num+");'>... <span>닫기</span></a>"
				    	                    			 	+"</p><div class='ctr'>"
			    	                    			 	 +"</div>";
			    	                    }else if(j == 4 && reply.product_img){
			    	                    	output += 	"<div class='photo-list'>"
				    	                    				+"<ul>"
				    	                    					+"<li>"
				    	                    						+"<a href='javascript:power_review_view_show("+reply.num+", '00000', '0', 'detail');''>"
				    	                    							+"<img src='upload/prodReviewUpload/"+reply.product_img +"'>"
				    	                    						+"</a>"
				    	                    						+"<div class='attach-preview'></div>"
			    	                    						+"</li>"
		    	                    						+"</ul>"
	    	                    						+"</div>";
	    	                    						// 평점 옆 사진 추가 하는 코드
	    	                    						var photoCount = 0;
	    	                    						if(photoCount != 8){
	    	                    							var photo = "<li><img src='upload/prodReviewUpload/"+reply.product_img +"'></li>";
	    	                    							$('.photo ul').append(photo);
	    	                    						}
	    	                    			isImg = true;
			    	                    }else if(j == 5){
			    	                    	output += "<div class='reply'>"
			    	                    				+"<span class='pr-txt'>이 리뷰가 도움이 되셨나요?</span>"
		    	                    					+"<a class='good"+reply.num+"' href='javascript:power_review_rec("+reply.num+","+good+");' >"
		    	                    						+"<span class='imgRecG"+reply.num+"'>";
		    	                    						
		    	                    					// 아이디 값 기반으로 추천을 이미 눌렀을 시 나타나는 이미지 나눔
		    	                    					if(reply.recG == 0){
			    	                    	output +=			"<img src='images/icons/in-love_face_before.png' alt='yes' style='width:15px;height:15px;'>&nbsp";
		    	                    					}else{
  	                    					output +=			"<img src='images/icons/in-love_face.png' alt='yes' style='width:15px;height:15px;'>&nbsp";
		    	                    					}
   	                    					output +=		"</span>"
   	                    									+"<span class='recCount'>"+reply.good+"</span></a>&nbsp"
		    	                    						+"<a class='bad"+reply.num+"' href='javascript:power_review_rec("+reply.num+","+bad+");'>"
		    	                    						+"<span class='imgRecB"+reply.num+"'>";
		    	                    					if(reply.recB == 0){
  	                    					output +=			"<img src='images/icons/angry_face_before.png' alt='no' style='width:15px;height:15px;'>&nbsp";
		    	                    					}else{
  	                    					output +=			"<img src='images/icons/angry_face.png' alt='no' style='width:15px;height:15px;'>&nbsp";
		    	                    					}
		    	                    					
  	                    					output += 		"</span>"
  	                    								+"<span class='recCount'>"+reply.bad+"</span></a>&nbsp"
	    	                    					 	+"</div>";
				   	                 		if(reply.id == member_id){
			    	                    		output +=		"<input type='hidden' name='prm_file' class='trick file-attach' id='prm_file'>";
			    	                    		 output +=		"<div class='flex-w flex-r m-t-10 m-r-40 p-b-0' >"
								                                 +"<a href='javascript:prm_modify("+reply.num+")'>"
							                                 		+"<div class='flex-c-m stext-109 cl6 size-126 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn'>"
																		+"<i class='cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none'></i>"
																			+"수정"
																	+"</div>"
								                                 +"</a>"
								                                 +"<a href='javascript:prd_review("+reply.num+")'>"
							                                 		+"<div class='flex-c-m stext-109 cl6 size-126 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn'>"
																		+"<i class='cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none'></i>"
																			+"삭제"
																	+"</div>"
								                                 +"</a>"
																	+"<i class='cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none'></i>"
									                                +"<input type='hidden' id='prm_submit' value='완료' class='flex-c-m stext-109 cl6 size-126 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn bg-none' onclick='javascript:prm_modifySub("+reply.num+")'>"
															+"</div>";
				    	                    }	
				   	                 		if(member_id == 'admin'){
			    	                    		 output +=		"<div class='flex-w flex-r m-t-10 m-r-40 p-b-0' >"
								                                 +"<a href='javascript:prr_reply("+reply.num+","+reply.re_ref+","+isImg+");'>"
							                                 		+"<div class='flex-c-m stext-109 cl6 size-126 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn'>"
																		+"<i class='cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none'></i>"
																			+"답글"
																	+"</div>"
								                                 +"</a>"
								                                 +"<a href='javascript:prd_review("+reply.num+")'>"
							                                 		+"<div class='flex-c-m stext-109 cl6 size-126 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-btn'>"
																		+"<i class='cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none'></i>"
																			+"삭제"
																	+"</div>"
								                                 +"</a>"
															+"</div>";
				   	                 			}
				   	                 		}
		   	                		}
		                		
	   	                	}// 리뷰 하나에 대한 for 문 => reveiwDetail
	    	                    		output +=		"</div>";
		                				output += 	"<input type='hidden' name='basicCode'  value='"+basicCode+"'>";
		                				output += 	"<input type='hidden' name='prm_num' value='"+reply.num+"'>";
    	                	output += 			"</div>";
    	                	output += 		"</div>";
	                		output +=	"</form>";
    	                	output += "</li>";
    	                	output += "<div class='PR15N01-write prr_reply"+reply.num+"' style='display:none;'></div>";
		   	                
		   	            } // 리뷰 하나 하나에 대한 for 문
            			output+="</ul>";
            			// review paging
            			var pageInfo = paging(newJson.listCount, page, limit);
            			
            			output+="<div class='flex-w w-full p-t-10 m-lr--7 flex-c'>";
                					if(page <= 1){
          				output+=			"<a href='javascript:void(0);' class='flex-c-m how-pagination1 trans-04 m-all-7 active-pagination'>&lt;</a>";
                					}else{
          				output+=			"<a href='javascript:void(0);' class='flex-c-m how-pagination1 trans-04 m-all-7 active-pagination' onclick='location.href='javascript:getReplyCall('"+(page-1)+"');''>&lt;</a>";
                					}
            						for(var i = pageInfo.startPage; i <= pageInfo.endPage; i++){
            							if(i == page){
          				output+=			"<a href='javascript:void(0);' class='flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1'>"+i+"</a>";
            							}else{
          				output+=			"<a href='#powerReview' class='flex-c-m how-pagination1 trans-04 m-all-7 active-pagination2' onclick='javascript:getReplyCall("+i+");'>"+i+"</a>";
            							}
            						}	
                					if(page >= pageInfo.maxPage){
          				output+=			"<a href='javascript:void(0);' class='flex-c-m how-pagination1 trans-04 m-all-7 active-pagination'>&gt;</a>";
                					}else{
          				output+=			"<a href='javascript:void(0);' class='flex-c-m how-pagination1 trans-04 m-all-7 active-pagination'onclick='location.href='javascript:getReplyCall('"+(page+1)+"');''>&gt;</a>";
                					}
            					+"</div>";
            					
            			// 새로고침 시
            			if(loop > 1){
		   	              	if(key == 0){
			   	              	$(".signup-cont").html(output);
			   	            	 $(".photoReview_count").html(newJson.listCount);
		   	              	}else if(key == 1){
			   	              	$(".signin-cont").html(output);
			   	             	$(".review_count").html(newJson.listCount);
		   	              	}
            				totalReview_count += (newJson.listCount*1);
		   	            // 포토 또는 일반리뷰 탭 선택 시
            			}else{
            				if(pic==0){
			   	              	$(".signup-cont").html(output);
			   	            	 $(".photoReview_count").html(newJson.listCount);
        			    	}else{
			   	              	$(".signin-cont").html(output);
			   	             	$(".review_count").html(newJson.listCount);
        			    	}
            				totalReview_count += (newJson.listCount*1);
            			}
            		} // if replyList != null end
           		} // 첫 번째 key in for문
            	$(".totalReview_count").html(totalReview_count);
      		}, // success end
        	error: function(request,status,error){
		      		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    	} // error end
		}) // getReply ajax end
	} // getReply end
	getReplyCall = getReply;
	getReply(); // 해당 페이지 실행 시 해당 함수 호출
// 	ProdReviewRecCount(); // 페이지 실행 시 호출
	
    // paging
    function paging(a,b,c){
    	var listCount = a;
    	var maxPage = Math.ceil(listCount / c * 1);
    	var startPage = Math.floor(b / 10) * 10 +1;
    	var endPage = startPage + 10 -1;
    	
    	if(endPage > maxPage){
    		endPage = maxPage
    	}
    	
    	return {
    		maxPage : maxPage,
    		startPage : startPage,
    		endPage : endPage
    	};
    }; // paging end
    
    // 리뷰 별점 별 카운트
    function starScoreCount(a){
    	$.ajax({
            type: "POST",
    		url: "ProdReviewStar.po",
            data: {
            	basicCode : a
            },
            success: function (json) {
            	var jsonParse = JSON.parse(json);
            	var star = jsonParse.star[0];
            	// 별점 총 갯수
            	var total = jsonParse.total;
           		// 별점 총 합
           		var score = 0;
           		// 별점 호감도 측정
           		var starLike = 0;
           		var starChart = "";
           		
            	for(key in star){
            	if(key > 2){
            		starLike += star[key]*1;
            	}
           		score += key*star[key]*1;
            	starChart += "<li>"
           						+"<span class='tit'>star"+key+"</span>"
           							+"<span class='bar'>"
										+"<span class='abs' style='width: "+(total != 0 ? (100 / total * star[key] * 1) : 0)+"%'></span>"
									+"</span>"
									+"<span class='num'>"+star[key]+"</span>"
							+"</li>";
            		
            	}
           		var like = "<strong>"+ (total != 0 ? (starLike / total * 100).toFixed(1):0)+"%</strong>의 구매자들이 이 상품을 좋아합니다. ("+total+"명 중 "+starLike+"명)";
            		if(total == 0){
						result = 0;            			
            		}else{
	           			result = (score / total *1).toFixed(1);
            		}
            		
            		$('.like').html(like);
            		$('.chart ul').html(starChart);
            		$('.score dt').html(result);
            		$('.score span').html(total);
            	
            },
    		error: function(request,status,error){
    	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    	       }
    	}); // end ajax
    }
    
    // 포토, 일반 리뷰 탭 기능
	$('.tabs .tab').click(function(){
		if ($(this).hasClass('signin')) {
			$('.tabs .tab').removeClass('active');
			$(this).addClass('active');
			$('.signin-cont').css('display','none');
			$('.signup-cont').css('display','block');
		}else if ($(this).hasClass('signup')) {
			$('.tabs .tab').removeClass('active');
			$(this).addClass('active');
			$('.signup-cont').css('display','none');
			$('.signin-cont').css('display','block');
		}
	}); // tabs click function end
	
	// 최신순, 호감순, 추천순 정렬 기능 탭
 	$('.sort li').click(function(){
		if (!$(this).hasClass(this)) {
			$('.sort li').removeClass('now');
			$(this).addClass('now');
		}
	}); // tabs click function end
	
 	//==================== 상세 이미지 보기  ====================//
// 		$(document).on("click", ".photo-list", function () {
		function power_review_view_show(){
			
				 var a = $(this).parents('li'); 
				 var content = a.find('.content').text();
				 var img = a.find('#img').val();
				 var name = a.find('.re_name').text();
				 var date = a.find('.re_date').text();
				 
				 var output = ""; 
				 output += "<div id='inline' style='max-width:600px; display: none;'>"
	 					  +"<div class='popup-img'><img src='upload/prodReviewUpload/"+img+"' width='100%' height='auto'></div>"
	 					  +"<div class='popup-txt' style='margin-top:20px;'>"+content+"</div>"
	 					  +"<div class='popup-name-date' style='padding-top:10px; margin-top:30px; border-top:1px solid #ccc;'><b>작성자</b> : "+name+" | <b>작성일</b> : "+date+"</div></div>"
				 
				 $("#image_view_load").html(output); 
				 $(".fancybox").trigger("click");
		}
// 		});

});

	// 상품 리뷰 수정 폼 활성화
	function prm_modify(num){
			$('#prm_form'+num+' :input').attr('disabled',false);
			$('#prm_form'+num+' textarea').css('border','1px solid black');
			$('#prm_form'+num+' #prm_file').prop('type','file');
			$('#prm_form'+num+' #prm_submit').prop('type','button');
	} // end prm_modify

// 상품 리뷰 수정 처리
function prm_modifySub(num){
	var form = $('#prm_form'+num)[0];
    var data = new FormData(form);
	$.ajax({
        type: "POST",
		enctype: 'multipart/form-data',
		url: "ProdReviewModify.po",
		processData: false,
        contentType: false,
        data: data,
        success: function () {
        	alert("리뷰 수정 완료");
        	getReplyCall();
        },
		error: function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	}); // end ajax
} // end prm_modifySub

// 상품 리뷰 답글 폼 끼워넣기
function prr_reply(num,re_ref,isImg){
	$(function(){
		// reivew comment 폼 생성		
		var newform = $('<form></form>');
		newform.attr("name","prr_reply");
		newform.attr("method","post");
		newform.attr("action","");
		// set attribute(input)
		newform.append($('<textarea/>',{name: 'content', id: 'prr_content'}));
		newform.append($('<input/>',{type: 'button', value: '전송', onclick: 'prr_replySub('+num+","+re_ref+","+isImg+')'}));
		// append 
		newform.appendTo('.prr_reply'+num);
		$('.prr_reply'+num).css('visibility','visible');
	});
};

// 상품 리뷰 답글 처리
function prr_replySub(num,re_ref,isImg){
	var basicCode = '<%=basicCode%>' ;
	if($("#prr_content").val().trim() === ""){
		alert("리뷰를 입력하세요.");
		$("#prr_content").val("").focus();
	}else{
		$.ajax({
            type: "POST",
			url: "ProdReviewReply.po",
            data: {
            	content : $('#prr_content').val(),
            	basicCode : basicCode,
            	re_ref : re_ref,
            	isImg : isImg
            },
            success: function () {
               alert("리뷰 수정 완료");
               getReplyCall();
            },
			error: function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		}); // ajax 종료
	}; // else end
}

// 리뷰 삭제
function prd_review(num){
	// 예 -> 삭제, 아니오 -> 취소
    if(!confirm("정말 삭제하시겠습니까?")){
    	return;
    }else{
   		$.ajax({
               type: "POST",
   			url: "ProdReviewDelete.po",
               data: {
               	num:  num
               },
               success: function () {
               	alert("리뷰 삭제 완료");
               	getReplyCall();
               },
   			error: function(request,status,error){
   		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   		       }
   		})// end ajax
	 }
}

</script>
<script type="text/javascript">
// 상품 리뷰 추천
	// 추천버튼 클릭시(추천 추가 또는 추천 제거)
	var member_id = '<%=member_id%>';
	
	function power_review_rec(num,recommand){
		
		if(member_id=='null'){
			if(!confirm("로그인을 하셔야 이용 가능합니다. 로그인을 하시겠습니까?")){
				return;
			}else{
				location.href='MemberLoginForm.mo';
			}
		}else{
			$.ajax({
				url: "ProdReviewRec.po",
	               type: "POST",
	               data: {
	                   num: num,
	                   recommand : recommand
	               },
	               success: function (isRec) {
            		   var goodAf ="in-love_face.png";
            		   var goodBe ="in-love_face_before.png";
            		   var badAf ="angry_face.png";
            		   var badBe ="angry_face_before.png";
            		   
           			   // recommand = 0 -> good, 1 -> bad 
            		   //isRec = 0 -> 리뷰 추천했을 때 이미지로 변경, 1 -> 리뷰 추천 취소했을 때 이미지로 변경
            		   img = (recommand == 0 ? (isRec == 0 ? goodAf : goodBe) : (isRec == 0 ? badAf : badBe));
            		   alt = (recommand == 0 ? 'yes' : 'no');
           			   var imgResult = "<img src='images/icons/"+img+"' alt='"+alt+"' style='width:15px;height:15px;'>&nbsp";
           			   
	            	   if(recommand == 0){
            			   $('.imgRecG'+num).html(imgResult);
	            	   }else{
            			   $('.imgRecB'+num).html(imgResult);
	            	   }
			        ProdReviewRecCount(num,recommand);
	               },
	               error: function(request,status,error){
	      		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	      		       }
			})
		}
	}
	// 리뷰 추천 수
    function ProdReviewRecCount(num,rec) {
        var rec = rec; // good, bad 판별 변수
        if(rec == null){
        }
		$.ajax({
			url: "ProdReviewRecCount.po",
               type: "POST",
               data: {
                   num: num,
                   recommand : rec
               },
               success: function (count) {
            	   if(rec == 0){
	               	$(".good"+num+" .recCount").html(count);
            	   }else{
	               	$(".bad"+num+" .recCount").html(count);
            	   }
               },
               error: function(request,status,error){
      		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      		       }
		})
    };
//     setInterval(function(){
//     	$('.rating-input').toggle();
//     },100);
</script>
<script>
$(function(){
	// qna 제목 클릭 시 내용 보여주기
	$('.nbg').click(function(){
		
		if($(this).next().css('display')=='none'){
			var num = $(this).find('.qnanum').text();
         	var hit = $(this).find('#qna_board_showhits1');
			// 조회수 증가
			$.ajax({
				url: "ProdQnaUpReadcount.po",
	               type: "POST",
	               data: {
	                   num: num
	               },
	               success: function (count) {
	            	   $(hit).html(count);
	               },
	               error: function(request,status,error){
	      		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      		       }
			})
		}
		$(this).next().toggle();
		
	});
	
});
</script>
<script type="text/javascript">
// qna 비회원이 글 쓰려고 할 시 로그인 유도
$(function(){
	$('.btm_write').click(function(){
		var member_id = '<%=member_id%>';
		if(member_id == 'null'){
			if(!confirm("로그인을 하셔야 이용 가능합니다. 로그인을 하시겠습니까?")){
				return false;
			}else{
				location.href="MemberLoginForm.mo";
				return false;
			}
		}
	});
});

//review 답글 클릭 시 보여주기
function showReply(num){
	$(function(){
		var form = $('#prm_form'+num).css('display');
		if(form == 'table-row' || form == 'inline' || form == 'block'){
			$('#prm_form'+num).css('display','none');
		}else {
			$('#prm_form'+num).css('display','inline').focus();
		}
	});
}
</script>
<script>
	// tabmenu 수량 호출
	function getCount(){
		var basicCode = "<%=basicCode%>";
		$.ajax({
			url: "ProdGetCount.po",
               type: "POST",
               data: {
                   basicCode: basicCode
               },
               success: function (json) {
            	   var count = JSON.parse(json);
            	   for(key in count){
						$(".count"+key).html(count[key]);
            	   }
            	   
               },
		})
	};
	getCount();
</script>
<script type="text/javascript">
   var _gaq = _gaq || [];
   _gaq.push(['_setAccount', 'UA-36251023-1']);
   _gaq.push(['_setDomainName', 'jqueryscript.net']);
   _gaq.push(['_trackPageview']);
   (function() {
      var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
   })();
//    try {
//       fetch(new Request("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js", { method: 'HEAD', mode: 'no-cors' })).then(function(response) {
//          return true;
//       }).catch(function(e) {
//          var carbonScript = document.createElement("script");
//          carbonScript.src = "//cdn.carbonads.com/carbon.js?serve=CK7DKKQU&placement=wwwjqueryscriptnet";
//          carbonScript.id = "_carbonads_js";
//          document.getElementById("carbon-block").appendChild(carbonScript);
//       });
//    } catch (error) {
//       console.log(error);
//    }


   /* detail_tabmenu 클릭한 #page01에 스크롤 on */
   $('.detail_tabmenu ul li').click(function(){
      $('.detail_tabmenu ul li').removeClass('on');
      $(this).addClass('on');
   });

//    카카오톡으로 공유하기 

	Kakao.init('b62680a32c7f417cd4c5fd9d43ddd2e0');
   function sendLink() {
	    Kakao.Link.createDefaultButton({
	    	container: '#kakao-link-btn',
	      objectType: 'feed',
	      content: {
	        title: '<%=productDetailList.get(0).getName() %>',
	        description: '상품 공유',
	        imageUrl:
	          'upload/productUploadImg/<%=main[0] %>',
	        link: {
	          mobileWebUrl: 'http://localhost:8090/Itwillbs_8/ProductDetail.po?basicCode=<%=basicCode%>',
	          webUrl: 'http://localhost:8090/Itwillbs_8/ProductDetail.po?basicCode=<%=basicCode%>',
	        },
	      },
	      social: {
	        likeCount: 286,
	        commentCount: 45,
	        sharedCount: 845,
	      },
	      buttons: [
	        {
	          title: '웹으로 보기',
	          link: {
	            mobileWebUrl: 'http://localhost:8090/Itwillbs_8/ProductDetail.po?basicCode=<%=basicCode%>',
	            webUrl: 'http://localhost:8090/Itwillbs_8/ProductDetail.po?basicCode=<%=basicCode%>',
	          }
	        }]
	    })
	  }
		
			
</script>
<script type="text/javascript"
   src="fancybox/source/jquery.fancybox.js?v=2.1.5"></script>
<link rel="stylesheet" type="text/css"
   href="fancybox/source/jquery.fancybox.css?v=2.1.5" media="screen" />
<script type="text/javascript">
$(document).ready(function() {
    $('.fancybox').fancybox();
});
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!-- 스크립트파일끝 -->

 <jsp:include page="/inc/footer.jsp" />