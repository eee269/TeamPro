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
	switch(val) {
	case "CLOTHES":
		// 소분류 radio 보여주기 / 감추기
		$('div#clothncode').css('display', 'inline');
		$('div#bagncode').css('display', 'none');
		$('div#shoencode').css('display', 'none');
		break;
	case "BAGS":
		// 소분류 radio 보여주기 / 감추기
		$('div#clothncode').css('display', 'none');
		$('div#bagncode').css('display', 'inline');
		$('div#shoencode').css('display', 'none');
		break;
	default:
		// 소분류 radio 보여주기 / 감추기
		$('div#clothncode').css('display', 'none');
		$('div#bagncode').css('display', 'none');
		$('div#shoencode').css('display', 'inline');
		
	}
}

// 소분류 선택시 색상 checkbox 나타내기
function radio(val) {
	$('div#radioColor').css('display', 'inline');
}

// 색상 선택 완료 버튼 클릭시 사이즈 checkbox 나타내기
$('#sizebtn').click(function() {
	var xcode = $('input:radio[name=xcode]:checked').val();
	alert(xcode);
	
	switch(xcode) {
	case "CLOTHES":
		$('div#clothsize').css('display', 'inline');
		$('div#bagsize').css('display', 'none');
		$('div#shoesize').css('display', 'none');
		break;
	case "BAGS":
		$('div#clothsize').css('display', 'none');
		$('div#bagsize').css('display', 'inline');
		$('div#shoesize').css('display', 'none');
		break;
	case "SHOES":
		$('div#clothsize').css('display', 'none');
		$('div#bagsize').css('display', 'none');
		$('div#shoesize').css('display', 'inline');
		break;
	default:
		$('div#clothsize').css('display', 'none');
		$('div#bagsize').css('display', 'none');
		$('div#shoesize').css('display', 'none');
	}
	
});

// 옵션 선택 완료 버튼 클릭 시 수량 나타내기
$('.optbtn').click(function() {
	var color = $('input:checkbox[name=goods_color]').value;
	alert(color);
	var size = $('input:checkbox[name=goods_size]').value;
	alert(size);
});



// $(function() {
// 	$('input:checkbox[name=goods_color]').click(function() {
// 		var color = this.value;
// 		$('input:checkbox[name=goods_size]').click(function() {
// 			var size = this.value;
// 			$('div#goods_stock').append("<span>" + color + "/" + size + "</span>&nbsp;&nbsp;&nbsp;" + 
// 					"<input type='text' name='" +  color + "/" + size + "' id='" +  color + "/" + size + "' "+
// 						"style='border-bottom: 0.3px solid lightgray; width: 100px'  required='required'><br>");
// 		});
// 	});	
// })



