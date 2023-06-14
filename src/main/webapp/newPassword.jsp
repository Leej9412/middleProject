<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>비밀번호 변경</title>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
	rel='stylesheet'>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css"> 
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
	rel='stylesheet'>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<style>
.placeicon {
	font-family: fontawesome
}

.custom-control-label::before {
	background-color: #dee2e6;
	border: #dee2e6
}
</style>
</head>
<body oncontextmenu='return false' class='snippet-body bg-light'>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
	<div>
		<!-- Container containing all contents -->
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
					<!-- White Container -->
					<div class="container bg-white rounded mt-2 mb-2 px-0">
						<!-- Main Heading -->
						<div class="row justify-content-center align-items-center pt-3">
<!-- 							<h1> -->
<!-- 								<strong>새 비밀번호 입력</strong> -->
<!-- 							</h1> -->
						</div>
						<div class="pt-3 pb-3">
							<form id="newPass-form" class="form-horizontal" action="newPassword" method="POST">
								<!-- User Name Input -->
								<div class="form-group row justify-content-center px-3">
									<div class="col-9 px-0">
										<input type="text" id="mem_pass" name="password" placeholder="&#xf084; &nbsp; 새로운 비밀번호 입력"
											class="form-control border-secondary placeicon" required="required">
									</div>
								</div>
								<!-- Password Input -->
								<div class="form-group row justify-content-center px-3">
									<div class="col-9 px-0">
										<input type="password" id="re_pass" name="confPassword"
											placeholder="&#xf084; &nbsp; 비밀번호 확인"
											class="form-control border-secondary placeicon" required="required">
									</div>
								</div>
								<div class="form-group row justify-content-center px-3">
									<div class="col-9 px-0">
									<span style="color:grey; ">&nbsp; &nbsp; &nbsp; &nbsp;  영대소문자+특수문자+숫자조합 10자리이상</span>
									</div>
								</div>
							
								<!-- Log in Button -->
								<div class="form-group row justify-content-center ">
									<div class="col-9 px-3 mt-3">
										<input type="submit" value="비밀번호 변경"
											class="btn btn-lg btn-block btn-primary">
									</div>
								</div>
							</form>
						</div>
						<!-- Alternative Login -->
<!-- 						<div class="mx-0 px-0 bg-light"> -->
							
							<!-- Horizontal Line -->
<!-- 							<div class="px-4 pt-5"> -->
<!-- 								<hr> -->
<!-- 							</div> -->
							<!-- Register Now -->
<!-- 							<div class="pt-2"> -->
<!-- 								<div class="row justify-content-center"> -->
<!-- 									<h5> -->
<!-- 										Don't have an Account?<span><a href="#" -->
<!-- 											class="text-danger"> Register Now!</a></span> -->
<!-- 									</h5> -->
<!-- 								</div> -->
<!-- 								<div -->
<!-- 									class="row justify-content-center align-items-center pt-4 pb-5"> -->
<!-- 									<div class="col-4"> -->
										
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type='text/javascript'
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
		
<script type="text/javascript">

/*비밀번호 검증 - 영문대(아스키값 65-90)소문자(아스키값 97-122) 숫자(48-57) 특수문자가 반드시 하나씩 포함*/
//전방탐색 : 찾을문자(?= 기준문자) 찾을 문자가 표현되지 않으면 기준문자는 반드시 포함되어야 한다.
	$('#mem_pass').on('keyup', function () {
	//입력한 이름 가져오기
	pwdvalue = $(this).val().trim();
	
//		pwdreg = /.*(?=[a-z])/
	pwdreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[~!@#$%^&*()-_=+\|{};:,.<>?]).{10,20}$/;
	
	
	if(pwdreg.test(pwdvalue)){

		$(this).css('color', 'green')
		
	}else{
		$(this).css('color', 'red')
	}
})

//비번 확인 
	$('#re_pass').on('keyup', function () {
	//입력한 이름 가져오기
	repwdvalue = $(this).val().trim();
	pwdvaluecheck = $('#mem_pass').val().trim();
	console.log(pwdvaluecheck);
//		pwdreg = /.*(?=[a-z])/
	repwdreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[~!@#$%^&*()-_=+\|{};:,.<>?]).{10,20}$/;
	console.log(repwdreg.test(repwdvalue));
	
	if(repwdreg.test(repwdvalue) && pwdvaluecheck == repwdvalue){

		$(this).css('color', 'green')
		
	}else{
		$(this).css('color', 'red')
	}
})

$(function(){
	
	
 	$("#newPass-form").on("submit", function(){

	
		if($("#mem_pass").val()!= $("#re_pass").val()){
			swal("비밀번호 오류", "비밀번호와 비밀번호 확인이 다릅니다. 다시 확인하세요.","error");
			return false;
		}
		
		return true;
	}); 
 	
});

</script>
	
</body>
</html>