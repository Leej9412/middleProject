<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.3.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.serializejson.min.js" type="text/javascript"></script> <!-- 위치 중요 -->
<script src="<%=request.getContextPath() %>/resources/js/prodreview.js" type="text/javascript"></script>

<style type="text/css">


</style>

<script type="text/javascript">

currentPage = 1;

$(function(){
<%-- 	const cPath ="<%=request.getContextPath()%>"; --%>
	
	// 상품 페이지 리스트
	listProdReviewServer(1);
	
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
	   
})


</script>
</head>
<body>

<div class="box">
</div>


</body>
</html>