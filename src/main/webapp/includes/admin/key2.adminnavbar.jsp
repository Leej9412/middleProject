


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
				<a
					href="<%=request.getContextPath()%>/includes/admin/key0.adminhomeIndex.jsp"
					class="logo menu-absolute m-0">PangPang Mall<span
					class="text-primary">.</span></a>
				<ul class="js-clone-nav pl-0 d-none d-lg-inline-block site-menu">
					<li><a
						href="<%=request.getContextPath()%>/includes/admin/key0.adminhomeIndex.jsp">Home</a></li>
					<!-- 상품관리, 카테고리 링크 -->
					<li><a href="#">Product</a></li>
					<li><a href="<%=request.getContextPath()%>/includes/admin/board/key0.adminboardIndex.jsp">Board</a></li>
					<li><a
						href="<%=request.getContextPath()%>/includes/admin/key0.adminhomeIndex.jsp">Member</a></li>
					<li><a href="#">Review</a></li>
					<li><a href="#">Sales</a></li>
				</ul>





				<div class="menu-icons">

					<a><%=session.getAttribute("mem_id")%>님&nbsp;&nbsp;</a>


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
