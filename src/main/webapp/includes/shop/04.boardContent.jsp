<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <script src="../js/jquery-3.6.3.min.js" type="text/javascript"></script> -->
<script src="../js/boardpang.js" type="text/javascript"></script>
<script src="../js/jquery.serializejson.min.js" type="text/javascript"></script>


<style type="text/css">
/* .p1{ */
/* 	float : left; */
/* 	width : 70%; */
/* } */
/* .p2{ */
/* 	float : right; */
/* 	width : 25%; */
/* } */
/* .p3{ */
/* 	clear : both; */
/* } */
/* input[name=reply]{ */
/* 	height : 50px; */
/* 	vertical-align: top; */
/* } */
/* #stype{ */
/* 	width: 10%; */
/* 	margin-left : 100px; */

/* } */
/* #sword{ */
/* 	float : left; */
/* } */
/* nav{ */
	
/* 	width : 50%; */
/* 	margin-left: 40%; */
/* 	margin-top: 100px; */
	
/* } */
.pagination{
 	width: 40%; 
	float: none; 
	margin : 0 auto;
}
/* .plist{ */
/* 	margin-left : 45%; */
/* } */
/* #write{ */
/* 	margin-left : 80%; */
/* } */
/* .reply-body{ */
/* 	border : 1px dotted pink; */
/* 	background: #F1F2FF; */
/* 	padding : 10px; */
/* 	margin: 3px; */
/* } */
 #modifyForm{ 
	display : none; 
 } 
/* #write{ */
/* 	float:left; */
/* 	margin-left: 10%; */
/* } */

</style>



</head>
<body>

<div class="untree_co-section">
	<div class="container">
	
		
		<div class="navbar navbar-expand-sm navbar-dark ml-4" >
			  <button type="button" class="btn btn-primary" style="margin-right:38%;" style="margin-left:5%;" data-toggle="modal" data-target="#wModal" value="글쓰기" style="margin-top:.6em" id="write" data-whatever="@mdo">글쓰기</button>
		  		
		  	  <select class="form-control me-2" id="stype" style="width:100px;">
		  	  	<option value="board_no">번호</option>
		  	  	<option value="board_title">제목</option>
		  	  	<option value="mem_id">작성자</option>
		  	  	<option value="board_date">날짜</option>
		  	  	<option value="board_hit">조회수</option>
		  	  </select>
		  		
<!-- 		      <form class="d-flex"> -->
		        <input id="sword" class="form-control me-2" type="text" style="width:190px;" placeholder="Search">
		        <button id="search" class="btn btn-primary" type="button">Search</button>
<!-- 		      </form> -->
<!-- 		      <form action=""> -->
		      	  <select id="board_cat_select" name="board_cat_no" class="form-control me-2" style="width:130px;">
					    <option value="1">자유게시판</option>
					    <option value="2">문의게시판</option>
					    <option value="3" selected>공지사항</option>
				  </select>
<!-- 		      </form> -->
		
		</div>
		<div class="container">
			<div class="row mb-5">
				<form class="col-md-12" method="post">
					<div class="site-blocks-table">
						<div class="box"></div>	<!-- 게시판 리스트 출력 -->
						<br><br>
					</div>
				</form>
			</div>
	
			
			<div class="row" style="width:40%;"style="float:none;"style="margin:0 auto;">
				<div class="plist"></div> 

			</div>
		</div>
		
		

		
	</div>
	<!-- 글쓰기 모달창 -->
<div class="modal fade" id="wModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">글쓰기</h5>
<!--          <button type="button" class="close" data-dismiss="modal" aria-label="Close"> --> -->
<!--           <span aria-hidden="true">&times;</span> --> -->
<!--          </button> -->
        <button type="button" class="close" data-dismiss="modal">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="mform" name="mform">
        
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">제목</label>
            <input type="text" class="form-control txt" id="board_title" name="board_title" >
          </div>
          
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">작성자</label>
            <input type="text" class="form-control txt" id="mem_id" name="mem_id">
          </div>
          
          <div class="form-group">
            <label for="message-text" class="col-form-label">내용</label>
            <textarea class="form-control txt" id="board_contents" name="board_contents"></textarea>
          </div>
          
          <label for="board_cat_no">게시판종류</label><br>
			  <select id="board_cat_no" name="board_cat_no">
				    <option value="1" selected>자유게시판</option>
				    <option value="2">문의게시판</option>
<!-- 				<option value="3">공지게시판</option> -->
			  </select>

        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" value="전송" id="wsend">전송</button>
      </div>
    </div>
  </div>
</div>
</div>

<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script> -->
<script>
currentPage = 1;
	$(function(){
		
		//$('#modifyForm').css('display', 'none')
		//$('#modifyForm').hide();
		
		// 처음실행
		listPageServer(1);
		
		//페이지 번호 클릭 이벤트
		$(document).on('click','.custom-pagination a.pnum', function(){
			//alert( $(this).text().trim() )
			currentPage = $(this).text().trim();
			listPageServer(currentPage);
		})
		
		//이전버튼 클릭 이벤트
		$(document).on('click', 'a.prev', function(){
// 			console.log("prev  시작...")
			//alert( parseInt( $('a.pnum').first().text().trim() ) - 1)
			currentPage = parseInt( $('a.pnum').first().text().trim() ) - 1;
			listPageServer(currentPage);
		})
		//다음 버튼 클릭이벤트
		$(document).on('click', 'a.next', function(){
			//alert( parseInt( $('a.pnum').last().text().trim() ) + 1)
			currentPage = parseInt( $('a.pnum').last().text().trim() ) + 1;
			listPageServer(currentPage);
		})
		
		//검색 이벤트
		$('#search').on('click', function(){
			listPageServer(1);
		})
		

		//글쓰기 전송버튼 이벤트
		$('#mModal').on('show.bs.modal', function () {
//		  var button = $(event.relatedTarget) // Button that triggered the modal
//		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
//		  var modal = $(this)
//		  modal.find('.modal-title').text('New message to ' + recipient)
//		  modal.find('.modal-body input').val(recipient)
		})
		
		$('#wsend').on('click', function(){
			//입력한 모든 값을 가져온다 - 
			formdata = $('#wform').serialize();
// 			formdata = $('#wform').serializeArray();
// 			formdata = $('#wform').serializeJSON();
			
			console.log(formdata);
			
			boardWriteServer();

			$('#wModal').modal('hide');
			$(".modal-backdrop").hide();
			
			$('.txt').val("");
			
		})
		$(document).on('click', '#board_cat_select', function(){
			listPageServer();
		})
		
		
		//버튼 클릭 이벤트 - 수정, 삭제, 댓글등록, 댓글 수정, 댓글 삭제, 제목클릭
		$(document).on('click', '.boardItem', function(){
				vidx = $(this).attr('vidx').trim();
				var num = $(this).data('num');
				  gthis = this;
				
	    	  //조회수 증가
	    		  alert(vidx + "글 조회수 증가");
	    		 
	    	  hitUpdateServer();

	    	location.href="<%=request.getContextPath()%>/BoardContentView.do?num=" + num
	    	  
	    	  

		
		})

	})

</script>

</body>
</html>