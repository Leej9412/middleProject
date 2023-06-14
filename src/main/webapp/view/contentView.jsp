<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8"/>
<title>Insert title here</title>
<script src="../js/jquery.serializejson.min.js" type="text/javascript"></script>
<script src="../js/board.js" type="text/javascript"></script>

<style type="text/css">
#modifyForm{
	display : none;
}
.container mt-5{
	background-color: #FFCCCC;
}

</style>



<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
<% 
int num =  (Integer)request.getAttribute("num");
BoardVO vo = (BoardVO)request.getAttribute("boardVo");
%>
$(function(){
	vidx	 = <%=num%>
	
	$(document).on('click', '.action', function(){
		
		actionid =  $(this).attr('name');
		
		 if(actionid == "modify"){
			
		
	    }else if(actionid == "delete"){
	         //alert(vidx + "번글을 삭제합니다."); 
			 $.ajax({
			      url : 'http://localhost/pangboardpro/BoardDelete.do',
			      data : { "num" : vidx },
			      type : 'post',
			      success : function(res){
			         //성공시 - listPageServer(currentPage)
			           
			         //alert(res.flag);
			         if(res.flag=="성공"){
			        	 location.href = "<%=request.getContextPath()%>/board/boardmain.jsp"
			         }
			      }, 
			      error : function(xhr){
			         alert("상태 : " + xhr.status);
			      }, 
			      dataType : 'json'
				})
				
	    }else if(actionid == "backlist"){
	         
	        	 location.href = "<%=request.getContextPath()%>/board/boardmain.jsp"
	        	 
	    }else if(actionid == "board_repoart"){
	    		vidx = vidx
	    		//midx = midx
	    		
	    		reportBoardServer();
   	            $( '#board_repoart' ).hide();
   	         
		//===================================================
		//댓글 시작
	     }else if(actionid == "doreply"){
	    	 alert(vidx + "번글에 댓글을 씁니다.");
	    	 
	         
	         //입력한 내용 (textarea), name, bonum
	         reply = {};
	         
	         reply.board_reply_contents = $(this).prev().val();
	         reply.board_no = vidx;
	         reply.reply_name = 'reply_name';
	         
	         
	         replyInsertServer();
	         $(this).prev().val("");
	         
	         gthis = this;
	         
	     }else if(actionid == "r_delete"){
	    	  
	    	 ridx = $(this).attr('idx')
	    	 alert(ridx + "번 댓글을 삭제합니다"); 
	    	 
	    	 replyDeleteServer(this);
	    	  
	     }else if(actionid == "r_modify"){
	    	  ridx = $(this).attr('idx')
	    	  alert(ridx + "번 댓글을 수정합니다")
	    	  
	    	 //원본내용 가져오기
	    	 // vcont = $(this).parent('.p').find('.board_reply_contents').html();//br태그가 포함
	    	  
	    	  //br태그를 \n으로 변경
	    	 // vmcont = vcont.replaceAll(/<br>/g, "\n");
	    	  
	    	  //modifyForm에 출력
	    	  //$('#modifyForm textarea').val(vmcont);
	    	    $('#modifyForm textarea').val();
	    	  
	    	  	$(this).parents('#contbox').find('.board_reply_contents').empty().append($('#modifyForm'));
	    	  	$('#modifyForm').show(); 
	    	  
//	    	  fcode ='<form>'
//		    	  $(댓글수정 this).기준으로 reply - body - p3 - append - fcode를
	     }

	})
	
 			$(document).ready(function(){
 			
		  
			  alert(vidx + "번 내용과 댓글을 보여준다")
				  
				  gthis = this;
				  replyListServer();
			  	  
 			})
		  	  
		
		
		$('#btncancle').on('click', function(){
			//p3을 검색
			vp3 = $(this).parents('.p3');
			//vp3 = $('#modifyForm').parent();
			
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
			//vp3.html(vmodicont);
			
			//db를 수정 - db 수정후 성공시 화면수정
			replyUpdate();
			
			
		})
		
	
	
	
	//----------------------------------------------------
	
	
		$('#msend').on('click', function(){
			//입력한 모든 값을 가져온다 - 
// 			let formdata = $('#mform').serialize();
// 			let formdata = $('#mform').serializeArray();
			let formdata = $('#mform').serializeJSON();
			
			console.log(formdata);
			
			boardModifyServer(formdata);
			
			$('#mModal').modal('hide');
			$('.txt').val("");

		})
		
		//-------------------------------------------
		
		//select board cat no 출력




		
		
		
	

	
})

