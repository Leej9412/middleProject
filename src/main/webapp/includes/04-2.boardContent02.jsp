
<%@page import="kr.or.ddit.board.controller.ReplyDelete"%>
<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8"/>
<title>Insert title here</title>
<style type="text/css">
#modifyForm{
	display : none;
}
.container mt-5{
	background-color: #FFCCCC;
}

</style>

<!-- <script src="../js/boardpang.js" type="text/javascript"></script> -->
<!-- <script src="../js/jquery.serializejson.min.js" type="text/javascript"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script> -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<% 
String mem_id = (String) session.getAttribute("mem_id"); 
int num =  (Integer)request.getAttribute("num");
BoardVO vo = (BoardVO)request.getAttribute("boardVo");

String content = vo.getBoard_contents();
content = content.replaceAll("\r/", "").replaceAll("\n", "<br>");
%>


</head>
<body>

<%-- <%
	// 서블릿에서 저장된 데이터 꺼내기
	
	BoardVO vo = (BoardVO)request.getAttribute("boardVo");

%> --%>
<div class="untree_co-section">
 <div class="container d-flex flex-row justify-content-around">
  	   
         <div class="col-lg-8 mt-4">
             <!-- Post content-->
             <article>
                 <!-- Post header-->
                 <header class="col-md-12 text-left border-bottom mb-1" style="margin-top=5%;">
                     <!-- Post title-->
                     <h1 class="text-black H4" name="board_title"><%=vo.getBoard_title() %></h1>
                     <!-- Post meta content-->
                     <div class="text-black" name="board_date">  <%=vo.getBoard_date() %></div>
                     <!-- Post categories-->
                 </header>
                     <div class="md-12" id="blackPage">
                    	 <a class="btn-outline-black btn-sm btn-block" name="mem_id">작성자 :  <%=vo.getMem_id() %></a>
                     	 <a class="btn-outline-black btn-sm" name="board_hit">조회수 :  <%=vo.getBoard_hit() %></a>
                 	 </div>

                 
                 <!-- Post content-->
                 <div class="row mb-5">
                 	<div class="col-md-12" style="height:500px;">
		                 <section class="border mt-4 p-4 rounded" style="height:100%;; name="board_contents">
		                     <p class="col-12 mb-3 site-blocks-table"> <%= content %></p>
		                 </section>
		            </div>
                 </div>
                 <br>
                 <%if(mem_id!=null && ( mem_id.equals("admin") || mem_id.equals(vo.getMem_id())) ){ %>
	                 <div class="col-md-12 mb-3 mb-md-0">
		                 <button type="button" class="btn btn-black btn-sm btn-block action" data-toggle="modal" data-target="#wModal" value="수정" style="margin-top:.6em" id="write" data-whatever="@mdo">수정</button>
	                 </div>
	                 <div class="col-md-12">
	       			 	<input type="button" value="삭제" class="btn btn-outline-black btn-sm btn-block action" name="delete"><br><br>
	       			</div>
       			<%} %>
             </article>
             <br>
             <hr>
             
             <%
             if(vo!=null && vo.getBoard_cat_no()!=3){  //  공지사항이 아닐때만 나타나기...
             %>
             <!-- Comments section-->
             <section class="mb-5" id="reply">
                 <div class="card bg-light">
                     <div class="card-body pt-4">
                         <!-- Comment form-->
                         <form class="mb-4"><textarea class="form-control" rows="5" placeholder="댓글을 입력해 주세요!" name="textarea" style="width:100%;"></textarea>
                         <%if(mem_id!=null){ %>
                         <input type="button" value="등록" class="btn col-md-12 btn-black action" name="doreply"><br><br></form>
                         <%} %>
                         <!-- Single comment-->
                         	<div class="reply-box"></div>	<!-- 게시판 리스트 출력 -->
							<br><br> 
					 <!-- 페이지 리스트 출력 -->
                     </div>
                 </div>
             </section>
             <%} %>
             
              <input type="button" value="목록" class="btn btn-outline-black action" name="backlist">
               <%if( (mem_id!=null && vo.getBoard_cat_no()!=3)||(mem_id!=null && mem_id!="admin") ){ %>
             	 <input type="button" value="신고" class="btn btn-outline-primary action" name="board_repoart" id="board_repoart"><br><br>
         		<%} %>
         	</div>
     </div>  
 </div>


