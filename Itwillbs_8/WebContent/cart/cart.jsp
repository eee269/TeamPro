<%@page import="vo.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
   ArrayList<Cart> cartList = (ArrayList<Cart>) request.getAttribute("cartList");

int coin = 0;
int cartNo = cartList.size();
int num = 0;
int cntSet = 0;
%>
<script src="js/bootstrap4-rating-input.js"></script>
<style type="text/css">
.rat {
   margin: 150px auto;
   font-size: 20px;
}

#emptyArea {
   margin: auto;
   width: 1024px;
   text-align: center;
}
.d-block a:hover{
  background-color: #717fe0;
}
.tb-center a:hover{
  background-color: #717fe0;
}

#whiteBu:hover{color:#fff;}

.btn-dw {
   width: 20px;
   height: 40px;
   background-color: white;
}

.btn-up {
   width: 20px;
   height: 40px;
   background-color: white;
}

</style>
<script type="text/javascript" src=js/bootstrap4-rating-input.js></script>
<script type="text/javascript" src=js/jquery-3.5.1.js></script>
<script type="text/javascript">
  $(document).ready(function(){

  }
  </script>




<jsp:include page="/inc/header.jsp" />

<!-- Cart -->


<!-- breadcrumb -->
<div class="container">
   <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
      <a href="index.html" class="stext-109 cl8 hov-cl1 trans-04"> Home
         <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
      </a> <span class="stext-109 cl4"> Shoping Cart </span>
   </div>
</div>

<link type="text/css" rel="stylesheet" href="scss/common.css" />
<link type="text/css" rel="stylesheet" href="scss/basket.css" />
<link type="text/css" rel="stylesheet" href="scss/header.1.css" />
<link type="text/css" rel="stylesheet" href="scss/menu.1.css" />
<!-- Shoping Cart 시작
<input type="hidden" name="num" value="" />-->

<div id="content">
   <div id="cartWrap">
      <dl class="loc-navi">
         <dt class="blind">현재 위치</dt>
         <dd>
            <a href="/">HOME</a> &gt; CART
         </dd>
      </dl>

      <form action="CartDelete.ca" method="post" name="cartForm">

         <h2 class="tit-page">장바구니</h2>
         <div class="page-body">
            <div class="table-cart table-fill-prd">
               <table summary="번호, 사진, 제품명, 수량, 기본금액, 가격, 배송비, 취소">
                  <caption>장바구니 담긴 상품</caption>

                  <colgroup>
                     <col width="75">
                     <col width="90">
                     <col width="*">
                     <col width="115">
                     <col width="95">
                     <col width="105">
                     <col width="95">
                     <col width="95">
                     <col width="95">
                  </colgroup>
                  <thead>
                     <tr>
                        <th scope="col"><div class="tb-center">번호</div></th>
                        <th scope="col"><div class="tb-center">사진</div></th>
                        <th scope="col"><div class="tb-center">상품명</div></th>
                        <th scope="col"><div class="tb-center">수량</div></th>
                        <th scope="col"><div class="tb-center">기본금액</div></th>
                        <th scope="col"><div class="tb-center">금액</div></th>
                        <th scope="col"><div class="tb-center">배송비</div></th>
                        <th scope="col"><div class="tb-center">취소</div></th>
                        <th scope="col"><div class="tb-center">
                        
                        
                        <!---------------------------------- tr 체크박스  ------------------------------------>
                        
                              <input type="checkbox" id="allCheck" class="checkSelect" name="tr-check" >
                              
                        <!---------------------------------- tr 체크박스  ------------------------------------>
                              
                           </div></th>
                     </tr>
                  </thead>


                  <tbody>

                     <%
                        for (int i = 0; i < cartList.size(); i++) {
                        if (cartList.size() > 0) {
                     %>
                     <input type="hidden" name="num" value="<%=cartList.get(i).getNum()%>">
                        
                     <%
                        }
                     coin += cartList.get(i).getPrice();
                     %>
                     <tr class="nbg">
                        <!-- 2019.07.03 -->


                        <td><div class="tb-center">

                              <%=cartNo%>


                           </div></td>


                        <td>
                           <div class="tb-center">
                              <div class="thumb">
                                 <a href=""><img
                                    src="http://oryany.co.kr/shopimages/nasign/0010010007533.jpg?1597366090"
                                    alt="상품 섬네일" title="상품 섬네일" width="1"></a>
                              </div>
                           </div>
                        </td>
                        <td>
                           <div class="tb-left">
                              <a href="" class="tb-bold"><%=cartList.get(i).getProduct_name()%></a>
                              <div id="3360797_1" class="tb-opt">
                                 <span class="tb-dl"><span class="opt_dd">색상 : <%=cartList.get(i).getColor()%></span></span>
                              </div>
                              <div id="3360797_1" class="tb-opt">
                                 <span class="tb-dl"><span class="opt_dd">사이즈 :
                                       <%=cartList.get(i).getSize()%></span></span>
                              </div>
                           </div>
                        </td>
                        <td>
                           <!-- ------------------------------------수량 업다운 --------------------------------------------------------------------------------- -->
                           <div class="tb-center">
<!--                               <div class="opt-spin"> -->
<!--                      <span class="btns"> -->
                     <input type="button" id="btn-down<%=i%>" class="btn-dw"   onclick="cntDown(this.id)" value="-"  style="cursor:pointer" >
                     <input type="text" id="btn-num<%=i%>" name="amount"    value="<%=cartList.get(i).getCnt() %>" class="txt-spin"> 
                        <input type="button" id="btn-up<%=i%>" class="btn-up" onclick="cntUp(this.id)" style="cursor:pointer" value="+">
<!--                                  </span> -->
<!--                               </div> -->
                              <a class="CSSbuttonWhite btn_option" id="btn-Save<%=i %>" onclick="cntUpdate(<%=cartList.get(i).getNum()%>, this.id)" >EDIT</a>
                           </div> <!-- ----------------------------------------------------------------------------------------------------------------------------------- -->


                     
                        </td>
                        <td><div class="tb-center "><span class="back"><b><%=cartList.get(i).getPrice()%></b></span>원</div></td>
                        <td><div class="tb-center tb-bold tb-price">
                        <%
                         cntSet = cartList.get(i).getCnt() * cartList.get(i).getPrice() ;
                        %>
                              <span><%=cntSet %></span>원
                           </div></td>
                        <td><div class="tb-center tb-delivery">
                              <div class="MS_tb_delivery">
                                 <div id="deliverycase0" class="MS_layer_delivery">

                                    <dl>
                                       <dt>기본배송</dt>
                                    </dl>

                                 </div>
                              </div>
                           </div></td>
                        <td>
                           <div class="tb-center">
                              <span class="d-block"><a
                                 onclick="location.href='CartDelete.ca?chk=<%=cartList.get(i).getNum()%>'"
                                 class="CSSbuttonWhite btn_select">DELETE</a></span>
                           </div>
                        </td>
                        
                        
                        
                        
                           <!-- ------------------------------------------------------------체크박스--------------------------------------------- -->
                           
                           
                        <td align="center">
                        <input type="checkbox" name="chk"  id="chk-num<%=i %>" class="checkSelect" value="<%=cartList.get(i).getNum()%>" >
                           <input type="hidden" name="checkNum" value="<%=cartList.get(i).getNum()%>"> 
                           
                           <!-- ---------------------------------------------------------------------------------------------------------------------- -->
                           
                           
                           
                           
                           
                           
                           <input   type="hidden" name="basket_item" value="{&quot;uid&quot;:&quot;3360797&quot;,&quot;cart_id&quot;:&quot;1&quot;,&quot;cart_type&quot;:&quot;NORMAL&quot;,&quot;pack_uid&quot;:&quot;&quot;,&quot;use_tax&quot;:&quot;N&quot;}">
                           <input type="hidden" name="extra_item"
                           value="{&quot;extra_require_uid&quot;:null,&quot;extra_require&quot;:null,&quot;extra_main_brandname&quot;:&quot;&quot;}"></td>
                     </tr>
                     <%
                        cartNo--;

                     }
                     %>

                  </tbody>
                  <tfoot>
                     <tr>
                        <td colspan="8">
                           <div class="tb-right">
                              <span class="MK_none_groupsale_total_price_sell"> 
                              총구매금액<span class="MK_chg_none_groupsale_total_price_sell MK_change_price"><b class = "price-b">0</b></span>원
                              </span><span class="MK_total_delivery">+ 배송비<span
                                 class="MK_chg_total_delivery MK_change_price"><b class="delivery-b">0</b></span>원
                              </span> = <strong><span class="MK_total_price"><span class="MK_chg_total_price MK_change_price"></span><b class="total-b">0</b>원</span></strong><br>
                           </div>
                        </td>
                     </tr>
                  </tfoot>

               </table>
            </div>
            <!--          .table-fill-prd -->

            <div class="btn-order-ctrl">
               <a href="javascript:multi_order()" class="CSSbuttonBlack">주문하기</a>
               <a href="Main.go" class="CSSbuttonWhite">계속 쇼핑하기</a>
                <a   class="CSSbuttonWhite" id ="whiteBu"onclick="document.cartForm.submit()">장바구니 비우기</a>
            </div>

            <!--          .table-fill-prd -->
         </div>
      </form>
      <!-- .page-body -->
   </div>
   <!-- #cartWrap -->
</div>
<!-- Shoping Cart 끝 -->


<script type="text/javascript">
//----------------------------------tr 체크박스 선택 , 해제  및   tr 체크박스 선택시 총금액 계산-------------------------------------------------------------------
// 체크박스 선택 전 전체선택 div 숨기기
$('#whiteBu').hide();
   
$("#allCheck").click(function(){
     // 전체 선택
      if($("#allCheck").prop("checked")){   // 맨위 체크박스가 체크되면  
          $("input[name=chk]").prop("checked",true); // td 체크박스도 전체체크
       // tr 체크박스 누르면 총 금액  표시
         $("#allCheck").click(function(){  
           var rowData = new Array();
           var tdArr = new Array();
           var checkbox = $("input[name=chk]:checked");
           var chArr = new Array();   //체크박스 배열
           var chCoin = 0;    // 총합
           var sevice = 2500;   // 배송비

        
           // 체크된 체크박스 값을 가져온다
           checkbox.each(function(i) {
              // checkbox.parent() : checkbox의 부모는 <td>이다.
              // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
              var tr = checkbox.parent().parent().eq(i);
              var td = tr.children();
              
              // 체크된 row의 모든 값을 배열에 담는다.
              rowData.push(tr.text());
              
              // 0번 num값
              var in0 = td.eq(0).text();
              // 1번 사진 -> PASS
              // 2번  상품명 (상품명 , 색상 , 사이즈)
              var in2 = td.eq(2).text();
              // cnt => input type="text" 벨류 값 가져오기  
              var in3 = Number(td.eq(3).find('.txt-spin').val());
              // 4번 상품 기본금액
              var in4 = td.eq(4).text();
              // 숫자 뒤에 원 없애기
              in4 = Number(in4.substr(0, in4.length -1));        
//               alert(in4);
              
              // 가져온 값을 배열에 담는다.
              tdArr.push(in3);
              tdArr.push(in4);

              sum = in3 * in4;
              // chArr 에 합친 값 저장
              chArr.push(sum);
           });
           
           // 포문으로 chArr 의 길이만큼 돌림
           // chCoin 에 chArr 의 값을 더함
           for(var i = 0; i < chArr.length; i++){
               chCoin = Number(chCoin) + Number(chArr[i]);

           }
           // chCoin 이 0원 이면 텍스트에 0원 표시
            if(chCoin == 0){
               $('.price-b').text(' 0'); 
           // chCoin 이 0보다 크면 가격 표시
            } else if(chCoin > 0){
               $('.price-b').text(chCoin);
               
            }
           
           // 30000원 이상이면 배송비 0 
           if(chCoin >= 30000 || chCoin == 0){
              sevice = 0;
               $('.delivery-b').text(sevice);
           } else if(chCoin < 30001){
              sevice = 2500;
              $('.delivery-b').text(sevice); 
           }
           
           // 총 합계 
           $('.total-b').text(chCoin + sevice); 
              
           });
          
     // 전체 해제
      } else {   // 맨위 체크박스가 해제되면 
          $("input[name=chk]").prop("checked",false);   // td도 해제
   
      }
  });
   
// --------------------------------------------td 금액계산------------------------------------------------------
       // td 체크박스 누르면 총 금액  표시
      // 체크박스 선택된 한줄 값 가져오기
      $(".checkSelect").click(function(){ 
         var rowData = new Array();
         var tdArr = new Array();
         var checkbox = $("input[name=chk]:checked");
         var chArr = new Array();
         var chCoin = 0;
         var sevice = 2500;
      
         // 체크된 체크박스 값을 가져온다
         checkbox.each(function(i) {
            // checkbox.parent() : checkbox의 부모는 <td>이다.
            // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
            var tr = checkbox.parent().parent().eq(i);
            var td = tr.children();
            
            // 체크된 row의 모든 값을 배열에 담는다.
            rowData.push(tr.text());
            
            // 0번 num값
            var in0 = td.eq(0).text();
            // 1번 사진 -> PASS
            // 2번  상품명 (상품명 , 색상 , 사이즈)
            var in2 = td.eq(2).text();
            // cnt => input type="text" 벨류 값 가져오기  
            var in3 = Number(td.eq(3).find('.txt-spin').val());
            // 4번 상품 기본금액
            var in4 = td.eq(4).text();
            // 숫자 뒤에 원 없애기
            in4 = Number(in4.substr(0, in4.length -1));        
//             alert(in4);
            
            // 가져온 값을 배열에 담는다.
            tdArr.push(in3);
            tdArr.push(in4);

            sum = in3 * in4;
            // chArr 에 합친 값 저장
            chArr.push(sum);

         
         });
         
         // 포문으로 chArr 의 길이만큼 돌림
         // chCoin 에 chArr 의 값을 더함
         for(var i = 0; i < chArr.length; i++){
             chCoin = Number(chCoin) + Number(chArr[i]);
         }
         // chCoin 이 0 이면 텍스트에 아무것도 안보이게
          if(chCoin == 0){
             $('.price-b').text(' 0'); 
         // chCoin 이 0보다 크면 가격 뿌려주기
          } else if(chCoin > 0){
             $('.price-b').text(chCoin);
          }
         
         // 배송비 30000 이상이면 0 
         if(chCoin >= 30000 || chCoin == 0){
            sevice = 0;
          $('.delivery-b').text(sevice); 
           
         } else if(chCoin < 30000){
            sevice = 2500;
            $('.delivery-b').text(sevice); 
         }
         
         // 총 합계 
         $('.total-b').text(chCoin + sevice);

         
         
         // 체크선택이 안되면 삭제div 숨기고 , 체크박스가 1개 이상 체크 되면 삭제div 보이기 
         //  tr 선택도 포함
         var chLe = $(".checkSelect:checked").length;   // 체크된 체크박스 길이
         if(chLe == 0){
            $('#whiteBu').hide();   // 체크박스가 선택이 안됐을때 숨기기 
         } else if(chLe >= 1){
            $('#whiteBu').show(); // 체크박스가 선택이 됐을때 보이기 
         }
         
         });
      
   
// -------------------------------------------------------------------------------------------------
      
      // 상품개수증가
     function cntUp(id) {
         var numid = id.replace("up", "num");
         var result = parseInt(numid)+1
         var cnt = Number($('#'+numid).val());
         cnt += 1;
         
         $('#'+numid).val(cnt);
      };
      
      // 상품개수감소
      function cntDown(id) {
         var numid = id.replace("down", "num");
         
         var cnt = Number($('#'+numid).val());
         if(cnt > 1) {
            cnt -= 1;
            $('#'+numid).val(cnt);
         }
      };
      
      // 수량 변경
      function cntUpdate(num , id){
         
         var numid = id.replace("Save", "num");
         var cnt = Number($('#'+numid).val());
         alert(cnt);
         
      location.href='CartUpdate.ca?num='+num+'&cnt='+cnt+'&member_id=dodo';
      
      };
      
      
   

      
      
       
</script>



<jsp:include page="../inc/footer.jsp" />