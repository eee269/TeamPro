<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <h1>js_jQuery2/string3.jsp</h1> -->
<%
String memberId=request.getParameter("memberId");
String goodsCode = request.getParameter("goodsCode");

//1단계 드라이버 불러오기
Class.forName("com.mysql.jdbc.Driver");
//2단계 디비연결
String dbUrl="jdbc:mysql://192.168.1.26:3306/teampro";
String dbUser="chairman";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
//3단계 sql member테이블 조건 id 일치하는지 조회
String sql="INSERT cart VALUES(?,?,?,?,now(),?,?,?,?)";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, 2);
pstmt.setInt(2, 2);
pstmt.setString(3, "호랑이");
pstmt.setInt(4, 3000);
pstmt.setString(5, "빨강");
pstmt.setString(6, "XL");
pstmt.setString(7, memberId);
pstmt.setString(8, goodsCode);
//4 단계  rs <= 실행
int check = pstmt.executeUpdate();
// 5단계  rs첫행으로 이동 데이터 있으면 일치하면   "아이디중복"
//                       없으면                "아이디 사용가능"
if(check > 0){
	//"아이디중복"
	out.println("장바구니 담기 성공!");
}else{
	//"아이디 사용가능"
	out.println("오류 ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ");
}
// if("kim".equals(id)){
// 	//아이디 중복
// 	out.println("아이디 중복");
// }else{
// 	//아이디 사용가능
// 	out.println("아이디 사용가능");
// }
%>
