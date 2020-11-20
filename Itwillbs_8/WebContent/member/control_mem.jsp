<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/control_mem_order.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<h1>Admin - </h1><h3> &nbsp;Member</h3>
<table>
<tr><th>행번호</th><th>id</th><th>email</th><th>비밀번호</th><th>이름</th><th>닉네임</th><th>핸드폰번호</th><th>가입일자</th><th>삭제</th></tr>


<%
for(int i=0; i<10;i++){
%><tr><td><%=i %></td><td>id</td><td>email</td><td>비밀번호</td><td>이름</td><td>닉네임</td><td>핸드폰번호</td><td>가입일자</td><td><input class="in_bu" type="button" value="삭제"></td></tr><%
}
%>
</table>
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>