</script>
</head>
<body>

<%-- <%
	// 서블릿에서 저장된 데이터 꺼내기
	
	BoardVO vo = (BoardVO)request.getAttribute("boardVo");

%> --%>
 <div class="container mt-5">
 	<div class="row">
         <div class="col-lg-8">
             <!-- Post content-->
             <article>
                 <!-- Post header-->
                 <header class="mb-4">
                     <!-- Post title-->
                     <h1 class="fw-bolder mb-1" name="board_title"><%=vo.getBoard_title() %></h1>
                     <!-- Post meta content-->
                     <div class="text-muted fst-italic mb-2" name="board_date">  <%=vo.getBoard_date() %></div>
                     <!-- Post categories-->
                     <a class="badge bg-secondary text-decoration-none link-light" name="mem_id">  <%=vo.getMem_id() %></a>
                     <a class="badge bg-secondary text-decoration-none link-light" name="board_hit">  <%=vo.getBoard_hit() %></a>
                 </header>
                 <br>
                 <input type="button" value="수정" data-bs-toggle="modal" data-bs-target="#mModal" class="btn btn-primary action" name="modify">
       			 <input type="button" value="삭제" class="btn btn-primary action" name="delete"><br><br>
       			
                 <hr>
                 <!-- Post content-->
                 <section class="mb-5" name="board_contents">
                     <p class="fs-5 mb-4">  <%= vo.getBoard_contents()%></p>
                 </section>
             </article>
             <br>
             <hr>
             <!-- Comments section-->
             <section class="mb-5" id="reply">
                 <div class="card bg-light">
                     <div class="card-body">
                         <!-- Comment form-->
                         <form class="mb-4"><textarea class="form-control" rows="3" placeholder="댓글을 입력해 주세요!" name="textarea" style="width:80%;"></textarea>
                         <input type="button" value="등록" class="btn btn-primary action" name="doreply"><br><br></form>
                         <!-- Single comment-->
                         	<div class="reply-box"></div>	<!-- 게시판 리스트 출력 -->
							<br><br> 
					 <!-- 페이지 리스트 출력 -->
                     </div>
                 </div>
             </section>
              <input type="button" value="목록" class="btn btn-primary action" name="backlist"><br><br>
              <input type="button" value="신고" class="btn btn-primary action" style="background-color:red;" name="board_repoart" id="board_repoart"><br><br>
         </div>
     </div>

 
 </div>


<!-- 글 수정 The Modal -->
	<form id="modifyForm">
		<textarea rows="5" cols="20" id="area"></textarea>
		<input type="button" value="확인" id="btnok">
		<input type="button" value="취소" id="btncancle">
	</form>
	
	
<div class="modal" id="mModal" >
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">글수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form id="mform" name="mform">
        	
        	<input type="hidden" name="board_no" value="<%=num%>">
        	<label>제목</label><br>
        	<input type="text" class="txt"  name="board_title" id="board_title" value="<%=vo.getBoard_title()%>"><br>
        	
        	<label>작성자</label><br>
        	<input type="text" class="txt" name="mem_id"  id="mem_id" value="<%=vo.getMem_id()%>" readonly><br>
			
        	<label>내용</label><br>
        	<textarea class="txt" cols="60"  name="board_contents" id="board_contents"><%=vo.getBoard_contents() %></textarea>
        	<br>
        	
		  	<label for="board_cat_no">게시판종류</label><br>
			  <select id="board_cat_no" name="board_cat_no">
				    <option value="1" selected>자유게시판</option>
				    <option value="2">문의게시판</option>
			  </select><br>
			
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" value="전송" id="msend" class="btn btn-danger" data-bs-dismiss="modal">전송</button><br>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>