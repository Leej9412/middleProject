<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.3.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.serializejson.min.js" type="text/javascript"></script> <!-- 위치 중요 -->
<script src="<%=request.getContextPath() %>/resources/js/review.js" type="text/javascript"></script>

<style type="text/css">
.star-rating {
   display: flex;
   flex-direction: row-reverse;
   font-size: 1.5rem;
   line-height: 2.5rem;
   justify-content: space-around;
   padding: 0 0.2em;
   text-align: center;
   width: 5em;
}

.star-rating input {
   display: none;
}

.star-rating label {
   -webkit-text-fill-color: transparent;
   /* Will override color (regardless of order) */
   -webkit-text-stroke-width: 2.3px;
   -webkit-text-stroke-color: #2b2a29;
   cursor: pointer;
}

.star-rating :checked ~ label {
   -webkit-text-fill-color: gold;
}

.star-rating label:hover, .star-rating label:hover ~ label {
   -webkit-text-fill-color: #fff58c;
}

.p2{
   float: right;
   width: 25%
}
</style>
<!-- <script type="text/javascript" -->
<%--    src="<%=request.getContextPath()%>/resources/js/jquery-3.6.3.min.js"></script> --%>



</head>

<body>

<input type="button"  data-bs-toggle="modal" data-bs-target="#wModal" class="btn btn-info" value="리뷰등록" id="review_write"><br>

<!-- 리스트 출력 -->
<div class="box"></div>

<!-- 페이지 리스트 출력 -->
<!-- <div class="plist"></div> -->


<!-- 리뷰쓰는 The Modal창입니다 -->
<div class="modal" id="wModal">
   <div class="modal-dialog">
      <div class="modal-content">
   
         <!-- Modal Header -->
         <div class="modal-header">
            <h4 class="modal-title">리뷰등록</h4>
            <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
         </div>   
         
         <!-- Modal body -->
         <div class="modal-body">
         <form id="wform" name="wform">
            <label>평점</label>
               <div class="star-rating space-x-4 mx-auto">
               <input type="radio" id="5-stars" name="re_rate" value="5" v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>
               <input type="radio" id="4-stars" name="re_rate" value="4" v-model="ratings" /> <label for="4-stars" class="star">★</label> 
               <input type="radio" id="3-stars" name="re_rate" value="3" v-model="ratings" /> <label for="3-stars" class="star">★</label> 
               <input type="radio" id="2-stars" name="re_rate" value="2" v-model="ratings" /> <label for="2-stars" class="star">★</label> 
               <input type="radio" id="1-star" name="re_rate" value="1" v-model="ratings" /> <label for="1-star"   class="star">★</label>
            </div>
            
            <label>리뷰 내용</label>
            <textarea class="txt" name="re_content" rows="10" cols="60"></textarea><br>
            
            <input type="button" value="작성완료" id="wsend">
         </form>
         </div>
            
         <!-- Modal footer -->
         <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
         </div>
            
                  </div>
               </div>
            </div>
            
   <!-- 리뷰를 수정하는 The Modal -->   
   <div class="modal" id="mModal">
     <div class="modal-dialog">
       <div class="modal-content">
   
         <!-- Modal Header -->
         <div class="modal-header">
           <h4 class="modal-title">리뷰 수정</h4>
           <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
         </div>
   
         <!-- Modal body -->
         <div class="modal-body">
         <form id="mform" name="mform">         
            <input type="hidden" class="txt" id="re_no" name="re_no">
                        
            <label>평점</label>
               <div class="star-rating space-x-4 mx-auto">
               <input type="radio" id="55-stars" name="re_rate" value="5" v-model="ratings" /> <label for="55-stars" class="star pr-4">★</label>
               <input type="radio" id="44-stars" name="re_rate" value="4" v-model="ratings" /> <label for="44-stars" class="star">★</label> 
               <input type="radio" id="33-stars" name="re_rate" value="3" v-model="ratings" /> <label for="33-stars" class="star">★</label> 
               <input type="radio" id="22-stars" name="re_rate" value="2" v-model="ratings" /> <label for="22-stars" class="star">★</label> 
               <input type="radio" id="11-star" name="re_rate" value="1" v-model="ratings" /> <label for="11-star"   class="star">★</label>
            </div>

            <label>리뷰 내용</label>
            <textarea  class="txt"  rows="10" cols="60" id= "re_content"  name="re_content"></textarea><br>
            
            <input type="button" value="전송" id="msend">

         </form>
         </div>
   
         <!-- Modal footer -->
         <div class="modal-footer">
           <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
         </div>
   
       </div>
     </div>
   </div>
            















