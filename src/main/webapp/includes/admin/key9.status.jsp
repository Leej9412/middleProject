<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int res = (Integer) request.getAttribute("res");
	if(res > 0){
%>
	{ 
		"status" : "success"
	}
<%		
	}else{
%>
	{ 
		"status" : "failed"
	}
		
<%
	}
%>