<!-- 글 수정 The Modal -->
	<form id="modifyForm">
		<textarea rows="5" cols="20" id="area"></textarea>
		<input type="button" value="확인" id="btnok">
		<input type="button" value="취소" id="btncancle">
	</form>
	
	
	<!-- 글쓰기 모달창 -->

 <div class="modal fade" id="wModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" name="mModal action">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">글수정</h5>
<!--          <button type="button" class="close" data-dismiss="modal" aria-label="Close"> --> 
<!--           <span aria-hidden="true">&times;</span> -->
<!--          </button> -->
        <button type="button" class="close" data-dismiss="modal">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="mform" name="mform">
        
	<div class="form-group">
            	<input type="hidden" name="board_no" value="<%=num%>">
            </div>

          <div class="form-group">
            <label for="board_title" class="col-form-label">제목</label>
            <input type="text" class="form-control txt" id="board_title" name="board_title" value="<%=vo.getBoard_title()%>"><br>
          </div>
          
<!--           <div class="form-group"> -->
<!--             <label for="mem_id" class="col-form-label">작성자</label> -->
<%--             <input type="text" class="form-control txt" id="mem_id" name="mem_id" value="<%=vo.getMem_id()%>" readonly> --%>
<!--           </div> -->
          
          <div class="form-group">
            <label for="message-text" class="col-form-label">내용</label>
            <textarea class="txt" cols="60" rows="20" name="board_contents" id="board_contents"><%=vo.getBoard_contents() %></textarea>
          </div>
          
          <label for="board_cat_no">게시판종류</label><br>
			  <select id="board_cat_no" name="board_cat_no">
				    <option value="1" selected>자유게시판</option>
				    <option value="2">문의게시판</option>
<!--  				    <option value="3">공지게시판</option> -->
			  </select>

        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">닫기</button>
        <button type="button" class="btn btn-primary" value="전송" id="msend" aria-label="Close">전송</button>
      </div>
    </div>
  </div>
</div>
<!-- 모달샘플 -->

<script type="text/javascript">

