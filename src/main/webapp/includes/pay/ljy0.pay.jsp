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
	<div class="untree_co-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center pt-5">
					<span class="display-3 thankyou-icon text-primary"> <svg
							width="1em" height="1em" viewBox="0 0 16 16"
							class="bi bi-cart-check mb-5" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd"
								d="M11.354 5.646a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L8 8.293l2.646-2.647a.5.5 0 0 1 .708 0z" />
              <path fill-rule="evenodd"
								d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
            </svg>
					</span>
					<%
						String PayStatus = (String) request.getAttribute("PayStatus");
						if( "success".equals(PayStatus) ) {
					%>
					<h2 class="display-3 text-black">감사합니다.</h2>
					<p class="lead mb-5">주문이 완료되었습니다.</p>
					<%
						} else if("cancel".equals(PayStatus)){
					%>
					<h2 class="display-3 text-black">결제 취소</h2>
					<p class="lead mb-5">결제가 취소되었습니다.</p>
					<%
						} else{
					%>
					<h2 class="display-3 text-black">죄송합니다.</h2>
					<p class="lead mb-5">오류가 발생하여 결제가 불가능합니다.</p>
					<p class="lead mb-5">고객센터에 문의하시기 바랍니다.</p>
					<%
						}
					%>
					
					<p>
						<a href="<%=request.getContextPath()%>/includes/shop/start.jsp" class="btn btn-sm btn-outline-black">계속 쇼핑하기</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 레이아웃 --><%@include file="/includes/5.footer.jsp"%>
</body>
</html>