// checkbox 선택한 값 넘겨주기
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
					<div id="clothncode" style="display: none; padding: 5px">
						<input type="radio" name="clothes" value="TOP" style="width:80px" onchange="radio(this.value)"> <span>Top</span>
						<input type="radio" name="clothes" value="BOTTOM" style="width:80px" onchange="radio(this.value)"> <span>Bottom</span>
						<input type="radio" name="clothes" value="DRESS" style="width:80px" onchange="radio(this.value)"> <span>Dress</span>
						<input type="radio" name="clothes" value="OUTER" style="width:80px" onchange="radio(this.value)"> <span>Outer</span>
					</div>
					<div id="bagncode" style="display: none; padding: 5px">
						<input type="radio" name="bag" value="CROSS" style="width:80px" onchange="radio(this.value)"> <span>Cross</span>
						<input type="radio" name="bag" value="BUCKET" style="width:80px" onchange="radio(this.value)"> <span>Bucket</span>
						<input type="radio" name="bag" value="SHOULDER" style="width:80px" onchange="radio(this.value)"> <span>Shoulder</span>
						<input type="radio" name="bag" value="TOTE" style="width:80px" onchange="radio(this.value)"> <span>Tote</span><br>
						<input type="radio" name="bag" value="CLUTCH" style="width:80px" onchange="radio(this.value)"> <span>Clutch</span>
						<input type="radio" name="bag" value="SHOPPER" style="width:80px" onchange="radio(this.value)"> <span>Shopper</span>
						<input type="radio" name="bag" value="BACKPACK" style="width:80px" onchange="radio(this.value)"> <span>Backpack</span>
					</div>
					<div id="shoencode" style="display: none; padding: 5px">
						<input type="radio" name="shoes" value="SNEAKERS" style="width:100px" onchange="radio(this.value)"> <span>Sneakers</span>
						<input type="radio" name="shoes" value="BOOTS" style="width:100px" onchange="radio(this.value)"> <span>Boots</span>
						<input type="radio" name="shoes" value="LOAFERS" style="width:100px" onchange="radio(this.value)"> <span>Loafers</span><br>
						<input type="radio" name="shoes" value="SANDALS" style="width:100px" onchange="radio(this.value)"> <span>Sandals</span>
						<input type="radio" name="shoes" value="SLIPPER" style="width:100px" onchange="radio(this.value)"> <span>Slipper</span>
					</div>
				</td>
			</tr>
			<tr>
				<td><input type="file" name="sfile1" id="sfile1" style="padding: 10px 25px;" required="required"></td>
				<td><b>색상</b></td>
				<td>
					<div id="radioColor" style="display: none;">
						<input type="checkbox" name="goods_color" value="BK" style="width: 100px"><span>Black</span>
						<input type="checkbox" name="goods_color" value="WH" style="width: 100px"><span>White</span>
						<input type="checkbox" name="goods_color" value="GR" style="width: 100px"><span>Gray</span><br>
						<input type="checkbox" name="goods_color" value="RD" style="width: 100px"><span>Red</span>
						<input type="checkbox" name="goods_color" value="BL" style="width: 100px"><span>Blue</span>
						<input type="checkbox" name="goods_color" value="PK" style="width: 100px"><span>Pink</span><br>
						<input type="button" id="sizebtn" value="색상 선택 완료">
					</div>
				</td>
			</tr>
			<tr>
				<td><input type="file" name="sfile2" id="sfile2"
					style="padding: 10px 25px;"></td>
				<td><b>사이즈</b></td>
				<td>
					<div id="clothsize" style="display: none">
						<input type="checkbox" name="goods_size" value="S" style="width: 100px"><span>S</span>
						<input type="checkbox" name="goods_size" value="M" style="width: 100px"><span>M</span>
						<input type="checkbox" name="goods_size" value="L" style="width: 100px"><span>L</span>
						<input type="checkbox" name="goods_size" value="XL" style="width: 100px"><span>XL</span><br>
						<input type="button" class="optbtn" value="옵션 선택 완료">
					</div>
					<div id="bagsize" style="display: none">
						<input type="checkbox" name="goods_size" value="FR" style="width: 100px"><span>Free</span><br>
						<input type="button" class="optbtn" value="옵션 선택 완료">
					</div>
					<div id="shoesize" style="display: none">
						<input type="checkbox" name="goods_size" value="230" style="width: 100px"><span>230</span>
						<input type="checkbox" name="goods_size" value="240" style="width: 100px"><span>240</span>
						<input type="checkbox" name="goods_size" value="250" style="width: 100px"><span>250</span><br>
						<input type="checkbox" name="goods_size" value="260" style="width: 100px"><span>260</span>
						<input type="checkbox" name="goods_size" value="270" style="width: 100px"><span>270</span>
						<input type="checkbox" name="goods_size" value="280" style="width: 100px"><span>280</span><br>
						<input type="button" class="optbtn" value="옵션 선택 완료">
					</div>
				</td>
			</tr>
			<tr>
				<td><input type="file" name="sfile3" id="sfile3"
					style="padding: 10px 25px;"></td>
				<td>상품 수량</td>
				<td>
					<div id="goods_stock">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="상품 등록" style="padding:10px 25px; text-align: right;"></td>
			</tr>
		</table>
			<br>
			
			
	</form>

</body>
</html>
<jsp:include page="/inc/footer.jsp" />

