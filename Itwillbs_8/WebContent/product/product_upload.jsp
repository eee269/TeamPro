<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page="../inc/header.jsp" />
<!-- QuickMenu -->
<jsp:include page="../quickMenu.jsp" />




<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품업로드</title>

<script type="text/javascript">

// 1. 대분류 선택시 소분류 visibility

function ncode(val) {
	if(val == "CLOTHES") {
		$('div#clothncode').css('visibility', 'visible');
		$('div#bagncode').css('visibility', 'hidden');
		$('div#shoencode').css('visibility', 'hidden');
		
		$('div#clothsize').css('visibility', 'visible');
		$('div#bagsize').css('visibility', 'hidden');
		$('div#shoesize').css('visibility', 'hidden');
		
		$('input[type=checkbox]').prop('checked',false);
	} else if(val == "BAGS") {
		$('div#clothncode').css('visibility', 'hidden');
		$('div#bagncode').css('visibility', 'visible');
		$('div#shoencode').css('visibility', 'hidden');
		
		$('div#clothsize').css('visibility', 'hidden');
		$('div#bagsize').css('visibility', 'visible');
		$('div#shoesize').css('visibility', 'hidden');
		
		$('input[type=checkbox]').prop('checked',false);
	} else if(val == "SHOES") {
		$('div#clothncode').css('visibility', 'hidden');
		$('div#bagncode').css('visibility', 'hidden');
		$('div#shoencode').css('visibility', 'visible');
		
		$('div#clothsize').css('visibility', 'hidden');
		$('div#bagsize').css('visibility', 'hidden');
		$('div#shoesize').css('visibility', 'visible');
		
		$('input[type=checkbox]').prop('checked',false);
	}
}

function typeswift() {
	var goods_color = [];
	var goods_size = [];
	$('input[name=goods_color]').each(function() {

		for (var i = 0; i < arr.length; i++) {
	    	  goods_color = this.value;
	      }
	 });

	goods_size = $('input[name=goods_size]').val();
	
	alert(goods_color + ", " + goods_size);
}

</script>

</head>
<body>
	<h1 style="margin: 50px 100px">Product Upload</h1>

	<form action="ControlProductUpload.mo" method="post" onsubmit="typeswift()">
		<table
			style="border: 0.3px solid lightgray; text-align: center; margin: 100px 50px; width: 80%; min-height: 500px;">
			<tr>
				<th>썸네일 이미지</th>
				<th colspan="2">상품 세부사항</th>
			</tr>
			<tr>
				<td><input type="file" name="mainfile" id="mfile1"
					style="padding: 10px 25px;"></td>
				<td><b>상품이름</b></td>
				<td><input type="text" id="goods_name"
					style="border-bottom: 0.3px solid lightgray; width: 400px"></td>
			</tr>
			<tr>
				<td><input type="file" name="mainfile" id="mfile2"
					style="padding: 10px 25px;"></td>
				<td><b>가 격</b></td>
				<td><input type="text" id="goods_price"
					style="border-bottom: 0.3px solid lightgray; width: 400px"></td>
			</tr>
			<tr>
				<td><input type="file" name="mainfile" id="mfile3"
					style="padding: 10px 25px;"></td>
				<td><b>대분류</b></td>
				<td>
					<input type="radio" name="xcode" value="CLOTHES" style="width: 100px" onchange="ncode(this.value)"><span>Clothes</span>
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
				<td><input type="file" name="subfile" id="sfile1" style="padding: 10px 25px;"></td>
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
				<td><input type="file" name="subfile" id="sfile2"
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
				<td><input type="file" name="subfile" id="sfile3"
					style="padding: 10px 25px;"></td>
				<td></td>
				<td><input type="submit" value="상품 등록" style="padding:10px 25px; text-align: right;"></td>
			</tr>
		</table>

	</form>

</body>
</html>
<jsp:include page="../inc/footer.jsp" />