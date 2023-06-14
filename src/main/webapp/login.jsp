<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


  
<title>로그인 페이지</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@alphardex/aqua.css/dist/aqua.min.css">
<!-- Main css -->
<link rel="stylesheet" href="css/style1.css">
</head>

<body>
<!-- 쿠키에 저장된 userid값 가져오기 -->
<%
	String cookieUserid = "";
	String cookieCheck = "";
	String status = "";

	Cookie[] cookieArr =request.getCookies();
	if(cookieArr!=null){
		for(Cookie cookie : cookieArr){
			if("USERID".equals(cookie.getName())){	// 내가 원하는 쿠키이름으로 해당 쿠키를 찾는다.
				cookieUserid = cookie.getValue();	// 쿠키값(userid) 구하기
				cookieCheck = "checked";
				System.out.println(99);
			}
			if("status".equals(cookie.getName())){
				status = cookie.getValue();
			}
		}
	}
%>
<!-- 쿠키에 저장된 userid값 가져오기 -->
<input type="hidden" id="status" value="<%=status %>">
<input type="hidden" id="member_id" value="<%= request.getAttribute("member_id") %>">
	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/장원영.jpg" alt="sing up image">
						</figure>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Sign up</h2>
						<form method="post" action="<%=request.getContextPath() %>/login.do" class="register-form"	id="login-form">
							<div class="form-group">
								<label for="mem_id"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="mem_id" id="mem_id"
									placeholder="Your Id" value="<%= cookieUserid %>" />
							</div>
							<div class="form-group">
								<label for="mem_pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="mem_pass" id="mem_pass"
									placeholder="Password" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me"
									class="agree-term" <%=cookieCheck%> /> <label for="remember-me"
									class="label-agree-term"><span><span></span></span>Remember
									me</label>
									
							</div>
<!-- 							<div class="form-group form-button"> -->
<!-- 								<input type="submit" name="signin" id="signin" -->
<!-- 									class="form-submit" value="Log in" /> -->
<!-- 							</div> -->
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="btn btn-info" value="Log in" />
							</div>
							
							<div class="form-group form-button">
								<input type="button" class="btn btn-primary" 
								onclick="location.href='<%=request.getContextPath() %>/registration.jsp'" value="회원가입">
							</div>
							
							<div class="form-group form-button">
								<input type="button" class="btn btn-secondary" id ="pangId"
								value="아이디 찾기">
							</div>
							
							<div class="form-group form-button">
								<input type="button" class="btn " id ="pangPass"
								value="비밀번호 찾기">
							</div>
							
	

<!--  							<div class="form-group"> -->
<!--  							<a href="javascript:void(window.open('forgotId.jsp', '아이디 찾기', 'width=500px, height=500px'))" >아이디 찾기</a>							 -->
<!-- 							</div>  -->
<!--  							<div class="form-group"> -->
<!--  							<a href="javascript:void(window.open('forgotPassword.jsp', '비밀번호 찾기', 'width=500px, height=500px'))" >비밀번호 찾기</a>							 -->
<!-- 							</div>  -->
						</form>
						<div class="social-login">
							<span class="social-label">Or login with</span>
							<ul class="socials">
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-facebook"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-twitter"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-google"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.3.min.js"></script>
	<!-- <script src="vendor/jquery/jquery.min.js"></script> -->
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css"> 

<script type="text/javascript">
	var popupWidth = 600;
	var popupHeight = 500;
	
	var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
	var popupY = Math.ceil(( window.screen.height - popupHeight )/2); 

	
	$("#pangId").on("click", function(){

	    //window.open(URL,이름,옵션);
	    window.open("forgotId.jsp", "아이디 찾기","width=" + popupWidth + ",height=" + popupHeight + ",left="+ popupX + ", top="+ popupY); 
	    //이것만 기억해두자
	            
	});//click
	
	$("#pangPass").on("click", function(){

	    //window.open(URL,이름,옵션);
	    window.open("forgotPassword.jsp", "비밀번호 찾기","width=" + popupWidth + ",height=" + popupHeight + ",left="+ popupX + ", top="+ popupY); 
	    //이것만 기억해두자
	            
	});//click
//-----------------------------------------------------------------------
	let status = document.getElementById("status").value;
	
	if(status == "failed"){
		swal("죄송합니다.", "아이디 혹은 비밀번호를 확인해주세요","error"); //사진을 에러로 가져온 것임.
		
	}
	else if(status == "invalidId"){
		swal("죄송합니다.", "아이디를 입력해주세요.","error"); //사진을 에러로 가져온 것임.
		
	}
	else if(status == "invalidPass"){
		swal("죄송합니다", "비밀번호를 입력해주세요","error"); //사진을 에러로 가져온 것임.
		
	}
	else if(status == "resetSuccess"){
		swal("변경 완료", "비밀번호가 정상적으로 변경되었습니다.","success"); 
		
	}
	else if(status == "resetFailed"){
		swal("죄송합니다", "비밀번호를 입력해주세요","error"); //사진을 에러로 가져온 것임.
		
	}
	else if(status == "invalidIdMail"){
		swal("죄송합니다", "일치하는 아이디와 메일이 존재하지 않습니다.","error"); //사진을 에러로 가져온 것임.
		
	}
	if(status == "success"){
		swal("가입완료", "저희 PANGPANGMALL에 가입해주셔서 감사합니다!","success");
		
	}

	

</script>
	
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>