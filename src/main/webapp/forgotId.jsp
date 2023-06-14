<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@alphardex/aqua.css/dist/aqua.min.css">
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<!-- Main css -->
<link rel="stylesheet" href="css/style1.css">
<style type="text/css">
#errorIDFind{
	text-align: center;
}
</style>
</head>
<body>
<div class="main">
	<section class="sign-in">
		<div class="container">
			<div class="signin-content">
				<div class="signin-form">
					<form action="findId.do" method="post" class="register-form" id="send_form">
							<div class="form-group"> 
 								<label for="mem_name"><i 
									class="zmdi zmdi-face material-icons-name"></i></label> <input
									type="text" name="mem_name" id="mem_name" placeholder="이름입력" required="required"/> 
 							</div> 
 							<div class="form-group"> 
 								<label for="mem_tel"><i 
									class="zmdi zmdi-smartphone-iphone material-icons-name"></i></label> <input
									type="text" name="mem_tel" id="mem_tel" placeholder="전화번호입력 / (-)포함입력" required="required"/> 
 							</div>
					
						           
						     <div class="form-group form-button">
						          <input type="submit" value="찾기" class="btn btn-primary" id="send">
						     </div>
					</form>
				</div>
			</div>
		</div>
	</section>
</div>



   
   <!-- error에 대한 처리 -->
   <%if(request.getParameter("error") != null){ %>
  <h6 id=errorIDFind><font color="red">해당하는 정보로 아이디를 찾지 못했습니다</font></h6>
   <%}%>
</body>
</html>