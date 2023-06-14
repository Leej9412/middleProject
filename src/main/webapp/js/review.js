/**
 *
 */

myReviewModifyServer = function(){
   $.ajax({
      url: '/newMSJ/modifyMyReview.do',
      data: formdata,
      type: 'post',
      success: function(res){
         alert(res.flag);
         if(res.flag=="성공"){
            
            vparents.find('.rr').text(formdata.re_rate); //평점
                        
            vp3 = formdata.re_content; // 내용
            vpr = vp3.replaceAll(/\n/g,"<br>");
            
            vparents.find('.p3').html(vpr);
         }
      },
      error: function(xhr){
         alert("상태 : " + xhr.status);
      },
      dataType: 'json'
   })
   
}

reviewDeleteServer = function(){
   $.ajax({
         url: 'http://localhost/newMSJ/deleteReview.do',
         data: {"re_no" : vidx },
         type: 'get',
         success: function(res){
            if(res.flag =="성공"){
               listMyReviewServer(currentPage);
            }
         },
         error: function(xhr){
            alert("상태 : " +xhr.status);
            
         },
         dataType: 'json'
   })
   
}

insertReviewWriteServer = function(){
   
   $.ajax({
         url:  'http://localhost/newMSJ/insertReview.do',
         data: formdata,
         type: 'post',
         success: function(res){
            alert(res.flag);
            
         },
         error: function(xhr){
            alert("상태 : " +xhr.status);
            
         },
         dataType: 'json'
         
   })
}


listMyReviewServer = function(vpage){

   stype = $('#stype option:selected').val();
//   sword = $('#sword').val().trim();   
   
   $.ajax({
           url : '/newMSJ/listPage.do',
           data : { 'page' : vpage,
                    'stype' : stype,
//                    'sword' : sword 
                  },
            type : 'post',
            success : function(res) {
            console.log(res)
              code ='<div class="container mt-3"><div id="accordion">'
               $.each(res.datas, function(i,v) {
                     code = `<div class="container mt-3"><div id="accordion">`
                    $.each(res.datas, function(i, v) {
      
                    let reateArrr=["","","","",""];
                    reateArrr[v.re_rate-1] = "checked";
      
                     content = v.re_content;
                     content = content.replaceAll(/\n/g, "<br>");
                        code +=   `<div class="card">
                                   <div class="card-header">
                                    <a class="btn action" name="title" idx="${v.re_no}" data-bs-toggle="collapse" href="#collapse${v.re_no}">상품 아이디 : ${v.p_id} </a>
                                  </div>
                                   <div id="collapse${v.re_no}" class="collapse show" >

                                        <div class="card-body">
                                       <p class="p1">
                                       <div class="star-rating space-x-4 mx-auto">
                                          <input type="radio" id="5555${i}-stars" name="re_rate${i}" value="5" v-model="ratings" ${reateArrr[4]} /> <label for="5555${i}-stars" class="star pr-4">★</label>
                                          <input type="radio" id="4444${i}-stars" name="re_rate${i}" value="4" v-model="ratings" ${reateArrr[3]}/> <label for="4444${i}-stars" class="star">★</label> 
                                          <input type="radio" id="3333${i}-stars" name="re_rate${i}" value="3" v-model="ratings" ${reateArrr[2]}/> <label for="3333${i}-stars" class="star">★</label> 
                                          <input type="radio" id="2222${i}-stars" name="re_rate${i}" value="2" v-model="ratings" ${reateArrr[1]}/> <label for="2222${i}-stars" class="star">★</label> 
                                          <input type="radio" id="1111${i}-star" name="re_rate${i}" value="1" v-model="ratings" ${reateArrr[0]}/> <label for="1111${i}-star"   class="star">★</label>
                                       </div>
                                       리뷰번호 : <span class="rn"> ${v.re_no} </span>&nbsp;&nbsp;&nbsp;
                                       작성자ID : <span class="rd"> ${v.mem_id} </span>&nbsp;&nbsp;&nbsp;
                                       작성날짜 : <span class="rd"> ${v.re_date} </span>&nbsp;&nbsp;&nbsp;
                                       
                                       
                                 </p>
                                 
                                 
                                 <p class="p3">${content}</p>
                                 
                                 
                                 
                                 <p class="p2">
                                     <input type="button" idx="${v.re_no}" data-bs-toggle="modal" data-bs-target="#mModal"  value="수정" name="modify" class="action">
                                             <input type="button" idx="${v.re_no}" value="삭제" name="delete" class="action">
                                  </p>
                              </div>
                              </div>
                              </div>`
                  })
                              
                              code += `</div></div>`
                              
               })
               
                        code += `</div>  </div>`
              
         $('.box').html(code);
         
         // 이전 출력
         pager ="";
         if(res.sp > 1 ){
            pager += `<ul class="pagination">
                       <li class="page-item"><a class="page-link prev" href="#">Previous</a></li>
                    </ul>`
         }
         
         
         // 페이지 번호 출력
       //currentPage =res.tp;
      if(vpage > res.tp) currentPage =res.tp;
         pager += `<ul class="pagination">`;
         for(i = res.sp; i <= res.ep; i++){
            if(i == currentPage){
               pager += `<li class="page-item active"><a class="page-link pnum" href="#">${i}</a></li>`
            }else{
               pager += `<li class="page-item"><a class="page-link pnum" href="#">${i}</a></li>`
            }
            
         }
         pager += `</ul>`
         
         // 다음 출력
         if(res.ep < res.tp){
            pager += `<ul class="pagination">
                       <li class="page-item"><a class="page-link next" href="#">Next</a></li>
                     </ul>`            
            
         }
         $('.plist').html(pager);
               
               
               },
               error: function(xhr){
                  alert("상태:" + xhr.status);
               },
               dataType: 'json'
               
               })
               } 