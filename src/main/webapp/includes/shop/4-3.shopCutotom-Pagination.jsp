<%@page import="kr.or.ddit.vo.Paging"%>
<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	.row{
		text-align: center;
	}
</style>
<%
// 컨트롤러가 보낸 데이터 받기
Paging paging = (Paging) request.getAttribute("paging");
%>
	<div class="paging">

	</div>
<!-- /.untree_co-section -->
<div class="row mt-5 pb-5">
	<div class="col-lg-12">
		<div class="custom-pagination">
	<%
		if (paging.isPrev()) {
		%>
	<a
		href="<%=request.getContextPath()%>/productList.do?page=<%=paging.getBeginPage() - 1%>">Pre
		</a>
	<%
		}
			for (int i = paging.getBeginPage(); i <= paging.getEndPage(); i++) {
				if (i == paging.getPage()) {
		%>
	<%=i%>
	<%
					} else {
					%>
	<a href="<%=request.getContextPath()%>/productList.do?page=<%=i%>"><%=i%></a>
	<%
					}

			}
			
		if (paging.isNext()) {
		%>
	<a
		href="<%=request.getContextPath()%>/productList.do?page=<%=paging.getEndPage() + 1%>">Next</a>
	<%
		}
		%>
		</div>
	</div>
</div>

</div>
</div>
</div>