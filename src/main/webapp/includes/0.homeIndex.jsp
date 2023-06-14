<!-- 로그인이 되어있지 않을 경우 로그인 페이지로 이동 -->
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%
// 	if(session.getAttribute("mem_id")==null){
// 		response.sendRedirect("../login.jsp");
// 	}
// 	MemberVO memVo = (MemberVO) session.getAttribute("loginMember");
%>

<!-- 세션 로그인아이디 session.getAttribute("mem_id") -->
<!-- 세션 로그인회원정보전체 session.getAttribute("loginMember") -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 레이아웃 --><%@include file="/includes/1.header.jsp"%>
<title>PangPang Mall.</title>
</head>
<body>
	<!-- 레이아웃 --><%@include file="/includes/2.navbar.jsp"%>
	<!-- 레이아웃 --><%@include file="/includes/3.homeMain.jsp"%>
	<!-- 레이아웃 --><%@include file="/includes/4-1.homePromotion.jsp"%>
	<div class="untree_co-section">
		<div class="container">
			<%-- <!-- 레이아웃 --><%@include file="/includes/4-2.homeProductItems.jsp"%> --%>
			<!-- 레이아웃 --><%@include file="/includes/shop/4-2.shopProductItems.jsp"%>
		</div>
	</div>
	<!-- /.untree_co-section -->
	<!-- 레이아웃 --><%@include file="/includes/4-3.homePromotion2.jsp"%>
	<!-- 레이아웃 --><%@include file="/includes/4-5.homePopularItems.jsp"%>
	<!-- 레이아웃 --><%@include file="/includes/5.footer.jsp"%>
</body>
</html>