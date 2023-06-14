<!-- 로그인이 되어있지 않을 경우 로그인 페이지로 이동 -->
<%-- <%
	if(session.getAttribute("mem_id")==null){
		response.sendRedirect("../login.jsp");
	}
// 	MemberVO memVo = (MemberVO) session.getAttribute("loginMember");
%> --%>
<!-- 세션 로그인아이디 session.getAttribute("mem_id") -->
<!-- 세션 로그인회원정보전체 session.getAttribute("loginMember") -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 레이아웃 --><%@include file="/includes/admin/key1.adminheader.jsp"%>
<title>PangPang</title>
</head>
<body>
	<!-- 레이아웃 --><%@include file="/includes/admin/key2.adminnavbar.jsp"%>
	<!-- 레이아웃 --><%@include file="/includes/admin/board/key3.adminnoticMain.jsp"%>


	<!-- 레이아웃 --><%@include file="/includes/admin/board/key4-1.adminboardLeftSideMenu.jsp"%>
	<div class="col-md-9">
	<!-- 레이아웃 --><%@include file="/includes/admin/board/key4-2.adminboardContents.jsp"%>
	</div>
<%-- 	<!-- 레이아웃 --><%@include file="/includes/admin/board/key4-3.adminboardPagination.jsp"%> --%>
	<!-- 레이아웃 --><%@include file="/includes/admin/key5.adminfooter.jsp"%>
</body>
</html>