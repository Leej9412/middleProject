<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

</script>

<style>
.search {
	height: 40px;
	width: 400px;
	border: 1px solid #000000;
	border-radius: 5px;
	background: #fffff;
}

input {
	font-size: 16px;
	width: 325px;
	padding: 5px;
	border: 0px;
	border-radius: 5px;
	outline: none;
	float: left;
}

button {
	width: 50px;
	height: 100%;
	border: 0px;
	border-radius: 5px;
	background: #000000;
	outline: none;
	float: right;
	color: #ffffff;
}
</style>
<%
// 컨트롤러가 보낸 데이터 받기
List<ProductVO> categoryName = (List<ProductVO>) request.getAttribute("categoryName");
%>

<div class="untree_co-section pt-3">
	<div class="container">

		<div class="row align-items-center mb-5">
			<div class="col-lg-8">
<!-- 				<h2 class="mb-3 mb-lg-0">Products</h2> -->
			</div>
			<div class="col-lg-4">
			
				<form action="<%=request.getContextPath()%>/productList.do" method="post">
					<div class="search">
						<input type="text" name="searchName" placeholder="검색할 내용 입력">
						<button>검색</button>
					</div>
				</form>
			</div>
		</div>

		<div class="row">

			<div class="col-md-3">
				<ul class="list-unstyled categories">
					<li><a href="<%=request.getContextPath()%>/productList.do">상품 전체보기</a></li>
					<li><a href="<%=request.getContextPath()%>/productUpload.do">상품등록</a></li>
					<!--             <li><a href="#">New <span>2,919</span></a></li> -->

					<!-- ------------------------------------------------------------------------------------------------ -->

					<%
					if (categoryName == null || categoryName.size() == 0) {
					%>
					저장된 카테고리 목록이 없습니다.
					<%
					} else {
					for (ProductVO productVo : categoryName) {
					%>
					<li><a
						href="<%=request.getContextPath()%>/productList.do?category=<%=productVo.getP_cat_no()%>"><%=productVo.getP_cat_name()%>
							<span>2,919</span></a></li>
					<%
					}
					}
					%>
				</ul>
			</div>