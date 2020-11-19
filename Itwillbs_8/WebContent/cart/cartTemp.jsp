<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// idbtn 버튼 클릭했을때  id 가지고 string3.jsp 가서
		// id와 'kim' 같으면  '아이디 중복' 출력 ,틀리면 '아이디사용가능' 출력
		// 출력 결과를 가져와서  id="re"태그에  html() 넣기
		$('#idbtn').click(function(){
			$.ajax('cartTest.jsp',{
				data:{memberId:$('#memberId').val(),
					goodsCode:$('#goodsCode').val()},
				success:function(rdata){
					$('#re').html(rdata);
				}
			});
		});
	});
</script>	
</head>
<body>
<h1>js_jQuery2/string3.html</h1>
<table border="1">
<tr><td>아이디,비밀번호</td></tr>
</table>
<form action="#" method="post" id="myform">
아이디:
<!-- <img src="item-cart-01.jpg" alt="admin" id="id"> -->
<input type="hidden" id="memberId" value="admin">
<input type="hidden" id="goodsCode" value="superman">
<input type="button" value="아이디중복체크" id="idbtn"><br>
<div id="re"></div><br>
</form>
</body>
</html>

