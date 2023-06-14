<%@page import="kr.or.ddit.vo.PageVO"%>
<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 서블릿에서 저장된 데이터 꺼내기
	
	List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");
	PageVO vo = (PageVO)request.getAttribute("vo");
	
	//json데이터 생성
	JsonObject obj = new JsonObject();
	obj.addProperty("startPage", vo.getStartPage());
	obj.addProperty("endPage", vo.getEndPage());
	obj.addProperty("totalPage", vo.getTotalPage());
	
	//json데이터 생성
	Gson gson = new Gson();
	JsonElement result = gson.toJsonTree(list);
	
	obj.add("datas", result);
	
	out.print(obj);
	out.flush();
	
%>