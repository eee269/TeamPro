<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="/inc/header.jsp" />
<!-- QuickMenu -->
<jsp:include page="/quickMenu.jsp" />




<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상품업로드</title>
<%
// 세션 판별
	String member_id = (String)session.getAttribute("member_id");
	if(member_id == null) {
		%>
		<script>
			alert("로그인이 필요합니다.");
			location.href="MemberLoginForm.mo";
		</script>
		<%
	} else if(!member_id.equals("admin")) {
		%>
		<script>
			alert("접근 권한이 없습니다.");
			location.href="MemberLoginForm.mo";
		</script>
		<%
	}

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

// 소분류 선택시 색상, 사이즈 checkbox 나타내기
function radio() {
	$('div#radioColor').css('display', 'inline');
	
	var val = $('input:radio[name=xcode]:checked').val();
	switch(val) {
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
}


var color = [];
var size = [];

$(function() {
	// 옵션 선택 완료 버튼 클릭 시 수량 나타내기
	$('.optbtn').click(function() {
		var colorcnt = $('input:checkbox[name=goods_color]:checked').length;
		var sizecnt = $('input:checkbox[name=goods_size]:checked').length;
		alert(colorcnt + ", " + sizecnt);
		
		if(colorcnt != 0 && sizecnt != 0) {
			$('input:checkbox[name=goods_color]:checked').each(function() {
				color.push($(this).val());
			})
			
			$('input:checkbox[name=goods_size]:checked').each(function() {
				size.push($(this).val());
			})
			
			
			// 원래 달려 있는 수량 입력창 없애기
			$('div#goods_stock *').remove();
			
			// 선택한 옵션의 수량 입력창 넣기
			for(var i=0; i<colorcnt; i++) {
				for(var j=0; j<sizecnt; j++) {
					$('div#goods_stock').append(
							"<span>" + color[i] + "/" + size[j] + "</span>&nbsp;&nbsp;&nbsp;" + 
							"<input type='text' name='" +  color[i] + "/" + size[j] + "' id='" +  color[i] + "/" + size[j] + "' "+
							"style='border-bottom: 0.3px solid lightgray; width: 100px'  required='required'><br>");
				}
			}
		} else if(colorcnt == 0) {
			alert("색상을 선택하세요");
			return ;
		} else if(sizecnt == 0){
			alert("사이즈를 선택하세요");
			return ;
		}
		
	});
	
})

// checkbox 선택한 값 넘겨주기
function checkboxswift() {
	for(var i=0; i<colorcnt; i++) {
		for(var j=0; j<sizecnt; j++) {
			console.log($('input#' + color[i] + '/' + size[j] + ']').val());
			if($('input#' + color[i] + '/' + size[j] + ']').val() == null) {
				$('input#' + color[i] + '/' + size[j] + ']').remove();
			}
		}
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
						<input type="radio" name="clothes" value="TOP" style="width:80px" onchange="radio()"> <span>Top</span>
						<input type="radio" name="clothes" value="BOTTOM" style="width:80px" onchange="radio()"> <span>Bottom</span>
						<input type="radio" name="clothes" value="DRESS" style="width:80px" onchange="radio()"> <span>Dress</span>
						<input type="radio" name="clothes" value="OUTER" style="width:80px" onchange="radio()"> <span>Outer</span>
					</div>
					<div id="bagncode" style="display: none; padding: 5px">
						<input type="radio" name="bag" value="CROSS" style="width:80px" onchange="radio()"> <span>Cross</span>
						<input type="radio" name="bag" value="BUCKET" style="width:80px" onchange="radio()"> <span>Bucket</span>
						<input type="radio" name="bag" value="SHOULDER" style="width:80px" onchange="radio()"> <span>Shoulder</span>
						<input type="radio" name="bag" value="TOTE" style="width:80px" onchange="radio()"> <span>Tote</span><br>
						<input type="radio" name="bag" value="CLUTCH" style="width:80px" onchange="radio()"> <span>Clutch</span>
						<input type="radio" name="bag" value="SHOPPER" style="width:80px" onchange="radio()"> <span>Shopper</span>
						<input type="radio" name="bag" value="BACKPACK" style="width:80px" onchange="radio()"> <span>Backpack</span>
					</div>
					<div id="shoencode" style="display: none; padding: 5px">
						<input type="radio" name="shoes" value="SNEAKERS" style="width:100px" onchange="radio()"> <span>Sneakers</span>
						<input type="radio" name="shoes" value="BOOTS" style="width:100px" onchange="radio()"> <span>Boots</span>
						<input type="radio" name="shoes" value="LOAFERS" style="width:100px" onchange="radio()"> <span>Loafers</span><br>
						<input type="radio" name="shoes" value="SANDALS" style="width:100px" onchange="radio()"> <span>Sandals</span>
						<input type="radio" name="shoes" value="SLIPPER" style="width:100px" onchange="radio()"> <span>Slipper</span>
					</div>
				</td>
			</tr>
			<tr>
				<td><input type="file" name="sfile1" id="sfile1" style="padding: 10px 25px;" required="required"></td>
				<td><b>색상</b></td>
				<td>
					<div id="radioColor" style="display: none;">
						<input type="checkbox" name="goods_color" value="BLACK" style="width: 100px"><span>Black</span>
						<input type="checkbox" name="goods_color" value="WHITE" style="width: 100px"><span>White</span>
						<input type="checkbox" name="goods_color" value="GREEN" style="width: 100px"><span>Gray</span><br>
						<input type="checkbox" name="goods_color" value="RED" style="width: 100px"><span>Red</span>
						<input type="checkbox" name="goods_color" value="BLUE" style="width: 100px"><span>Blue</span>
						<input type="checkbox" name="goods_color" value="PINK" style="width: 100px"><span>Pink</span>
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

