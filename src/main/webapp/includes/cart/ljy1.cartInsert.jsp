<%@page import="kr.or.ddit.vo.MemberVO"%>
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
<%
	//로그인세션에서 회원정보 불러오기
	MemberVO memVo =  (MemberVO) session.getAttribute("loginMember");
	
	//로그인세션에서 회원아이디 선택해서 변수에 저장하기
	String mid = memVo.getMem_id();
	int pid = 3;
	try {
		pid = Integer.parseInt(request.getParameter("productNo"));		
	} catch(Exception e) {
		e.printStackTrace();
	}
//	test
// 	String mid = "test3";
// 	int pid = 2;
	%>
	<!-- 장바구니 담기 버튼 -->
	<div class="row">
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-4">
					<form action="/cartInsert.do" method="post">
						<input type="text" id="cart_qty" name="cart_qty" placeholder="수량을 입력하세요."> 
						<input type="hidden" id="p_id" name="p_id" placeholder="Product_ID" value="<%=pid%>"> 
						<input type="hidden" id="mem_id" name="mem_id" placeholder="Member_ID"value="<%=mid%>">
						<br>
<!-- 						<input type="button" value="장바구니 담기" onclick="addCart()"> -->
					</form>
					<button class="btn btn-black" onclick="addCart()">장바구니 담기</button>
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
function addCart() {

	var cqty = $('#cart_qty').val().trim();
	var pid = $('#p_id').val().trim();

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