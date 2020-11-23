<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page="/inc/header.jsp" />
<!-- QuickMenu -->
<jsp:include page="/quickMenu.jsp" />




<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품업로드</title>
<%
// 세션 판별


%>
<script type="text/javascript">

// 1. 대분류 선택시 소분류 visibility

function ncode(val) {
	if(val == "CLOTHES") {
		// 소분류 radio 보여주기 / 감추기
		$('div#clothncode').css('visibility', 'visible');
		$('div#bagncode').css('visibility', 'hidden');
		$('div#shoencode').css('visibility', 'hidden');
		
		// 보여지는 소분류 radio 필수항목 설정
		$('input:radio[name=clothes]').attr('required', true);
		$('input:radio[name=bags]').attr('required', false);
		$('input:radio[name=shoes]').attr('required', false);
		
		// 항목별 사이즈 보여주기 / 감추기
		$('div#clothsize').css('visibility', 'visible');
		$('div#bagsize').css('visibility', 'hidden');
		$('div#shoesize').css('visibility', 'hidden');
		
		// 체크된 항목 초기화
		$('input[type=checkbox]').prop('checked',false);
	} else if(val == "BAGS") {
		$('div#clothncode').css('visibility', 'hidden');
		$('div#bagncode').css('visibility', 'visible');
		$('div#shoencode').css('visibility', 'hidden');
		
		// 보여지는 소분류 radio 필수항목 설정
		$('input:radio[name=clothes]').attr('required', false);
		$('input:radio[name=bags]').attr('required', true);
		$('input:radio[name=shoes]').attr('required', false);
		
		$('div#clothsize').css('visibility', 'hidden');
		$('div#bagsize').css('visibility', 'visible');
		$('div#shoesize').css('visibility', 'hidden');
		
		$('input[type=checkbox]').prop('checked',false);
	} else if(val == "SHOES") {
		$('div#clothncode').css('visibility', 'hidden');
		$('div#bagncode').css('visibility', 'hidden');
		$('div#shoencode').css('visibility', 'visible');
		
		// 보여지는 소분류 radio 필수항목 설정
		$('input:radio[name=clothes]').attr('required', false);
		$('input:radio[name=bags]').attr('required', false);
		$('input:radio[name=shoes]').attr('required', true);
		
		$('div#clothsize').css('visibility', 'hidden');
		$('div#bagsize').css('visibility', 'hidden');
		$('div#shoesize').css('visibility', 'visible');
		
		$('input[type=checkbox]').prop('checked',false);
	}
	
}

function checkboxswift() {
	var colorLength = $('input:checkbox[name=goods_color]:checked').length;
	var sizeLength = $('input:checkbox[name=goods_size]:checked').length;
	
	if(colorLength == 0) {
		alert("색상을 선택하세요");
		return ;
	} else if(sizeLength == 0){
		alert("사이즈를 선택하세요");
		return ;
	}
	
// 	$('input:checkbox[name=goods_color]:checked').each(function() {
// 		colorVal += $(this).val() + "/";
// 	});
// 	$('input:checkbox[name=goods_size]:checked').each(function() {
// 		sizeVal += $(this).val() + "/";
// 	});
	
	$('#colorLen').val(colorLength);
	$('#sizeLen').val(sizeLength);
	
// 	alert("color: " + colorVal + ", size: " + sizeVal);
	
	$('#productUpload').submit();
}

</script>

