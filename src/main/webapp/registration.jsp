<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>회원가입</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@alphardex/aqua.css/dist/aqua.min.css">
<!-- Main css -->
<link rel="stylesheet" href="css/style1.css">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		Cookie[] cookies = request.getCookies();
		
		for(int i = 0; i<cookies.length; i++){
			String name = cookies[i].getName();
			String value = cookies[i].getValue();
			if(name.equals("status")){
				// 유효시간을 0초 설정 삭제하는 효과
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);

			}
		}
	%>

<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form method="post" action="registartionServlet.do" class="register-form"
							id="register-form">
							<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
							</div>
							<div class="form-group">
								<label for="mem_id"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="mem_id" id="mem_id" placeholder="아이디입력 / 영어숫자조합 4~7글자이내" required="required"/>
							</div>
							<div class="form-group">
							<span id="idChkResult"></span>
							</div>
							<div class="form-group">
							<input id="idCheck" type="button" class="btn btn-secondary" value="중복확인">
							</div>
							
							<div class="form-group"> 
 								<label for="mem_name"><i 
									class="zmdi zmdi-face material-icons-name"></i></label> <input
									type="text" name="mem_name" id="mem_name" placeholder="이름입력 / 정확히입력해주세요" required="required"/> 
 							</div> 
							<div class="form-group"> 
 								<label for="mem_nick"><i 
									class="zmdi zmdi-mood material-icons-name"></i></label> <input
									type="text" name="mem_nick" id="mem_nick" placeholder="닉네임입력" required="required"/> 
 							</div> 
							<div class="form-group"> 
 								<label for="mem_tel"><i 
									class="zmdi zmdi-smartphone-iphone material-icons-name"></i></label> <input
									type="text" name="mem_tel" id="mem_tel" placeholder="전화번호입력 / (-)포함입력" required="required"/> 
 							</div>
 							
 							 
							<div class="form-group"> 
 								<label for="sample2_postcode"><i 
									class="zmdi zmdi-city material-icons-name"></i></label> <input
									type="text" name="sample2_postcode" id="sample2_postcode" placeholder="우편번호" required="required"/> 
 							</div>
 							<input type="button" class="btn btn-secondary" onclick="sample2_execDaumPostcode()" id="ClickAddr" value="주소 찾기" ><br> 
							<div class="form-group"> 
 								<label for="mem_addr1"><i 
									class="zmdi zmdi-pin material-icons-name"></i></label> <input
									type="text" name="mem_addr1" id="mem_addr1" placeholder="주소" required="required"/> 
 							</div> 
							<div class="form-group"> 
 								<label for="mem_addr2"><i 
									class="zmdi zmdi-pin-drop material-icons-name"></i></label> <input
									type="text" name="mem_addr2" id="mem_addr2" placeholder="상세주소" required="required"/> 
 							</div> 
							<div class="form-group"> 
 								<label for="sample2_extraAddress"><i 
									class="zmdi material-icons-name"></i></label> <input
									type="text" name="sample2_extraAddress" id="sample2_extraAddress" placeholder=" " /> 
 							</div> 
							<div class="form-group"> 
 								<label for="mem_birth"><i 
									class="zmdi zmdi-cake material-icons-name"></i></label> <input
									type="date" name="mem_birth" id="mem_birth" placeholder="생일입력" /> 
 							</div> 
							<div class="form-group">
								<label for="mem_mail"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="mem_mail" id="mem_mail" placeholder="메일입력" required="required"/>
							</div>
							<div class="form-group">
								<label for="mem_pass"><i class="zmdi zmdi-lock"></i></label><input
									type="password" name="mem_pass" id="mem_pass" placeholder="비밀번호 입력" required="required"/>
							</div>
							<div class="form-group">
								<span style="color:grey; ">&nbsp; &nbsp; &nbsp; &nbsp;  영대소문자+특수문자+숫자조합 10자리이상</span>
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="비밀번호 확인" required="required"/>
							</div>
