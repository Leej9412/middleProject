
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>

<%MemberVO memVo = (MemberVO) session.getAttribute("loginMember"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <script src="../js/jquery-3.6.3.min.js" type="text/javascript"></script> -->

</head>
<body>
<div class="untree_co-section p-0">
	<div class="container">	
		<div class="navbar navbar-expand-sm navbar-dark" style="margin-left:42%;">
<!-- 			  <button type="button" class="btn btn-black" style="margin-right:38%;" style="margin-left:5%;" data-toggle="modal" data-target="#wModal" value="글쓰기" style="margin-top:.6em" id="write" data-whatever="@mdo">글쓰기</button> -->
		  		
		  	  <select class="form-control me-2" id="stype" style="width:100px;">
		  	  	<option value="board_no">번호</option>
		  	  	<option value="board_title">제목</option>
		  	  	<option value="mem_id">작성자</option>
		  	  	<option value="board_date">날짜</option>
		  	  	<option value="board_hit">조회수</option>
		  	  </select>
		  		
	<!-- 		      <form class="d-flex"> -->
		        <input id="sword" class="form-control me-2" type="text" style="width:190px;" placeholder="Search">
		        <button id="search" class="btn btn-black" type="button">Search</button>
	<!-- 		      </form> -->
	<!-- 		      <form action=""> -->
<!-- 		      	  <select id="board_cat_select" name="board_cat_no" class="form-control me-2" style="width:130px;"> -->
<!-- 					    <option value="1">자유게시판</option> -->
<!-- 					    <option value="2">문의게시판</option> -->
<!-- 					    <option value="3" selected>공지사항</option> -->
<!-- 				  </select> -->
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
</div>	

<div class="modal fade" id="nModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">글쓰기</h5>
<!--          <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--          </button> -->
        <button type="button" class="close" data-dismiss="modal">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="nform" name="nform">
        
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">제목</label>
            <input type="text" class="form-control txt" id="board_title" name="board_title" >
          </div>
          
<!--           <div class="form-group"> -->
<!--             <label for="recipient-name" class="col-form-label">작성자</label> -->
<!--             <input type="text" class="form-control txt" id="mem_id" name="mem_id"> -->
<!--           </div> -->
          
          <div class="form-group">
            <label for="message-text" class="col-form-label">내용</label>
            <textarea class="form-control txt" id="board_contents" name="board_contents"></textarea>
          </div>
          
          <label for="board_cat_no">게시판종류</label><br>
			  <select id="board_cat_no" name="board_cat_no">
<!-- 				    <option value="1" selected>자유게시판</option> -->
<!-- 				    <option value="2">문의게시판</option> -->
<!-- 				    <option value="3">공지게시판</option> -->
			  </select>

        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" value="전송" id="nsend">전송</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">


$(function(){
	

boardReportList = function(vpage){
	
	   catval = $('#catval option:selected').val();
	   stype = $('#stype option:selected').val();
	   sword = $('#sword').val().trim();
	   currentPage = vpage;
	   $.ajax({
<%-- 	      url : '<%=request.getContextPath()%>/ListPage.do', --%>
	      url : '/myPageBoardList.do',
	      data : { 
	               'page' : vpage , 
	               'stype' : stype , 
	               'sword' : sword ,
				   'catval': catval
	            },
	      type : 'post',
	      success : function(res){
	         code = `<div class="container mt-3">
	                  <table class="table">
						<thead>
							<tr>
								<td>번호</td>
								<td>제목</td>
								<td>작성자</td>
								<td>날짜</td>
								<td>조회수</td>
							</tr>
						</thead>
						<tbody id="tbody">`
	            $.each(res.datas, function(i, v) {
	               
	            board_contents = v.board_contents;
	//console.log("board_content", board_content);
//	            board_content = board_content.replaceAll(/\n/g, "<br>");
	            
	      code +=   `<tr class="boardItem" data-num="\${v.board_no}" vidx="\${v.board_no}">
		                       	 <td><span class="bn">\${v.board_no}</span>&nbsp;&nbsp;&nbsp;</td>
		                       	 <td><span class="bt">\${v.board_title}</span>&nbsp;&nbsp;&nbsp;</td>
		                      	 <td><span class="bi">\${v.mem_id}</span>&nbsp;&nbsp;&nbsp;</td>
		                     	 <td><span class="bd">\${v.board_date}</span>&nbsp;&nbsp;&nbsp;</td>
		                      	 <td><span class="bh">\${v.board_hit}</span></td>
					</tr>`
	            
	            })
	            
	            code += `</tbody>
					</table>
	               </div>`

	         $('.box').html(code);
	         
	         pager = "";
	         // 이전 출력
				pager += `<div class="row mt-5 pb-5">
						<div class="col-lg-12">
						 <div class="custom-pagination">
							<ul class="list-unstyled">`
	         if(res.startPage > 1){
				

				pager += `
							<ul class="list-unstyled">
								<li><a class="prev" href="#"> <svg width="1em" height="1em"
									viewBox="0 0 16 16" class="bi bi-arrow-left" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
		                        <path fill-rule="evenodd"
										d="M5.854 4.646a.5.5 0 0 1 0 .708L3.207 8l2.647 2.646a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 0 1 .708 0z" />
		                        <path fill-rule="evenodd"
										d="M2.5 8a.5.5 0 0 1 .5-.5h10.5a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
		                      </svg>
						</a></li>`
						;
	         }
	         // 페이지 번호 출력
	         if(vpage > res.totalPage) currentPage = res.totalPage;
	         
	         
	         for(i = res.startPage; i <= res.endPage ; i++){
	            if( i == currentPage ){
	               pager += `<li class="active"><a href="#" class="pnum">${i}</a></li>`
	            }else{
	               pager += `<li class="page-item"><a class="page-link pnum" href="#">${i}</a></li>`
	            }
	         }

	         // 다음 출력
	         if(res.endPage < res.totalPage){
	            pager += `
	               <li><a class="next" href="#"> 
	               			<svg width="1em" height="1em"
								viewBox="0 0 16 16" class="bi bi-arrow-right" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
	                        <path fill-rule="evenodd"
									d="M10.146 4.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L12.793 8l-2.647-2.646a.5.5 0 0 1 0-.708z" />
	                        <path fill-rule="evenodd"
									d="M2 8a.5.5 0 0 1 .5-.5H13a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 8z" />
	                      </svg>
					</a></li>
	               </ul>
						</div>
					</div>
				</div>`
	         
	         }
	         
	         $('.plist').html(pager);
	       },
	      error : function(xhr){
	         alert("상태 : " + xhr.status);
	      },
	      dataType : 'json'
	   })
	}
		
		  boardReportList(1);
		
		$('#search').on('click', function(){
			boardReportList(1);
		})
		
	  $(document).on('click', '.boardItem', function(){
				vidx = $(this).attr('vidx').trim();
				var num = $(this).data('num');
				  gthis = this;

		 
	   	location.href="<%=request.getContextPath()%>/BoardContentView.do?num="+num
	  })	  		  
})
</script>
</body>
</html>	
	


				







	