<!--    <h1>리뷰 등록 폼</h1> -->
<%--    <form id="insertReview"   action="<%=request.getContextPath()%>/insertReview.do" method="post"> --%>
<!--       <p>평점</p> -->
<!--       <div class="star-rating space-x-4 mx-auto"> -->
<!--          <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label> -->
<!--          <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings" /> <label for="4-stars" class="star">★</label>  -->
<!--          <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings" /> <label for="3-stars" class="star">★</label>  -->
<!--          <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings" /> <label for="2-stars" class="star">★</label>  -->
<!--          <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" /> <label for="1-star"   class="star">★</label> -->
<!--       </div> -->
<!--       리뷰 내용 : <input type="text" name="content"><br> -->
<!--       <!--    사진 첨부 <input type="file" name="re_img"> -->
<!--       <input type="submit" value="저장"><br> -->
<!--       <input type="reset" value="취소"> -->


<!--    </form> -->
<script type="text/javascript">

currentPage = 1;

$(function(){
<%--    const cPath = "<%=request.getContextPath()%>"; --%>
   
   // 첫 페이지 리스트
   listMyReviewServer(1);
   
    
   //페이지 번호 클릭 이벤트
   $(document).on('click','.pagination a.pnum',function () {
      //alert($(this).text().trim())
      
      currentPage = $(this).text().trim();
      listPageServer(currentPage)
   })
   
   //이전버튼 클릭 이벤트
   $(document).on('click','a.prev', function () {
      //alert(parseInt( $('a.pnum').first().text().trim())-1)
      currentPage = parseInt( $('a.pnum').first().text().trim())-1;
      listPageServer(currentPage)
   })
   
   //다음버튼 클릭 이벤트
   $(document).on('click','a.next', function () {
      //alert(parseInt( $('a.pnum').last().text().trim())+1)
      currentPage = parseInt( $('a.pnum').last().text().trim())+1;
      listPageServer(currentPage)
   })   
   
   
   $('#wsend').on('click', function(){
      
      // 입력한 모든 값 가져오기
      formdata = $('#wform').serialize();
      
      console.log(formdata);
      
      insertReviewWriteServer();
      
      $('#wModal').modal('hide');
      $('.txt').val("");
//       $('.star-rating space-x-4 mx-auto').val("");
      
   })
   
   // 버튼 클릭 이벤트 - 수정, 삭제, 댓글등록, 댓글수정, 댓글삭제, 제목클릭
   $(document).on('click', '.action', function(){
      vaction = $(this).attr('name').trim();
      vidx = $(this).attr('idx').trim();
      
      if(vaction == "modify"){
         alert(vidx + "번 리뷰를 수정합니다.");
         
         // 본문의 card에서 해당 값들을 가져와서 모달창에 띄움..
            vparents = $(this).parents('.card');
         
         vr = vparents.find('.rr').text().trim(); // 평점
//          vc = vparents.find('.p3').html().trim(); // 내용
         vc = vparents.find('.p3').html(); // 내용
         vc = vc.replaceAll(/<br>/g, "\n");

         console.log(vr, vc);
         
         // 모달창에 띄우기
         $('#mform #re_no').val(vidx);
         
         $('#mform input[name="re_rate"]').each(function(){
            if(vr==$(this).val()){
               $(this).prop('checked', true);
            }
         });
         
         //$('#mform #re_rate').val(vr);
         
         leng = $('#mform .star').length;
         
         
         ///////////////////////////////////////////////////////
         // for(i=0; i<vr; i++){
             //alert($('.star:eq(i)'))
             
         //   $('.star-rating label:eq(i)').css('-webkit-text-fill-color','gold');
         // } 
         ////////////////////////////////////////////////////////////
         
         
         
         $('#mform #re_content').val(vc);
         
         
            

         
      }else if(vaction=="delete"){
         alert(vidx + "번 리뷰를 삭제합니다.");
         
         reviewDeleteServer();
         
      }
      
   })
   
   //수정 버튼클릭시에 모달창 띄움 data-bs-toggle="modal" data-bs-target="#wModal"
   //본문의 card에서 해당 값들을 가져와서 모달창에 띄운다.
   
   // 모달창에서 수정한다. - 수정후 전송버튼 클릭이벤트
   $('#msend').on('click', function(){
      // 입력한 모든 값을 가져온다. 
      formdata = $('#mform').serializeJSON();
      
      console.log(formdata)
      // DB수정 후 - 화면 수정 
      myReviewModifyServer();
      
      // 모달창 닫기, 모달창에 값 지우기
      $("#mModal").modal('hide');
      $('#mform .txt').val("");
   })

      
      
})
      
   </script>
</body>
</html>