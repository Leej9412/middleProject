<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>비밀번호 찾기</title>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link href='' rel='stylesheet'>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.3.min.js"></script>
<script src="js/main.js"></script>

<style>
body {
	background-position: center;
	background-color: #eee;
	background-repeat: no-repeat;
	background-size: cover;
	color: #505050;
	font-family: "Rubik", Helvetica, Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	line-height: 1.5;
	text-transform: none
}

.forgot {
	background-color: #fff;
	padding: 12px;
	border: 1px solid #dfdfdf
}

.padding-bottom-3x {
	padding-bottom: 72px !important
}

.card-footer {
	background-color: #fff
}

.btn {
	font-size: 13px
}

.form-control:focus {
	color: #495057;
	background-color: #fff;
	border-color: #76b7e9;
	outline: 0;
	box-shadow: 0 0 0 0px #28a745
}
</style>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<!-- Main css -->
<link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@alphardex/aqua.css/dist/aqua.min.css">

</head>
<body>
<div class="main">
	<section class="sign-in">
		<div class="container">
			<div class="signin-content">
				<div class="signin-form">
				<form class="register-form" action="forgotPassword" method="POST" id="send_form">
						<div class="form-group">
							<label for="mem_id">
							<i class="zmdi zmdi-account material-icons-name"></i></label>
							 <input type="text" name="mem_id" id="mem_id" placeholder="아이디입력" required/>
						</div>
						<div class="form-group">
							<label for="mem_mail"><i class="zmdi zmdi-email"></i></label>
							<input	type="email" name="email" id="mem_mail" placeholder="메일입력" required/>
						</div>
					<div class="form-group form-button">
						<input type="submit" name="signup" id="signup"
									class="btn btn-primary" value="비밀번호 찾기" />
					</div>
				</form>
			 </div>
			</div>
		</div>
		</section>
</div>
	
	<script type='text/javascript'
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
</body>
</html>