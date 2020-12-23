<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<JSONArray> md = (ArrayList<JSONArray>)request.getAttribute("mb");
	if(md != null){
		%>
		<%= md%>
		<%
	}

%>
