<%@page import="svc.order.CopyDataService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="vo.MemberBean"%>
<%@page import="dao.member.MemberDAO"%>
<%@page import="db.JdbcUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String member_id = "test";
	String pass = "test";
	
// 	Class.forName("com.mysql.jdbc.Driver");
	
// 	String dbUrl = "jdbc:mysql://192.168.1.26:3306/teampro";
// 	String dbUser = "chairman";
// 	String dbPass = "1234";
	
// 	Connection con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
	
// 	String sql = "select * from member where id = ?";
	
// 	PreparedStatement p = con.prepareStatement(sql);
// 	p.setString(1, id);
	
// 	ResultSet rs = p.executeQuery();
	
// 	JSONArray md = new JSONArray();
// 	if(rs.next()){
// 		JSONObject mb = new JSONObject();
// 		mb.put("id",rs.getString("id"));
// 		mb.put("name",rs.getString("pass"));
// 		mb.put("email",rs.getString("email"));
		
// 		String[] phone = rs.getString("phone").split("-");
		
		
// 		for(int i = 0 ; i < phone.length ; i++){
// 			mb.put("phone_"+i, phone[i]);
// 		}
// 		mb.put("phone_0",rs.getString("phone").substring(0, 3));
// 		mb.put("phone_1",rs.getString("phone").substring(4, 8));
// 		mb.put("phone_2",rs.getString("phone").substring(9));
		
		
		
// 		md.add(mb);
// 	}
	CopyDataService copy = new CopyDataService();
	ArrayList<JSONArray> md = copy.process(member_id);
	if(md != null){
		%>
		<%= md%>
		<%
	}
	

%>
<%-- <%=md %> --%>