$(function(){
	vidx	 = <%=num%>;
	memId = "<%=vo.getMem_id()%>";   //  글쓴이 ID
	mem_id = "<%=mem_id%>";		//  로그인한  ID
// 	reply_name = rid;

	
	 alert(vidx + "번 내용과 댓글을 보여준다")
	  
	 /*  gthis = this; */
	 
	  replyListServer = function(){
	   $.ajax({
		      url : '/ReplyList.do',
		      data : {"num" : vidx },   // data : {"bonum" : reply.bonum},
		      type : 'post',
		      success : function(res){
		    	  rcode = "";
		    	  console.log(res);
		          $.each(res, function(i, v){
		             board_reply_contents = v.board_reply_contents;
		             console.log("board_reply_contents==="  + board_reply_contents);
		             
		             
		             board_reply_contents = board_reply_contents.replaceAll(/\r/g, "").replaceAll(/\n/g, "<br>");
		        	 let reply_name = v.reply_name;
		             
		             
		             rcode += `
		             			<div class="container mt-4 px-3 pt-3" id="contbox" style="border:thin solid black;">
			 						<div class="reply-body">
			                              <div class="flex-shrink-0"></div>
			                              <div class="ms-3" name="reply1">
			                                  <span class="fw-name">\${v.reply_name}</span>
			                                  &nbsp;&nbsp;&nbsp;
			                                  <span class="fw-date">\${v.reply_date}</span>
			                                 
			                              </div>
			                         </div>

		 		                     <p class="board_reply_contents mt-1 pt-1" id="board_reply_contents">
		 								\${board_reply_contents}</p>`
		 								
		 							 if(mem_id=="admin" || mem_id==reply_name){
		 		      rcode += `     <p class="reply-name-btn">
			 		                     <input type="button" idx="\${v.board_reply_no}" value="댓글수정" name="r_modify" id="r_modify" class="btn col-p1-1 btn-sm btn-black action">
			 		                     <input type="button" idx="\${v.board_reply_no}" value="댓글삭제" name="r_delete" id="r_delete" class="btn col-p1-1 btn-sm btn-outline-black action">
		 		                     </p>`
		 		                      }
		 		                        
		 		     rcode += ` </div>`
		          });
		          
		 	 	 $('.reply-box').html(rcode);
		      },
		      error : function(xhr){
		         alert("상태 : " + xhr.status);
		      }, 
		      dataType : 'json'
       })   
      
	  }
	  replyListServer();
	
	$(document).on('click', '.action', function(){
		actionid =  $(this).attr('name');
		console.log("memID",memId )
		console.log("mem_id",mem_id )
		 if(actionid == "modify"){
		    	if(mem_id==memId|| mem_id=="admin"){
					 $('#mModal').on('show.bs.modal', function () {
						 
					 })
			    }
	    }else if(actionid == "delete"){
	    	
	    	if(mem_id==memId||mem_id=="admin"){
	    		   swal({
	    		        title: "정말 삭제하시겠습니까?",
	    		        text: "",
	    		        icon: "warning",
	    		        buttons: true,
	    		        dangerMode: true,
	    		      })
	    		      .then((willDelete) => {
	    		        if (willDelete) {
	    		        	 $.ajax({
	    					      url : '/BoardDelete.do',
	    					      data : { "num" : vidx },
	    					      type : 'post',
	    					      success : function(res){
	    					         //성공시 - listPageServer(currentPage)
	    					           
	    					         //alert(res.flag);
	    					         if(res.flag=="성공"){
	    					        	 location.href = "<%=request.getContextPath()%>/includes/0.boardIndex.jsp"
	    					         }
	    					      }, 
	    					      error : function(xhr){
	    					         alert("상태 : " + xhr.status);
	    					      }, 
	    					      dataType : 'json'
	    						})
	    		              
	    		        } else {
	    		          swal("취소 되었습니다.");
	    		        }
	    		      })
	    		}
	    	
				
	    }else if(actionid == "backlist"){

			
			if(mem_id=="admin"){
				
				 location.href = "<%=request.getContextPath()%>/includes/admin/board/key0.adminboardIndex.jsp"
			
			}else{
				
				location.href = "<%= request.getContextPath()%>/includes/0.boardIndex.jsp"
				
			}
	        	 
	    }else if(actionid == "board_repoart"){
	    		vidx = vidx
	    		//midx = midx
	    		
    			 swal({
    		        title: "정말 신고하시겠습니까?",
    		        text: "",
    		        icon: "warning",
    		        buttons: true,
    		        dangerMode: true,
    		      })
    		      .then((willDelete) => {
    		        if (willDelete) {
	    		
	    			$.ajax({
	    				  url : '/BoardReport.do',
	    			      data : {"num" : vidx },   // data : {"bonum" : reply.bonum},
	    			      type : 'get',
	    				  success : function(res){
	    					
	    					if(res.flag == "성공"){
	    						//화면 수정
	    		/*				vhit = $(gthis).parents('.boardItem').find('.bh').text().trim();
	    						
	    						vhit = parseInt(vhit) + 1;
	    						
	    						$(gthis).parents('.boardItem').find('.bh').text(vhit);*/
	    					}
	    				},
	    				error : function(xhr){
	    					alert("상태 : " + xhr.status);
	    				},
	    				dataType : 'json'
	    				
	    				})
    				
    		        }else {
  		          		swal("취소 되었습니다.");
		        }
		      })
	    			
	    		
   	            $( '#board_repoart' ).hide();
   	         
		//===================================================
		//댓글 시작
	     }else if(actionid == "doreply"){
	    	 //alert(vidx + "번글에 댓글을 씁니다.");
	    	 
	         
	         //입력한 내용 (textarea), name, bonum
	         reply = {};
	         
	         replContents = $(this).prev().val().trim();
	         if(replContents.length < 1){
	        	 alert("내용을 입력하세요");
	        	 return false;
	         }
	         reply.board_reply_contents =  replContents;
	         reply.board_no = vidx;
	         reply.reply_name = mem_id;
	         console.log(reply);
	         
	         //replyInsertServer();
	         $.ajax({
	             url : '/ReplyInsert.do',
	             data : reply,/* name, bonum, cont */
	             type : 'post',
	             success : function(res){
	                alert(res);
	                
	                // 성공시 화면에 댓글을 출력
	            
// 	            		   $.ajax({
// 	            		      url : '/ReplyList.do',
// 	            		      data : {"num" : vidx },   // data : {"bonum" : reply.bonum},
// 	            		      type : 'post',
// 	            		      success : function(res){
// 	            		    	  console.log(res)
// 	            		         rcode = "";
// 	            		         $.each(res, function(i, v){
// 	            		            board_reply_contents = v.board_reply_contents;
// 	            		            board_reply_contents = board_reply_contents.replaceAll(/\n/g, "<br>");
	            		            
	            		            
// 	            		            rcode += ` <div class="container mt-5" id="contbox" style="border:thick solid #AFDDFA;">
// 	            								<div class="reply-body">
// 	            		                             <div class="flex-shrink-0"></div>
// 	            		                             <div class="ms-3" name="reply1">
// 	            		                                 <span class="fw-name" name="\${v.reply_name}">\${v.reply_name}</span>&nbsp;&nbsp;&nbsp;
// 	            		                                 <span class="fw-date" name="\${v.reply_date}">
// 	            		                             	 \${v.reply_date}
// 	            										 </span><br><br>
// 	            		                             </div>
// 	            		                        </div>
// 	            									<div 
// 	            					                     <p class="board_reply_contents" name="board_reply_contents" id="board_reply_contents" style="background-color:#D7F1FA;">
// 	            											\${board_reply_contents}</p>
// 	            					                     <p class="reply-name-btn">
// 	            					                        <input type="button" idx="\${v.board_reply_no}" value="댓글수정" name="r_modify" id="r_modify" class="action">
// 	            					                        <input type="button" idx="\${v.board_reply_no}" value="댓글삭제" name="r_delete" id="r_delete" class="action">
// 	            					                     </p>
	            									
// 	            							   </div>`
// 	            		         })
// 	            			 	 $('.reply-box').html(rcode);
// 	            		      }, 
// 	            		      error : function(xhr){
// 	            		         alert("상태 : " + xhr.status);
// 	            		      }, 
// 	            		      dataType : 'json'
// 	            		   })   
	            		   replyListServer();
	            		

	             }, 
	             error : function(xhr){
	                alert("상태 : " + xhr.status);
	             }, 
	             dataType : 'json'
	          })   
	       
	         
	         $(this).prev().val("");
	         
	         gthis = this;
	         
	     }else if(actionid == "r_delete"){
	    	  
	    	 ridx = $(this).attr('idx')
	    	 alert(ridx + "번 댓글을 삭제합니다"); 
	    	 
	    	 //replyDeleteServer(this);
	 		$.ajax({
	 			  url : '/ReplyDelete.do',
	 		      data : {"renum" : ridx },   // data : {"bonum" : reply.bonum},
	 		      type : 'post',
	 			  success : function(res){
	 				//성공시 화면 삭제
	 				if(res.flag == "성공"){
	 					//댓글삭제버튼을 기준으로 조상(.reply-body)찾아서 지우자
	 					
	 					replyListServer();
	 				}
	 			},
	 			error : function(xhr){
	 				 alert("상태 : " + xhr.status);
	 			},
	 			dataType : 'json'
	 		})
	 	
	     }else if(actionid == "r_modify"){
	    	  ridx = $(this).attr('idx')
	    	  alert(ridx + "번 댓글을 수정합니다")
	    	  
	    	 //원본내용 가져오기
	    	  vcont = $(this).closest('.container').find('.board_reply_contents').html();//br태그가 포함
	    	  
	    	  console.log("vcont", vcont);
	    	  //br태그를 \n으로 변경
	    	  vmcont = vcont.replaceAll(/<br>/g, "\n");
	    	  console.log("vmcont", vmcont);
	    	  
	    	  //modifyForm에 출력
	    	    $('#modifyForm textarea').val(vmcont);
// 	    	    $('#modifyForm textarea').val();
	    	  
	    	  	$(this).parents('#contbox').find('.board_reply_contents').empty().append($('#modifyForm'));
	    	  	$('#modifyForm').show(); 
	    	  
//	    	  fcode ='<form>'
//		    	  $(댓글수정 this).기준으로 reply - body - p3 - append - fcode를
	     }
		

	})
		$('#blackPage').on('click', function(){
		   	 if(mem_id=="admin"){
		   		 
		   		 location.href = "<%=request.getContextPath()%>/includes/admin/key0.adminhomeIndex.jsp"
		   	 }
		    
		})
 
		
		
		$('#btncancle').on('click', function(){
			//p3을 검색
			//vp3 = $(this).parents('.p3');
			vp3 = $('#modifyForm').parent();
			vcont = $('#modifyForm textarea').val();
			console.log(" 취소 vcont", vcont)
			//modifyForm을 body로 이동
			$('#modifyForm').appendTo('body');
			$('#modifyForm').hide();
			
			//원래내용을 p3에 출력
			$(vp3).html(vcont);
			
		})
		
		//댓글수정에서 확인버튼 클릭 이벤트
		$('#btnok').on('click', function(){
			
			// 수정내용가져오기 - 엔터가 포함
			modicont = $(this).parents('.board_reply_contents').find('textarea').val().trim();
			
			//p3을 검색
			vp3 = $(this).parents('.board_reply_contents');
			
			//modifyForm을 body로 이동
		      $('#modifyForm').appendTo('body');
		      $('#modifyForm').hide();

			//화면을 수정 - <br>테그로 변경
			vmodicont = modicont.replaceAll(/\n/g, "<br>");
			vp3.html(vmodicont);
			
			//db를 수정 - db 수정후 성공시 화면수정
			//replyUpdate();
			
				$.ajax({
				  url : '/ReplyUpdate.do',
			      data : {"cont" : modicont, "num" : vidx},   // data : {"bonum" : reply.bonum},
			      type : 'post',
				  success : function(res){
					alert(res.flag);
					
					//if("성공")화면수정
					if(res.flag=="성공"){
						vp3.html(vmodicont);
					}
					
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
				
			})
		
			
		})
		
	
	
	
	//----------------------------------------------------
	
	
		$('#msend').on('click', function(){
			//입력한 모든 값을 가져온다 - 
 			let formdata = $('#mform').serialize();
// 			let formdata = $('#mform').serializeArray();
//			let formdata = $('#mform').serializeJSON();
			
			console.log(formdata);
			
			boardModifyServer = function(formdata){
				//console.log("formdata.board_no", formdata.board_no)
			   $.ajax({
			      url : '/BoardModify.do',
			      data : formdata,/* witer, mail, subject, password, content */
			      type : 'post',
			      success : function(res){
			         alert(res.flag);
			         if(res.flag=="성공"){
			            
			            // 본문 수정 - modal창의 내용으로 - (formdata)
			         	//listPageServer(currentPage);
						location.href="/BoardContentView.do?num="+vidx;
			         }
			      }, 
			      error : function(xhr){
			         alert("상태 : " + xhr.status);
			      }, 
			      dataType : 'json'
			   })
			   
			}
			boardModifyServer(formdata);
			
			$('#mModal').modal('hide');
			$(".modal-backdrop").hide();
			
			$('.txt').val("");

		})
		
		//-------------------------------------------
		
		//select board cat no 출력

// 	$('#mModal').on('show.bs.modal', function (event) {
// 	  var button = $(event.relatedTarget) // Button that triggered the modal
// 	  var recipient = button.data('whatever') // Extract info from data-* attributes
// 	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
// 	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
// 	  var modal = $(this)
// 	  modal.find('.modal-title').text('New message to ' + recipient)
// 	  modal.find('.modal-body input').val(recipient)
// 	})


		
		
		
	

	
})

</script>
</body>
</html>