</head>
<body>
	<h1 style="margin: 50px 100px">Product Upload</h1>

	<form id="productUpload" method="post" action="ProductUploadPro.po"
	enctype="multipart/form-data" onsubmit="checkboxswift()">
		<table
			style="border: 0.3px solid lightgray; text-align: center; margin: 100px 50px; width: 80%; min-height: 500px;">
			<tr>
				<th>썸네일 이미지</th>
				<th colspan="2">상품 세부사항</th>
			</tr>
			<tr>
				<td><input type="file" name="mfile1" id="mfile1"
					style="padding: 10px 25px;" required="required"></td>
				<td><b>상품이름</b></td>
				<td><input type="text" id="goods_name" name="goods_name"
					style="border-bottom: 0.3px solid lightgray; width: 400px" required="required"></td>
			</tr>
			<tr>
				<td><input type="file" name="mfile2" id="mfile2"
					style="padding: 10px 25px;"></td>
				<td><b>가 격</b></td>
				<td><input type="text" id="goods_price" name="goods_price"
					style="border-bottom: 0.3px solid lightgray; width: 400px" required="required"></td>
			</tr>
			<tr>
				<td><input type="file" name="mfile3" id="mfile3"
					style="padding: 10px 25px;"></td>
				<td><b>대분류</b></td>
				<td>
					<input type="radio" name="xcode" value="CLOTHES" style="width: 100px" onchange="ncode(this.value)" required="required"><span>Clothes</span>
					<input type="radio" name="xcode" value="BAGS" style="width: 100px" onchange="ncode(this.value)"><span>Bags</span>
					<input type="radio" name="xcode" value="SHOES" style="width: 100px" onchange="ncode(this.value)"><span>Shoes</span>
				</td>
			</tr>
			<tr>
				<th>세부 설명 이미지</th>
				<td><b>소분류</b></td>
				<td>
					<div id="clothncode" style="visibility: hidden; padding: 5px">
						<input type="radio" name="clothes" value="TOP" style="width:80px"> <span>Top</span>
						<input type="radio" name="clothes" value="BOTTOM" style="width:80px"> <span>Bottom</span>
						<input type="radio" name="clothes" value="DRESS" style="width:80px"> <span>Dress</span>
						<input type="radio" name="clothes" value="OUTER" style="width:80px"> <span>Outer</span>
					</div>
					<div id="bagncode" style="visibility: hidden; padding: 5px">
						<input type="radio" name="bag" value="CROSS" style="width:80px"> <span>Cross</span>
						<input type="radio" name="bag" value="BUCKET" style="width:80px"> <span>Bucket</span>
						<input type="radio" name="bag" value="SHOULDER" style="width:80px"> <span>Shoulder</span>
						<input type="radio" name="bag" value="TOTE" style="width:80px"> <span>Tote</span><br>
						<input type="radio" name="bag" value="CLUTCH" style="width:80px"> <span>Clutch</span>
						<input type="radio" name="bag" value="SHOPPER" style="width:80px"> <span>Shopper</span>
						<input type="radio" name="bag" value="BACKPACK" style="width:80px"> <span>Backpack</span>
					</div>
					<div id="shoencode" style="visibility: hidden; padding: 5px">
						<input type="radio" name="shoes" value="SNEAKERS" style="width:100px"> <span>Sneakers</span>
						<input type="radio" name="shoes" value="BOOTS" style="width:100px"> <span>Boots</span>
						<input type="radio" name="shoes" value="LOAFERS" style="width:100px"> <span>Loafers</span><br>
						<input type="radio" name="shoes" value="SANDALS" style="width:100px"> <span>Sandals</span>
						<input type="radio" name="shoes" value="SLIPPER" style="width:100px"> <span>Slipper</span>
					</div>
				</td>
			</tr>
			<tr>
				<td><input type="file" name="sfile1" id="sfile1" style="padding: 10px 25px;" required="required"></td>
				<td><b>색상</b></td>
				<td>
					<input type="checkbox" name="goods_color" value="BK" style="width: 100px"><span>Black</span>
					<input type="checkbox" name="goods_color" value="WH" style="width: 100px"><span>White</span>
					<input type="checkbox" name="goods_color" value="GR" style="width: 100px"><span>Gray</span><br>
					<input type="checkbox" name="goods_color" value="RD" style="width: 100px"><span>Red</span>
					<input type="checkbox" name="goods_color" value="BL" style="width: 100px"><span>Blue</span>
					<input type="checkbox" name="goods_color" value="PK" style="width: 100px"><span>Pink</span>
				</td>
			</tr>
			<tr>
				<td><input type="file" name="sfile2" id="sfile2"
					style="padding: 10px 25px;"></td>
				<td><b>사이즈</b></td>
				<td>
					<div id="clothsize" style="visibility: hidden">
						<input type="checkbox" name="goods_size" value="S" style="width: 100px"><span>S</span>
						<input type="checkbox" name="goods_size" value="M" style="width: 100px"><span>M</span>
						<input type="checkbox" name="goods_size" value="L" style="width: 100px"><span>L</span>
						<input type="checkbox" name="goods_size" value="XL" style="width: 100px"><span>XL</span>
					</div>
					<div id="bagsize" style="visibility: hidden">
						<input type="checkbox" name="goods_size" value="FR" style="width: 100px"><span>Free</span>
					</div>
					<div id="shoesize" style="visibility: hidden">
						<input type="checkbox" name="goods_size" value="230" style="width: 100px"><span>230</span>
						<input type="checkbox" name="goods_size" value="240" style="width: 100px"><span>240</span>
						<input type="checkbox" name="goods_size" value="250" style="width: 100px"><span>250</span><br>
						<input type="checkbox" name="goods_size" value="260" style="width: 100px"><span>260</span>
						<input type="checkbox" name="goods_size" value="270" style="width: 100px"><span>270</span>
						<input type="checkbox" name="goods_size" value="280" style="width: 100px"><span>280</span>
					</div>
				</td>
			</tr>
			<tr>
				<td><input type="file" name="sfile3" id="sfile3"
					style="padding: 10px 25px;"></td>
				<td>상품 수량</td>
				<td><input type="text" name="goods_stock" id="goods_stock"
				style="border-bottom: 0.3px solid lightgray; width: 400px"  required="required"></td>
			</tr>
			
		</table>
			<br>
			<input type="submit" value="상품 등록" style="padding:10px 25px; text-align: right;">
		
		
		<input type="hidden" id="colorLen" name="colorLen">
		<input type="hidden" id="sizeLen" name="sizeLen">
	</form>

</body>
</html>
<jsp:include page="/inc/footer.jsp" />

