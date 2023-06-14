<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.vo.CartListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="search-form" id="search-form">
	<form action="">
		<input type="search" class="form-control"
			placeholder="Enter keyword to search...">
		<button class="button">
			<svg width="1em" height="1em" viewBox="0 0 16 16"
				class="bi bi-search" fill="currentColor"
				xmlns="http://www.w3.org/2000/svg">
          <path fill-rule="evenodd"
					d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z" />
          <path fill-rule="evenodd"
					d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
        </svg>
		</button>
		<button class="button">
			<div class="close-search">
				<span class="icofont-close js-close-search"></span>
			</div>
		</button>

	</form>
</div>

<div class="site-mobile-menu">
	<div class="site-mobile-menu-header">
		<div class="site-mobile-menu-close">
			<span class="icofont-close js-menu-toggle"></span>
		</div>
	</div>
	<div class="site-mobile-menu-body"></div>
</div>



<nav class="site-nav mb-5">
	<div class="sticky-nav js-sticky-header">

		<div class="container position-relative">
			<div class="site-navigation text-center dark">
				<a href="<%=request.getContextPath()%>/mainList.do"
					class="logo menu-absolute m-0">PangPang Mall.<span
					class="text-primary">
					
</span></a>

				<ul class="js-clone-nav pl-0 d-none d-lg-inline-block site-menu">
<%
	MemberVO memVo1 = (MemberVO) session.getAttribute("loginMember");
	if(session.getAttribute("mem_id")==null){
		
	}else{
		%>
		
		<li><a><%=memVo1.getMem_name()%>님 반갑습니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		
<%
	}
%>				
				
				
				
				
					<li><a href="<%=request.getContextPath()%>/mainList.do">Home</a></li>
					<li class="has-children"><a
						href="<%=request.getContextPath()%>/productList.do">Shop</a>
						<ul class="dropdown">
							<li><a
								href="<%=request.getContextPath()%>/productList.do?category=1">Clothes</a></li>
							<li><a
								href="<%=request.getContextPath()%>/productList.do?category=2">Cosmetics</a></li>
							<li><a
								href="<%=request.getContextPath()%>/productList.do?category=3">Appliances</a></li>
							<li><a
								href="<%=request.getContextPath()%>/productList.do?category=4">Foods</a></li>
							<li><a
								href="<%=request.getContextPath()%>/productList.do?category=5">Medicine</a></li>
						</ul></li>
					<li><a
						href="<%=request.getContextPath()%>/includes/0.boardIndex.jsp">Board</a></li>
					<li><a href="#">Review</a></li>

					<li class="has-children"><a
						href="<%=request.getContextPath()%>/payList.do">Pay</a>
						<ul class="dropdown">
							<li class="active"><a
								href="<%=request.getContextPath()%>/cartList.do">Cart</a></li>
							<li class="active"><a
								href="<%=request.getContextPath()%>/payList.do">Payments
									List</a></li>
							<li class="has-children"><a href="#">Menu Two</a>
								<ul class="dropdown">
									<li><a href="#">T-Shirt</a></li>
									<li><a href="#">Underware</a></li>
									<li><a href="#">Clothing</a></li>
									<li><a href="#">Watches</a></li>
									<li><a href="#">Shoes</a></li>
								</ul></li>
							<li class="has-children"><a href="#">Menu Three</a>
								<ul class="dropdown">
									<li><a href="#">T-Shirt</a></li>
									<li><a href="#">Underware</a></li>
									<li><a href="#">Clothing</a></li>
									<li><a href="#">Watches</a></li>
									<li><a href="#">Shoes</a></li>
								</ul></li>
						</ul></li>
				</ul>





				<div class="menu-icons">

				<a href="#"
						class="btn-custom-search" id="btn-search"> <svg width="1em"
							height="1em" viewBox="0 0 16 16" class="bi bi-search"
							fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
								d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z" />
                <path fill-rule="evenodd"
								d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
              </svg>
					</a> <a
						href="<%=request.getContextPath()%>/includes/member/key0.mypageIndex.jsp"
						class="user-profile"> <svg width="1em" height="1em"
							viewBox="0 0 16 16" class="bi bi-person" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
								d="M13 14s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002.002zM3.022 13h9.956a.274.274 0 0 0 .014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 0 0 .022.004zm9.974.056v-.002.002zM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
              </svg>
					</a>
					<!-- 로그아웃 -->
					<a href="<%=request.getContextPath()%>/logout.do"
						class="user-profile"> <svg xmlns="http://www.w3.org/2000/svg"
							width="1em" height="1em" fill="currentColor" class="bi bi-power"
							viewBox="0 0 16 16">
					  <path d="M7.5 1v7h1V1h-1z" />
					  <path
								d="M3 8.812a4.999 4.999 0 0 1 2.578-4.375l-.485-.874A6 6 0 1 0 11 3.616l-.501.865A5 5 0 1 1 3 8.812z" />
<!-- </svg> -->
<!-- 					<svg width="1em" -->
<!-- 							height="1em" viewBox="0 0 16 16" class="bi bi-power" -->
<!-- 							fill="currentColor" xmlns="http://www.w3.org/2000/svg"> -->
<!--                 <path fill-rule="evenodd" -->
<!-- 								d="M13 14s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002.002zM3.022 13h9.956a.274.274 0 0 0 .014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 0 0 .022.004zm9.974.056v-.002.002zM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" /> -->
              </svg>
					</a> <a href="<%=request.getContextPath()%>/cartList.do" class="cart">
						<!-- span class="item-in-cart">2</span--> <svg width="1em"
							height="1em" viewBox="0 0 16 16" class="bi bi-cart"
							fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
								d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
              </svg>
					</a>

				</div>

				<a href="#"
					class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none"
					data-toggle="collapse" data-target="#main-navbar"> <span></span>
				</a>

			</div>
		</div>
	</div>
</nav>
