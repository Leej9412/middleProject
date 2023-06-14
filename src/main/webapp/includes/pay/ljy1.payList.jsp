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
					<h1>Pay</h1>
					<p class="mb-4">
						<a href="<%=request.getContextPath()%>/includes/0.homeIndex.jsp">Home</a> / <strong>Payments List</strong>
					</p>
				</div>
			</div>
		</div>
	</div>




	<!-- 레이아웃 --><%@include file="/includes/4.payListContent.jsp"%>





	<!-- 레이아웃 --><%@include file="/includes/5.footer.jsp"%>
	<script type="text/javascript">
function cancelPay(payNo) {
	
	if( confirm("결제를 취소하시겠습니까?") ){
		$.ajax({ 
			url : '<%=request.getContextPath()%>/payCancel.do',
			type : 'post',
			data : {
				"payNo" : payNo
				},
			dataType : 'json',
			success : function(res) {
	// 			alert(res.flag);
				console.log(res);
				if(res.flag=="성공"){
					location.reload();
				}
			},
			error : function(xhr) {
				alert('상태 : ' + xhr.status)
			}
	
		});
		
	}
}

$(document).ready(function(){
	
	$('.payListRowSpanTd').each(function(){
		var rows= $(".payListRowSpanTd:contains('" +$(this).text() + "')");
		
		if(rows.length > 1) { //동일한 rows값이 1개 이상이면 열을 합침
			rows.eq(0).attr("rowspan", rows.length);
			rows.not(":eq(0)").remove();
		}
		
	})
	
})
</script>
</body>
</html>