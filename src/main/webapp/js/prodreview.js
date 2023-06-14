/**
 *
 */

listProdReviewServer = function(vpage){
   stype = $('#stype option:selected').val();
   
   $.ajax({
         url: '/newMSJ/productListPage.do',
         data: {
               'page' : vpage,
               'stype' : stype,
         },
         type: 'post',
         success: function(res){
            console.log(res)
            code ='<div class="container mt-3"><div id="accordion">'
               $.each(res.datas, function(i,v) {
                     code = `<div class="container mt-3"><div id="accordion">`
                 $.each(res.datas, function(i, v){
                  
                    let reateArr=["","","","",""];
                    reateArr[v.re_rate-1] = "checked";
            
                     content = v.re_content;
                     content = content.replaceAll(/\n/g, "<br>");
                        code +=   `<div class="card">
                                   <div class="card-header">
                                    <a class="btn action" name="title" idx="${v.re_no}" data-bs-toggle="collapse" href="#collapse${v.re_no}">상품 아이디 : ${v.p_id}</a>
                                  </div>
                                   <div id="collapse${v.re_no}" class="collapse show">
                                 
                                 <div class="card-body">
                                    <p class="p1">
                                       
                                       <div class="star-rating space-x-4 mx-auto">
                                          <input type="radio" id="555${i}-stars" name="re_rate${i}" value="5" v-model="ratings" ${reateArr[4]} /> <label for="555${i}-stars" class="star pr-4">★</label>
                                          <input type="radio" id="444${i}-stars" name="re_rate${i}" value="4" v-model="ratings" ${reateArr[3]}/> <label for="444${i}-stars" class="star">★</label> 
                                          <input type="radio" id="333${i}-stars" name="re_rate${i}" value="3" v-model="ratings" ${reateArr[2]}/> <label for="333${i}-stars" class="star">★</label> 
                                          <input type="radio" id="222${i}-stars" name="re_rate${i}" value="2" v-model="ratings" ${reateArr[1]}/> <label for="222${i}-stars" class="star">★</label> 
                                          <input type="radio" id="111${i}-star" name="re_rate${i}" value="1" v-model="ratings" ${reateArr[0]}/> <label for="111${i}-star"   class="star">★</label>
                                       </div>
                                       
                                       리뷰번호 : <span class="rn"> ${v.re_no} </span>&nbsp;&nbsp;&nbsp;
                                       작성자ID : <span class="rd"> ${v.mem_id} </span>&nbsp;&nbsp;&nbsp;
                                       작성날짜 : <span class="rd"> ${v.re_date} </span>&nbsp;&nbsp;&nbsp;
                                 </p>
                                 <p class="3">${content}</p>
                                 </div>
                                 </div>
                                 </div>`
                        })
                        code +=`</div></div>`
               })
                        code +=`</div></div>`
                        
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