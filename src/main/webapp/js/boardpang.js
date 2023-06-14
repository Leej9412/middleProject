/**
 * 
 */

reportBoardServer = function(){
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
	
}
 hitUpdateServer = function(){
	$.ajax({
		  url : '/HitUpdate.do',
	      data : {"num"  : vidx },   // data : {"bonum" : reply.bonum},
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
	
}

replyUpdate = function(){
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
}


replyDeleteServer = function(but){ //but : 댓글삭제를 받은 파람(삭제버튼)
		
		$.ajax({
		  url : '/ReplyDelete.do',
	      data : {"renum" : ridx },   // data : {"bonum" : reply.bonum},
	      type : 'post',
		  success : function(res){
			//성공시 화면 삭제
			if(res.flag == "성공"){
				//댓글삭제버튼을 기준으로 조상(.reply-body)찾아서 지우자
				$(but).parents('.reply-body').remove();
				replyListServer();
			}
		},
		error : function(xhr){
			 alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}


replyListServer = function(){
   $.ajax({
      url : '/ReplyList.do',
      data : {"num" : vidx },   // data : {"bonum" : reply.bonum},
      type : 'post',
      success : function(res){
         rcode = "";
         $.each(res, function(i, v){
            board_reply_contents = v.board_reply_contents;
            board_reply_contents = board_reply_contents.replaceAll(/\n/g, "<br>");
            
            
            rcode += ` <div class="container mt-5" id="contbox" style="border:thick solid #AFDDFA;">
						<div class="reply-body">
                             <div class="flex-shrink-0"></div>
                             <div class="ms-3" name="reply1">
                                 <span class="fw-name" name="${v.reply_name}">${v.reply_name}</span>&nbsp;&nbsp;&nbsp;
                                 <span class="fw-date" name="${v.reply_date}">
                             	 ${v.reply_date}
								 </span><br><br>
                             </div>
                        </div>
							<div 
			                     <p class="board_reply_contents" name="board_reply_contents" id="board_reply_contents" style="background-color:#D7F1FA;">
									${board_reply_contents}</p>
			                     <p class="reply-name-btn">
			                        <input type="button" idx="${v.board_reply_no}" value="댓글수정" name="r_modify" id="r_modify" class="action">
			                        <input type="button" idx="${v.board_reply_no}" value="댓글삭제" name="r_delete" id="r_delete" class="action">
			                     </p>
							
					   </div>`
         })
	 	 $('.reply-box').html(rcode);
      }, 
      error : function(xhr){
         alert("상태 : " + xhr.status);
      }, 
      dataType : 'json'
   })   
   
}


replyInsertServer = function(){
   $.ajax({
      url : '/ReplyInsert.do',
      data : reply,/* name, bonum, cont */
      type : 'post',
      success : function(res){
         //alert(res.flag);
         
         // 성공시 화면에 댓글을 출력
         replyListServer();
      }, 
      error : function(xhr){
         alert("상태 : " + xhr.status);
      }, 
      dataType : 'json'
   })   
}

boardModifyServer = function(formdata){
	console.log("formdata.board_no", formdata.board_no)
   $.ajax({
      url : '/BoardModify.do',
      data : formdata,/* witer, mail, subject, password, content */
      type : 'post',
      success : function(res){
         alert(res.flag);
         if(res.flag=="성공"){
            
            // 본문 수정 - modal창의 내용으로 - (formdata)
         	//listPageServer(currentPage);
			location.href="/BoardContentView.do?num=" + formdata.board_no;
         }
      }, 
      error : function(xhr){
         alert("상태 : " + xhr.status);
      }, 
      dataType : 'json'
   })
   
}

boardDeleteServer = function(){
   $.ajax({
      url : '/BoardDelete.do',
      data : { "num" : vidx },
      type : 'get',
      success : function(res){
         //성공시 - listPageServer(currentPage)
           
         //alert(res.flag);
         if(res.flag=="성공"){
            listPageServer(currentPage);
         }
      }, 
      error : function(xhr){
         alert("상태 : " + xhr.status);
      }, 
      dataType : 'json'
   })
}



boardWriteServer = function(){
   
   $.ajax({
      url : '/BoardWrite.do',
      data : formdata,
      type : 'post',
      success : function(res){
         //저장 성공시 - listPageServer
         //alert(res.flag);


         if(res.flag=="성공"){
	
            listPageServer(1);
         }
         
      }, 
      error : function(xhr){
         alert("상태 : " + xhr.status);
      }, 
      dataType : 'json'
      
   })
}


listPageServer = function(vpage){
   stype = $('#stype option:selected').val();
   catval = $('#board_cat_select option:selected').val();
   sword = $('#sword').val().trim();
   
   $.ajax({
//      url : '<%=request.getContextPath()%>/ListPage.do',
      url : '/ListPage.do',
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
//            board_content = board_content.replaceAll(/\n/g, "<br>");
            
      code +=   `
               <tr class="boardItem" data-num="${v.board_no}" vidx="${v.board_no}">
                              <td><span class="bn">${v.board_no}</span>&nbsp;&nbsp;&nbsp;</td>
                              <td><span class="bt">${v.board_title}</span>&nbsp;&nbsp;&nbsp;</td>
                             <td><span class="bi">${v.mem_id}</span>&nbsp;&nbsp;&nbsp;</td>
                            <td><span class="bd">${v.board_date}</span>&nbsp;&nbsp;&nbsp;</td>
                             <td><span class="bh">${v.board_hit}</span></td>
               </tr>
            `
            
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
         
//            pager += `<ul class="custom-pagination">
//              <li><a class="prev" href="#"> <svg width="1em" height="1em"
//                     viewBox="0 0 16 16" class="bi bi-arrow-left" fill="currentColor"
//                     xmlns="http://www.w3.org/2000/svg">
//                        <path fill-rule="evenodd"
//                        d="M5.854 4.646a.5.5 0 0 1 0 .708L3.207 8l2.647 2.646a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 0 1 .708 0z" />
//                        <path fill-rule="evenodd"
//                        d="M2.5 8a.5.5 0 0 1 .5-.5h10.5a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
//                      </svg>
//            </a></li>
//            </ul>`

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
               </a></li>`;
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
/*                  pager += `<svg width="1em" height="1em"
                              viewBox="0 0 16 16" class="bi bi-arrow-right" fill="currentColor"
                              xmlns="http://www.w3.org/2000/svg">
                                 <path fill-rule="evenodd"
                                 d="M10.146 4.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L12.793 8l-2.647-2.646a.5.5 0 0 1 0-.708z" />
                                 <path fill-rule="evenodd"
                                 d="M2 8a.5.5 0 0 1 .5-.5H13a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 8z" />
                               </svg>
                     </a></li>
                  </ul>`*/
                  
         // 다음 출력
         if(res.endPage < res.totalPage){
            pager += `
               <li><a class="next" href="#"> <svg width="1em" height="1em"
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
}/* listPageServer 끝... *//* listPageServer 끝... */