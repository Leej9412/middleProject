
<%@page import="kr.or.ddit.vo.ReplyVO"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    // 서블릿에서 데이터 가져오기.
    List<ReplyVO> list = (List<ReplyVO>) request.getAttribute("list");
    
    Gson gson = new Gson();
    
    String result = gson.toJson(list);
    
    out.print(result);
    out.flush();
    
    %>