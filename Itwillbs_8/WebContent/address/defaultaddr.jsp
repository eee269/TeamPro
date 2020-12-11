<%@page import="org.json.simple.JSONArray"%>
<%@page import="vo.AddrBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String member_id = (String)session.getAttribute("member_id");
	ArrayList<JSONArray> defaultAddr = (ArrayList<JSONArray>)request.getAttribute("defaultAddr");

	
	if(defaultAddr != null){
		%>
		<%= defaultAddr%>
		<%
	}

%>