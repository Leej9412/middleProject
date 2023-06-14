<%@page import="kr.or.ddit.vo.PayListVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<PayListVO> payList = (List<PayListVO>) request.getAttribute("payList");
DecimalFormat decFormat = new DecimalFormat("###,###");
%>
<div class="untree_co-section">
	<div class="container">
		<div class="row mb-5">
			<form class="col-md-12" method="post">
				<div class="site-blocks-table">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th class="product-select">NO</th>
								<th class="product-thumbnail">Images</th>
								<th class="product-name">Product Name</th>
								<th class="product-price">Price</th>
								<th class="product-quantity">Quantity</th>
								<th class="product-total">Total</th>
								<th class="product-status">Status</th>
								<th class="product-remove">Cancel</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<%
								if (payList == null || payList.size() == 0) {
								%>
								<td colspan="5">장바구니에 상품이 없습니다.<td>
								<%
								} else {
									for (PayListVO payListVO : payList) {
								%>
								<td class="product-select payListRowSpanTd">
									<%=payListVO.getPay_no()%>
								</td>
								<td class="product-thumbnail"><img
									src="<%=request.getContextPath()%>/productView.do?productNo=<%=payListVO.getP_id()%>" alt="Image"
									class="img-fluid"></td>
								<td class="product-name">
									<h2 class="h5 text-black"><%=payListVO.getP_name()%></h2>
								</td>
								<td><%=decFormat.format(payListVO.getP_price())%></td>
								<td>
									<%=decFormat.format(payListVO.getPs_qty()) %>
								</td>
								<td><%=(decFormat.format(payListVO.getP_price() * payListVO.getPs_qty()))%></td>
								<td class="payListRowSpanTd">
								<%
								if(payListVO.getPay_status()==1){
								%>
								결제완료
								<%
								}else if(payListVO.getPay_status()==2){
								%>
								결제실패
								<%	
								}else if(payListVO.getPay_status()==4){
								%>
								취소완료
								<%	
								}
								%>
								<span style="display:none"><%=payListVO.getPay_no() %></span>
								</td>
								<td class="payListRowSpanTd">
								<% if(payListVO.getPay_status()==1){  %>
									<a href="#" class="btn btn-black btn-sm" onclick="cancelPay(<%=payListVO.getPay_no()%>)">주문취소</a>
								<%	}else { %>
								<span style="display:none"><%=payListVO.getPay_no() %></span>
									-
								<% }  %>	
								</td>
							</tr>
							<%
									}
								}
							%>

						</tbody>
					</table>
				</div>
			</form>
		</div>

<!-- 		<div class="row"> -->
<!-- 			<div class="col-md-6"> -->
<!-- 				<div class="row mb-5"> -->
<!-- 					<div class="col-md-6 mb-3 mb-md-0"> -->
<!-- 						<button class="btn btn-black btn-sm btn-block">Update -->
<!-- 							Cart</button> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-6"> -->
<!-- 						<button class="btn btn-outline-black btn-sm btn-block">Continue -->
<!-- 							Shopping</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-12"> -->
<!-- 						<label class="text-black h4" for="coupon">Coupon</label> -->
<!-- 						<p>Enter your coupon code if you have one.</p> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-8 mb-3 mb-md-0"> -->
<!-- 						<input type="text" class="form-control py-3" id="coupon" -->
<!-- 							placeholder="Coupon Code"> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-4"> -->
<!-- 						<button class="btn btn-black">Apply Coupon</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-md-6 pl-5"> -->
<!-- 				<div class="row justify-content-end"> -->
<!-- 					<div class="col-md-7"> -->
<!-- 						<div class="row"> -->
<!-- 							<div class="col-md-12 text-right border-bottom mb-5"> -->
<!-- 								<h3 class="text-black h4 text-uppercase">Cart Totals</h3> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="row mb-3"> -->
<!-- 							<div class="col-md-6"> -->
<!-- 								<span class="text-black">Subtotal</span> -->
<!-- 							</div> -->
<!-- 							<div class="col-md-6 text-right"> -->
<!-- 								<strong class="text-black">$230.00</strong> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="row mb-5"> -->
<!-- 							<div class="col-md-6"> -->
<!-- 								<span class="text-black">Total</span> -->
<!-- 							</div> -->
<!-- 							<div class="col-md-6 text-right"> -->
<!-- 								<strong class="text-black">$230.00</strong> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="row"> -->
<!-- 							<div class="col-md-12"> -->
<!-- 								<button class="btn btn-black btn-lg py-3 btn-block" -->
<!-- 									onclick="orderProductSelected()">Proceed To -->
<!-- 									Checkout</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>
</div>
