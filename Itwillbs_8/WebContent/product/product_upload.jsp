<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page="../header.jsp" />
<!-- QuickMenu -->
<jsp:include page="../quickMenu.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품업로드</title>
</head>
<body>
	<h1 style="margin: 50px 100px">Product Upload</h1>

	<form action="ControlProductUpload.mo" method="post">
		<table
			style="border: 0.3px solid lightgray; text-align: center; margin: 100px 50px; width: 80%; min-height: 500px;">
			<tr>
				<th colspan="2">썸네일 이미지</th>
				<th colspan="2">상품 세부사항</th>
			</tr>
			<tr>
				<td><input type="file" name="mainfile" id="mfile1"
					style="padding: 10px 25px;" required="required"></td>
				<td><input type="button" value="상품 추가"
					style="padding: 10px 25px" id="addbtn1" onclick="addfile(this.id)"></td>
				<td><b>상품이름</b></td>
				<td><input type="text" id="goods_name"
					style="border-bottom: 0.3px solid lightgray; width: 400px" required="required"></td>
			</tr>
			<tr>
				<td><input type="file" name="mainfile" id="mfile2"
					style="padding: 10px 25px; visibility: hidden;"></td>
				<td><input type="button" value="상품 추가"
					style="padding: 10px 25px; visibility: hidden;" id="addbtn2"
					onclick="addfile(this.id)"></td>
				<td><b>가 격</b></td>
				<td><input type="text" id="goods_price"
					style="border-bottom: 0.3px solid lightgray; width: 400px" required="required"></td>
			</tr>
			<tr>
				<td><input type="file" name="mainfile" id="mfile3"
					style="padding: 10px 25px; visibility: hidden;"></td>
				<td><input type="button" value="상품 추가"
					style="padding: 10px 25px; visibility: hidden;" id="addbtn3"
					onclick="addfile(this.id)"></td>
				<td><b>대분류</b></td>
				<td>
					<input type="radio" value="clothes" style="width: 100px"><span>Clothes</span>
					<input type="radio" value="bags" style="width: 100px"><span>Bags</span>
					<input type="radio" value="shoes" style="width: 100px"><span>Shoes</span>
				</td>
			</tr>
			<tr>
				<th colspan="2">세부 설명 이미지</th>
				<td><b>소분류</b></td>
				<td>
					<div id="cloth2cate" style="visibility: hidden">
						<input type="radio" value="" style="width:100px"> <span></span>
						<input type="radio" value="" style="width:100px"> <span></span>
						<input type="radio" value="" style="width:100px"> <span></span>
						<input type="radio" value="" style="width:100px"> <span></span>
					</div>
					<div id="bag2cate" style="visibility: hidden">
						<input type="radio" value="" style="width:100px"> <span></span>
						<input type="radio" value="" style="width:100px"> <span></span>
						<input type="radio" value="" style="width:100px"> <span></span>
						<input type="radio" value="" style="width:100px"> <span></span><br>
						<input type="radio" value="" style="width:100px"> <span></span>
						<input type="radio" value="" style="width:100px"> <span></span>
						<input type="radio" value="" style="width:100px"> <span></span>
					</div>
					<div id="shoe2cate" style="visibility: hidden">
						<input type="radio" value="" style="width:100px"> <span></span>
						<input type="radio" value="" style="width:100px"> <span></span>
						<input type="radio" value="" style="width:100px"> <span></span><br>
						<input type="radio" value="" style="width:100px"> <span></span>
						<input type="radio" value="" style="width:100px"> <span></span>
						<input type="radio" value="" style="width:100px"> <span></span>
					</div>
				</td>
			</tr>
			<tr>
				<td><input type="file" name="subfile" id="sfile1" style="padding: 10px 25px;"></td>
				<td><input type="button" value="상품 추가" style="padding: 10px 25px;" id="addbtn4"
					onclick="addfile(this.id)"></td>
				<td><b>색상</b></td>
				<td>
					<input type="checkbox" value="black" style="width: 100px"><span>Black</span>
					<input type="checkbox" value="white" style="width: 100px"><span>White</span>
					<input type="checkbox" value="gray" style="width: 100px"><span>Gray</span><br>
					<input type="checkbox" value="red" style="width: 100px"><span>Red</span>
					<input type="checkbox" value="blue" style="width: 100px"><span>Blue</span>
					<input type="checkbox" value="yellow" style="width: 100px"><span>Yellow</span>
				</td>
			</tr>
			<tr>
				<td><input type="file" name="subfile" id="sfile2"
					style="padding: 10px 25px; visibility: hidden;"></td>
				<td><input type="button" value="상품 추가"
					style="padding: 10px 25px; visibility: hidden;" id="addbtn5"
					onclick="addfile(this.id)"></td>
				<td><b>사이즈</b></td>
				<td>
					<div id="commonsize" style="visibility: hidden">
						<input type="checkbox" value="" style="width: 100px"><span>Small</span>
						<input type="checkbox" value="" style="width: 100px"><span>Mideum</span>
						<input type="checkbox" value="" style="width: 100px"><span>Large</span>
					</div>
					<div id="shoesize" style="visibility: hidden">
						<input type="checkbox" value="" style="width: 100px"><span>230</span>
						<input type="checkbox" value="" style="width: 100px"><span>240</span>
						<input type="checkbox" value="" style="width: 100px"><span>250</span><br>
						<input type="checkbox" value="" style="width: 100px"><span>260</span>
						<input type="checkbox" value="" style="width: 100px"><span>270</span>
						<input type="checkbox" value="" style="width: 100px"><span>280</span>
					</div>
				</td>
			</tr>
			<tr>
				<td><input type="file" name="subfile" id="sfile3"
					style="padding: 10px 25px; visibility: hidden;"></td>
				<td><input type="button" value="상품 추가"
					style="padding: 10px 25px; visibility: hidden;" id="addbtn6"
					onclick="addfile(this.id)"></td>
				<td></td>
				<td><input type="submit" value="상품 등록" style="padding:10px 25px; text-align: right;"></td>
			</tr>
		</table>

	</form>

</body>
</html>
<jsp:include page="/footer.jsp" />