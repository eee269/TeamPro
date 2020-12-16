<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Img_upload</title>

<script type="text/javascript" src="../js/jquery-3.5.1.js" charset="utf-8"></script>
<script type="text/javascript">
// ----------------- 파일 미리보기 -------------------
	var sel_file;
	
	$(function() {
		$("#comm_img").on('change', handleImgFileSelect);
	});
	
	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
		
	}
// ----------------- 파일 미리보기 끝 -------------------
</script>

</head>
<body>
	<div align="center">
		<h1>Image Upload</h1>
		<hr width="300">
		
		<form action="comm_write.jsp" name="f" method="post">
			<table>
				<tr>
					<td><input type="file" name="comm_img" id="comm_img" required="required"></td>
					<td><input type="text" ></td>
				</tr>
				<tr>
					<td rowspan="4"><img id="img" width="400px"></td>
				</tr>
			</table>
		</form>
	</div>


</body>
</html>