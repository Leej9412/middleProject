<!-- 상품 클릭시 출력하는 페이지(상품 디테일) -->
<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<style>
      .tablecenter {
        margin-left: auto;
        margin-right: auto;
      }
      span {
        font-size: 20px;
      }
.paging {
	text-align: center;
}
</style>
<%
// 컨트롤러가 보낸 데이터 받기
ProductVO pvo = (ProductVO) request.getAttribute("viewPage");
%>

	<!-- 위에 건들지 않고 밑에서부터 작성하기 -->
<div class="col-6 col-sm-6 col-md-6 mb-4 col-lg-4">	
	<table class="tablecenter">
		<tbody>
			<tr>
				<td>
					<%
					if (pvo == null) {
					%> 저장된 파일 목록이 없습니다. <%} else {%> <img
					src="<%=request.getContextPath()%>/productView.do?productNo=<%=pvo.getP_id()%>"
					width="500px" height="300px" />
				</td>
				<td><pre>
			<span><%=pvo.getP_name()%></span>
			<%
			if (pvo.getP_size() == null) {
			} else {
			%>
			상품 사이즈 : <%=pvo.getP_size()%><%}%>
			<%if (pvo.getP_qty() < 1) {} else {%>
			상품 재고 수량<%=pvo.getP_qty()%>
			<%
			}
			%>
            </pre></td>
			</tr>
		</tbody>
		<%}%>
	</table>
		<table class="tablecenter">
		<tbody>
			<tr>
				<td>
					<%
					if (pvo == null) {
					%> 저장된 파일 목록이 없습니다. <%} else {%> 
				</td>
				<td>
		<pre>
		<%
		if (pvo.getP_detail() == null) {
		} else {
		%>
		<%=pvo.getP_detail()%>
		<%
		}
		%>
            </pre></td>
			</tr>
		</tbody>
		<%}%>
	</table>
</div>

