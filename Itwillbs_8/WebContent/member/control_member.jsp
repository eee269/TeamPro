<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/control.css" />
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<h1 style="margin: 50px 100px">Admin - Member</h1>
<table style="border: 0.3px solid lightgray; text-align: center; margin: 100px 50px; width: 80%; min-height: 500px;">
<tr><th>행번호</th><th>id</th><th>email</th><th>비밀번호</th><th>닉네임</th><th>프로필이미지</th><th>핸드폰번호</th><th>가입일자</th><th>삭제</th></tr>


<%

ArrayList<MemberBean> memberList = (ArrayList)request.getAttribute("memberList");

for(int i=0; i<memberList.size();i++){
	MemberBean member = new MemberBean();
	member = memberList.get(i);
	String id = member.getId();
%>

<tr><td><%=i+1 %></td><td><%=id %></td><td><%=member.getEmail() %></td><td><%=member.getPass() %></td><td><%=member.getUsername() %></td>
<td><%=member.getImg() %></td><td><%=member.getPhone() %></td><td><%=member.getDate() %></td>
<td><input class="in_bu" type="button" value="삭제" onclick="location.href='MemberDelete.mo?id=<%=id%>'"></td></tr><%
}
%>
</table>
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>