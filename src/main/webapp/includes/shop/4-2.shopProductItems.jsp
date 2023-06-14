<!-- 상품들만 출력하는 페이지(상품본문) -->
<%@page import="kr.or.ddit.vo.Paging"%>
<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.paging{
	text-align: center;
}
</style>
<%
// 컨트롤러가 보낸 데이터 받기
List<ProductVO> productList = (List<ProductVO>) request.getAttribute("productList");
%>

<div class="row">
	<!-- 위에 건들지 않고 밑에서부터 작성하기 -->

	<%
                if (productList == null || productList.size() == 0) {
                %>
	저장된 파일 목록이 없습니다.
	<%
                } else {
                for (ProductVO productVo : productList) {
                %>
	<div class="col-6 col-sm-6 col-md-6 mb-4 col-lg-4">
		<div class="product-item">
			<a
				href="<%=request.getContextPath()%>/productInfo.do?productNo=<%=productVo.getP_id()%>"
				class="product-img">

				<div class="label new top-right">
					<div class='content'>New</div>
				</div> <img
				src="<%=request.getContextPath()%>/productView.do?productNo=<%=productVo.getP_id()%>"
				alt="Image" class="img-fluid">

			</a>
			<h3 class="title">
				<a
					href="<%=request.getContextPath()%>/productInfo.do?productNo=<%=productVo.getP_id()%>"><%=productVo.getP_name()%></a>
			</h3>
			<div class="price">
				<span><%=productVo.getP_price()%></span>
			</div>
			<form action="">
				<input type="button" class="btn btn-black" onclick="addCart(1, <%=productVo.getP_id()%>)" style="width:100%" value="장바구니 담기">
				<!--수정		상품 주문하기버튼 action에 경로 넣어주기 -->
			</form>
		</div>
	</div>
	<%
                }
                
                }
                %>
	<!-- -------------------------------------------------------밑부분은 페이징----------------------------------------------------------------- -->