<!-- 							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div> -->
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="btn btn-primary" value="회원가입" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/장원영.jpg" alt="sing up image">
						</figure>
							<div class="form-group form-button">
							<input type="button" class="btn btn-info" 
								onclick="location.href='<%=request.getContextPath() %>/login.jsp'" value="이미 회원입니다.">
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
	
	<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("mem_addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("mem_addr2").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 450; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 2; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>

<script type="text/javascript">
	
	$("#idCheck").on("click", function(){
		var memId = $("#mem_id").val();
		if(memId==""){
			swal("아이디를 입력하세요", " ","error");
			return;
		}
		$.ajax({
	    	 url : '<%=request.getContextPath()%>/member/memberIdCheck.do',
	    	 data : { "mem_id" : memId },
	    	 dataType : 'json',
	    	 success : function(result){
	    		 if(result=="OK"){
	    			 swal("사용 가능", "이 아이디는 사용이 가능합니다.","success");
	    			 $("#idChkResult").html("사용가능");
	    			 $("#idChkResult").css('color','lightgreen');
	    		 }else{
	    			 swal("사용 불가", "중복된 아이디 입니다. ","error");
	    			 $("#idChkResult").html("ID중복 - 사용불가");
	    			 $("#idChkResult").css('color','red');
	    		 }
	    	 },
	    	 error : function(xhr){
	    		 alert("status :" + xhr.status);
	    	 }
	     })
	});
	
 	$("#register-form").on("submit", function(){
		var idchk = $("#idChkResult").html();
		if(idchk!="사용가능"){
			swal("가입 실패", "ID 중복되거나 중복체크를 하지 않았습니다.","error");
			return false;  // 전송 중단.
		}
		if($("#mem_pass").val()!= $("#re_pass").val()){
			swal("비밀번호 오류", "비밀번호와 비밀번호 확인이 다릅니다. 다시 확인하세요.","error");
			return false;
		}
		
		return true;
	}); 
 	
 	
 	
 	<!-- 추가 -->
	/*id 데이터 검증*/
	   $('#mem_id').on('keyup', function() {
	      //입력한 id 값 가져오기
	      idvalue=$('#mem_id').val().trim();
	      
	      idreg = /^[a-zA-Z0-9]{4,7}$/;
	      
	      if(!(idreg.test(idvalue))){
	         // 틀린경우
	         $(this).css('border-bottom','5px solid red');
	         //$('#idcheck').prop('disabled',true);
	      }else{
	         $(this).css('border-bottom','5px solid green');
	         //$('#idcheck').prop('disabled',false);
	         
	      }
	      
	   })
	
	/*이름 데이터 검증*/
	$('#mem_name').on('keyup', function () {
		//입력한 이름 가져오기
		namevalue = $(this).val().trim();
		
		namereg = /^[가-힣]+|^[a-zA-Z]+$/;
		
		if(namereg.test(namevalue)){
			rkor = /^[가-힣]{2,5}$/;
			reng = /^[a-zA-Z]{5,20}$/;
			
			if(rkor.test(namevalue)){
				//한글
				
				$(this).css('border-bottom', '5px solid green')
			}else if(reng.test(namevalue)){
				//영문
				$(this).css('border-bottom', '5px solid green')
			}else{
				$(this).css('border-bottom', '5px solid red')
			}
			
		}else{
			//한글 또는 영문이 아닌 경우
			$(this).css('border-bottom', '5px solid red')
		}
	})
	
	/*닉네임 데이터 검증*/
	$('#mem_nick').on('keyup', function () {
		
		$(this).css('border-bottom', '5px solid green')
	
	})
	
	
	/*주소 전체 데이터 검증*/
	$('#ClickAddr').on('click', function () {
		
		$('#sample2_postcode').css('border-bottom', '5px solid green')
		$('#mem_addr1').css('border-bottom', '5px solid green')
// 		$('#mem_addr2').css('border-bottom', '5px solid green')
		$('#sample2_extraAddress').css('border-bottom', '5px solid green')
	
	})
// 	/*우편번호 데이터 검증*/
// 	$('#sample2_postcode').on('keyup', function () {
		
// 		$(this).css('border-bottom', '5px solid green')
	
// 	})
// 	/*주소 데이터 검증*/
// 	$('#mem_addr1').on('keyup', function () {
		
// 		$(this).css('border-bottom', '5px solid green')
	
// 	})
	/*상세주소 데이터 검증*/
	$('#mem_addr2').on('keyup', function () {
		
		$(this).css('border-bottom', '5px solid green')
	
	})
// 	/*기타주소 데이터 검증*/
// 	$('#sample2_extraAddress').on('keyup', function () {
		
// 		$(this).css('border-bottom', '5px solid green')
	
// 	})
	/*생일 데이터 검증*/
	$('#mem_birth').on('click', function () {
		
		$(this).css('border-bottom', '5px solid green')
	
	})
	
	/*이메일 검증*/
		$('#mem_mail').on('keyup', function () {
		//입력한 이름 가져오기
		mailvalue = $(this).val().trim();
		
		mailreg = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+(\.[a-z-A-Z]+){1,2}$/; //[안에 다쓰면] 순서가 없다 . 점은 \.해야함.
		
		if(mailreg.test(mailvalue)){

 				$(this).css('border-bottom', '5px solid green')

			}else{
				$(this).css('border-bottom', '5px solid red')
			}
			
	
	})
	/*비밀번호 검증 - 영문대(아스키값 65-90)소문자(아스키값 97-122) 숫자(48-57) 특수문자가 반드시 하나씩 포함*/
	//전방탐색 : 찾을문자(?= 기준문자) 찾을 문자가 표현되지 않으면 기준문자는 반드시 포함되어야 한다.
		$('#mem_pass').on('keyup', function () {
		//입력한 이름 가져오기
		pwdvalue = $(this).val().trim();
		
// 		pwdreg = /.*(?=[a-z])/
		pwdreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[~!@#$%^&*()-_=+\|{};:,.<>?]).{10,20}$/;
		
		
		if(pwdreg.test(pwdvalue)){
	
			$(this).css('border-bottom', '5px solid green')
			
		}else{
			$(this).css('border-bottom', '5px solid red')
		}
	})
	
	//비번 확인 
		$('#re_pass').on('keyup', function () {
		//입력한 이름 가져오기
		repwdvalue = $(this).val().trim();
		pwdvaluecheck = $('#mem_pass').val().trim();
		console.log(pwdvaluecheck);
// 		pwdreg = /.*(?=[a-z])/
		repwdreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[~!@#$%^&*()-_=+\|{};:,.<>?]).{10,20}$/;
		console.log(repwdreg.test(repwdvalue));
		
		if(repwdreg.test(repwdvalue) && pwdvaluecheck == repwdvalue){
	
			$(this).css('border-bottom', '5px solid green')
			
		}else{
			$(this).css('border-bottom', '5px solid red')
		}
	})
	
	
	/*전화번호 검증*/
		$('#mem_tel').on('keyup', function () {
		//입력한 이름 가져오기
		telvalue = $(this).val().trim();
		
		telreg = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
//		telreg = /^\d{3}-\d{4}-\d{4}$/;
		
		if(telreg.test(telvalue)){
 				$(this).css('border-bottom', '5px solid green')
			}else{
				$(this).css('border-bottom', '5px solid red')
			}
			
	});
	<!----------------------------- 추가 ------------------------------>
 	
 	
 	
 	
 	
 	


</script>

<script type="text/javascript">
	let status = document.getElementById("status").value;
	if(status == "success"){
		swal("가입완료", "저희 PANGPANGMALL에 가입해주셔서 감사합니다!","success");
		
	}
</script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>