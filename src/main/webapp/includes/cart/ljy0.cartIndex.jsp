<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 레이아웃 --><%@include file="/includes/1.header.jsp"%>
<title>PangPang Mall.</title>

</head>
<body>
<!-- 레이아웃 --><%@include file="/includes/2.navbar.jsp"%>
<div class="page-heading bg-light">
	<div class="container">
		<div class="row align-items-end text-center">
			<div class="col-lg-7 mx-auto">
				<h1>Cart</h1>
				<p class="mb-4">
					<a href="<%=request.getContextPath()%>/includes/0.homeIndex.jsp">Home</a> / <strong>Cart</strong>
				</p>
			</div>
		</div>
	</div>
</div>




<!-- 레이아웃 --><%@include file="/includes/4.cartContent.jsp"%>
<!-- 레이아웃 --><%@include file="/includes/5.footer.jsp"%>
<script type="text/javascript">
function onChkboxClickTotalChange(obj){
// 	totalPrice
	
	var chkProduct = $('input:checkbox[name=checkList]:checked');
	var chkProductList=0;
	for(i=0; i<chkProduct.length; i++){	// 체크된것만 돌림 
		var tg = $(chkProduct[i]).val();   // 이것은 체크된것의 값이야 (그 값은 P_id고 product_id야  )
		console.log( $(chkProduct[i]).attr('price') );	// checlbox의 price속성을 가져온거슈 
		console.log($('.qtyid_' + tg).val() )         // tg가 p_id니까 .qtyid_제품id의 값을 가져온것 (즉 수량을 가져온것 ))
		chkProductList += Number($(chkProduct[i]).attr('price')) * Number($('.qtyid_' + tg).val());
		
	}
	 $('.totalPrice').text(chkProductList.toLocaleString("ko-KR") + ' 원');
}

function orderProductSelected(){
	
	var chkProduct = $('input:checkbox[name=checkList]:checked');
	var chkProductList="";
	for(i=0; i<chkProduct.length; i++){
		
		chkProductList += chkProduct[i].value 
		if(i!=(chkProduct.length-1)){
			chkProductList += "&";
		} 
	//	console.log( chkProduct[i].value );
	//	console.log( $(chkProduct[i]).val() );
	//	console.log( $(chkProduct[i]).attr("value") );
		console.log(chkProductList)
	}
	
	$.ajax({ 
		url : '<%=request.getContextPath()%>/kakaoPay.do',
		type : 'post',
		data : {
			"mem_id" : "test3",
			"chkProductList": chkProductList
			//DB에서 계산할 것이므로 아래 생략
			//"p_name" : "",
			//"totalQty" : ,
			//"totalAmount" : ,
			//"taxFreeAmount" : 
			},
		dataType : 'json',
		success : function(res) {
// 			alert(res.flag);
// 			var tgQty = Number($(obj).parents('tr').find('.targetQty').text().trim().replaceAll(','   ,  ''));
		
// 			$(obj).parents('tr').find('.targetQty').html((price * cqty).toLocaleString('ko-KR'));
 			console.log(res);
 			
 			// 성공 시에만 res.next_redirect_pc_url가 있다.
 			if(res.next_redirect_pc_url!=null) {
 				location.href = res.next_redirect_pc_url;
 			}
 		
		
		},
		error : function(xhr) {
			alert('상태 : ' + xhr.status)
		}

	});
}

function updateCartQtyOnkeyUp(pid, obj, e, price, chk) {

// 	console.log(e);
	// keycode는 각 키 자판마다의 고유키이다.
	// 13은 enterkey의 keycode이다.
	// onkeydown은 키보드를 눌렀을 때
	// onkeyup은 키보드를 누르고 뗐을 때
	
	if(e.keyCode==13 || "onchange"==chk) {	
		var cqty = obj.value;
		$.ajax({ 
			url : '<%=request.getContextPath()%>/cartUpdate.do',
			type : 'post',
			data : {"cart_qty" : cqty,
					"p_id" : pid
				},
			dataType : 'json',
			success : function(res) {
			//	alert(res.flag);
			//	var tgQty = Number($(obj).parents('tr').find('.targetQty').text().trim().replaceAll(','   ,  ''));
			
				$(obj).parents('tr').find('.targetQty').html((price * cqty).toLocaleString('ko-KR'));
			},
			error : function(xhr) {
				alert('상태 : ' + xhr.status)
			}

		});
	}

}
function updateCartQty(pid, obj, price){
	// pid == pid
	// obj의 부모로 올라가서, 다시 하위로 내려오는데 input의 val을 가져온다.
	// 근데 obj가 plus이면 input의 값을 올림, 아니면 내린다.
	// 그리고 다시 input을 가져와서
	// var cqty = 그 input값을 넣으면 끝!
	console.log(obj.className);
	
	var qty = $(obj).parents('.cartQtyGroup').find('.cartQty');

	var qtyVal = Number($(obj).parents('.cartQtyGroup').find('.cartQty').val());
	console.log("qty\n")
	console.log($(qty))   ; 
	
	console.log("qtyVal\n")
	console.log(qtyVal);
	
	
	if($(obj).text() == "+" ) {
		$(qty).val( qtyVal+1 );
	} else {
		if( qtyVal == 1 ){
			alert('최소 수량은 1입니다.')
		} else {
			$(qty).val( qtyVal-1 );
		}
		
	}
	
	var cqty = Number($(qty).val());
	
	$.ajax({ 
		url : '<%=request.getContextPath()%>/cartUpdate.do',
		type : 'post',
		data : {"cart_qty" : cqty,
				"p_id" : pid
			},
		dataType : 'json',
		success : function(res) {
			//alert(res.flag);
			
			$(obj).parents('tr').find('.targetQty').html((price * cqty).toLocaleString('ko-KR'));
		},
		error : function(xhr) {
			alert('상태 : ' + xhr.status)
		}

	})
	
}

function deleteCart(cno) {

	$.ajax({ 
		url : '<%=request.getContextPath()%>/cartDelete.do',
		type : 'post',
		data : {"cno" : cno},
		dataType : 'json',
		success : function(res) {
			location.reload();
			
		},
		error : function(xhr) {
			alert('상태 : ' + xhr.status)
		}

	});

}
</script>
</body>
</html>