<%@page import="kr.or.ddit.vo.MemberVO"%>
<%MemberVO memVo = (MemberVO) session.getAttribute("loginMember"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<div class="row">
<!-- 주소API -->
					<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:5;-webkit-overflow-scrolling:touch;">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
					</div>
<!-- 주소API -->
<!-- 상태 정보 저장 -->
<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">					
<!-- 상태 정보 저장 -->					

<%-- 					<form method="post" action="<%=request.getContextPath() %>/modifyInformation.do" > --%>
					<div class="col-md-6 mb-5 mb-md-0">
					<div class="p-3 p-lg-5 border">
	
					
						<div class="form-group row">
							<div class="col-md-12">
								<label for="mem_name" class="text-black">
								이름<span class="text-danger">*</span></label>
								 <input type="text" class="form-control"
									id="mem_name" name="mem_name" required="required" value="<%=memVo.getMem_name()%>">
							</div>
						</div>
						
						
						<div class="form-group row">
							<div class="col-md-12">
								<label for="mem_tel" class="text-black">
								전화번호<span class="text-danger">*</span></label>
								 <input type="text" class="form-control"
									id="mem_tel" name="mem_tel" required="required" placeholder="(-)포함 입력" value="<%=memVo.getMem_tel()%>">
							</div>
						</div>
						
						
						<div class="form-group row">
							<div class="col-md-12">
							<label for="sample2_postcode" class="text-black">
								우편번호<span class="text-danger">*</span></label>
								<div class="input-group">
									<input type="text" class="form-control" id="sample2_postcode"
									name="sample2_postcode" required="required">
									<div class="input-group-append">
										<input class="btn btn-dark btn-sm" type="button" onclick="sample2_execDaumPostcode()"
											id="ClickAddr" value="search">
									</div>
								</div>
							</div>
						</div>
						
						<div class="form-group row">
							<div class="col-md-12">
								<label for="mem_addr1" class="text-black">
								주소<span class="text-danger">*</span></label>
								 <input type="text" class="form-control"
									id="mem_addr1" name="mem_addr1" required="required">
							</div>
						</div>
						
						<div class="form-group row">
							<div class="col-md-12">
								<label for="mem_addr2" class="text-black">
								상세주소<span class="text-danger">*</span></label>
								 <input type="text" class="form-control"
									id="mem_addr2" name="mem_addr2" required="required">
							</div>
							<div class="col-md-12">
								<label for="sample2_extraAddress"></label>
								 <input type="text" class="form-control"
									id="sample2_extraAddress" name="sample2_extraAddress" >
							</div>
						</div>
						<br>
						<br>
					
						


					</div>
				</div>
				
				<!-- -------- page 2 -------------- -->
				<div class="col-md-6">
					<div class="p-3 p-lg-5 border">
					
						<div class="form-group row">
							<div class="col-md-12">
								<label for="mem_nick" class="text-black">
								닉네임<span class="text-danger">*</span></label>
								 <input type="text" class="form-control"
									id="mem_nick" name="mem_nick" required="required" value="<%=memVo.getMem_nick()%>">
							</div>
						</div>
					
					
						<div class="form-group row">
							<div class="col-md-12">
								<label for="mem_birth" class="text-black">
								생일</label>
								 <input type="date" class="form-control"
									id="mem_birth" name="mem_birth" value="<%=memVo.getMem_birth()%>">
							</div>
						</div>
						
						<div class="form-group row">
							<div class="col-md-12">
								<label for="mem_mail" class="text-black">
								메일<span class="text-danger">*</span></label>
								 <input type="email" class="form-control"
									id="mem_mail" name="mem_mail" required="required" value="<%=memVo.getMem_mail()%>">
							</div>
						</div>
						
						<div class="form-group row">
							<div class="col-md-12">
								<label for="mem_pass" class="text-black">
								비밀번호<span class="text-danger">*</span></label>
								 <input type="password" class="form-control"
									id="mem_pass" name="mem_pass" required="required" placeholder="영대소문자+특수문자+숫자조합 10자리이상">
							</div>
						</div>
						
						<div class="form-group row">
							<div class="col-md-12">
								<label for="re-pass" class="text-black">
								비밀번호 확인<span class="text-danger">*</span></label>
								 <input type="password" class="form-control"
									id="re_pass" name="re_pass" required="required">
							</div>
						</div>
						
						<div class="form-group row">
							<div class="col-md-12">
							<input type="button" id="modifyingInformation" class="btn btn-dark btn-lg py-3 btn-block" value="modifying information">
							</div>
						</div>
						
				<form method="post" action="<%=request.getContextPath() %>/deleteAccount.do" >
						<div class="form-group row">
							<div class="col-md-12">
							<input type="button" id="deleteAccount" class="btn btn-light btn-lg py-3 btn-block" value="delete account">
							</div>
				
						</div>
				</form>
						
	


					</div>
				
				</div>
<!-- 				</form> -->

				

<!-- 스크립트 -->		
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
    

	
//  	$("#register-form").on("submit", function(){
// 		var idchk = $("#idChkResult").html();
// 		if(idchk!="사용가능"){
// 			swal("가입 실패", "ID 중복되거나 중복체크를 하지 않았습니다.","error");
// 			return false;  // 전송 중단.
// 		}
// 		if($("#mem_pass").val()!= $("#re_pass").val()){
// 			swal("비밀번호 오류", "비밀번호와 비밀번호 확인이 다릅니다. 다시 확인하세요.","error");
// 			return false;
// 		}
		
// 		return true;
// 	}); 
 	
 	
 	

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
	
//ajax를 이용 서블릿 전송 회원정보 수정
	    $('#modifyingInformation').on('click', function () {
	        let mem_id = $('#mem_id').val();
	        let mem_pass = $('#mem_pass').val();
	        let mem_name = $('#mem_name').val();
	        let mem_nick = $('#mem_nick').val();
	        let mem_addr1 = $('#mem_addr1').val();
	        let mem_addr2 = $('#mem_addr2').val();
	        let mem_tel = $('#mem_tel').val();
	        let mem_mail = $('#mem_mail').val();
	        let mem_birth = $('#mem_birth').val();
	        

	        $.ajax({
	            type:'post',
	            url:'<%=request.getContextPath() %>/modifyInformation.do',
	            dataType:'json',
	            data:
	            	{mem_id:mem_id,
	            	mem_pass:mem_pass,
	            	mem_name:mem_name,
	            	mem_nick:mem_nick,
	            	mem_addr1:mem_addr1,
	            	mem_addr2:mem_addr2,
	            	mem_tel:mem_tel,
	            	mem_mail:mem_mail,
	            	mem_birth:mem_birth
	            	},
	            success: function(res) {
	        		
	        		if(res.status == "success"){
	        			swal("회원정보 수정 완료", "다시 로그인해주시기 바랍니다.","success") //알럿창
	        			.then((value) => {
		        			location.replace('<%=request.getContextPath() %>/login.jsp') 
								});
	        		}
	        
	            },
	            error:function (xhr) {
	                alert("상태:" + xhr.status);
	            }
	        })    //ajax

	    })
	    
	    
//ajax를 이용 서블릿 전송 회원 탈퇴
	    $('#deleteAccount').on('click', function () {
	    	swal({
	    		  title: "정말로 회원 탈퇴하시겠습니까?",
	    		  text: "",
	    		  icon: "warning",
	    		  buttons: true,
	    		  dangerMode: true,
	    		})
	    		.then((willDelete) => {
	    		  if (willDelete) {
	    		        $.ajax({
	    		            type:'post',
	    		            url:'<%=request.getContextPath() %>/deleteAccount.do',
	    		            dataType:'json',
	    		            data:
	    		            	{
	    		            	},
	    		            success: function(res) {
	    		        		
	    		        		if(res.status == "success"){
	    		        			swal("회원 탈퇴 완료", "그 동안 저희 pangpang몰을 이용해주셔서 감사합니다.","success")//알럿창
	    		        			.then((value) => {
	    		        			location.replace('<%=request.getContextPath() %>/login.jsp') 
										});
	    		        		}
	    		        
	    		            },
	    		            error:function (xhr) {
	    		                alert("상태:" + xhr.status);
	    		            }
	    		        })    //ajax
	    		        
	    		  } else {
	    		    swal("감사합니다ㅠㅠ");
	    		  }
	    		});



	    })

	


</script>





	