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
<div class="page-heading bg-light">
	<div class="container">
		<div class="row align-items-end text-center">
			<div class="col-lg-7 mx-auto">
				<h1>Board</h1>
				<p class="mb-4">
					<a href="<%=request.getContextPath()%>/mainList.do">Home</a> / <strong>Board</strong>
				</p>
			</div>
		</div>
	</div>
</div>




<!-- 레이아웃 --><%@include file="/includes/04.boardContent.jsp"%>
<!-- 레이아웃 --><%@include file="/includes/5.footer.jsp"%>
</body>
</html>