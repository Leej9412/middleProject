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
	<!-- 레이아웃 --><%@include file="/includes/shop/3.shopMain.jsp"%>

<%
	String viewPage = (String)request.getAttribute("viewPage");
	if(viewPage==null || "".equals(viewPage)) viewPage = "/includes/shop/4-2.shopProductItems.jsp";
%>

	<!-- 레이아웃 --><%@include file="/includes/shop/4-1.shopLeftSideMenu.jsp"%>	
	<div class="col-md-9">
		<!-- 레이아웃 --><jsp:include page="<%=viewPage %>" flush="false"/>
	</div>
	<!-- 레이아웃 --><%@include file="/includes/shop/4-3.shopCutotom-Pagination.jsp"%>	<!-- 바꿀거 -->
	<!-- 레이아웃 --><%@include file="/includes/5.footer.jsp"%>
<script type="text/javascript">
function addCart(cqty, pid) {

	$.ajax({ 
		url : '<%=request.getContextPath()%>/cartInsert.do',
		type : 'post',
		data : {"cart_qty" : cqty,
				"p_id" : pid
			},
		dataType : 'json',
		success : function(res) {
			alert('장바구니 담기 성공!');
		},
		error : function(xhr) {
			alert('상태 : ' + xhr.status)
		}

	})

}
</script>
</body>
</html>