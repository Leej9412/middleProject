<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
<input type="hidden" id="member_id" value="<%= request.getAttribute("member_id") %>">

	<!-- JS -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.3.min.js"></script>
	<!-- <script src="vendor/jquery/jquery.min.js"></script> -->
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css"> 
<script type="text/javascript">
	let status = document.getElementById("status").value;
	
	if(status == "findId"){
		let memberId = document.getElementById("member_id").value;
		swal("고객님의 아이디는 '" + memberId+ "' 입니다")
		.then((value) => {
			self.close();
		});
/* 		swal("고객님의 아이디는 '" + memberId+ "' 입니다", "아이디 찾기 완료!","success"); */
		
		

	}else if(status == "invalidIdMail"){
		swal("죄송합니다", "일치하는 아이디와 메일이 존재하지 않습니다.","error") //사진을 에러로 가져온 것임.
		.then((value) => {
			self.close();
		});
	}
	else if(status == "resetSuccess"){
		swal("변경 완료", "비밀번호가 정상적으로 변경되었습니다.","success")
		.then((value) => {
			self.close();
		});
		
	}
	else if(status == "resetFailed"){
		swal("죄송합니다", "비밀번호를 입력해주세요","error")
		.then((value) => {
			self.close();
		});
		
	}
	else if(status == "invalidIdMail"){
		swal("죄송합니다", "일치하는 아이디와 메일이 존재하지 않습니다.","error")
		.then((value) => {
			self.close();
		});
		
	}
	if(status == "success"){
		swal("가입완료", "저희 PANGPANGMALL에 가입해주셔서 감사합니다!","success")
		.then((value) => {
			location.href = "<%=request.getContextPath() %>/login.jsp";
		});
		
	}
	

</script>	
</body>
</html>