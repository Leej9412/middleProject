package kr.or.ddit.product.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.product.service.IProductService;
import kr.or.ddit.product.service.ProductServiceImpl;
import kr.or.ddit.vo.Paging;
import kr.or.ddit.vo.ProductVO;

@WebServlet("/productList.do")
public class ProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// service 객체 생성
		IProductService service = ProductServiceImpl.getInstance();
		String cateNo = request.getParameter("category");
		String searchName = request.getParameter("searchName");					//추가함

		int page = 1;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("searchCol", "검색할 대상");
		paramMap.put("searchWord", searchName);								// 추가함
		
		paramMap.put("category", cateNo);
		
		int productConunt = service.getProductCount(paramMap);

		Paging paging = new Paging();
		paging.setPage(page);

		paging.setTotalCount(productConunt);
		paramMap.put("paging", paging);
	

		// DB에서 전체 파일 정보 목록을 가져와 List에 저장한다.
		List<ProductVO> productList = service.getAllProduct(paramMap);

		ProductVO pro = new ProductVO();
		int proNo = pro.getP_cat_no();
		// 카테고리 이름 불러오기
		List<ProductVO> categoryName = service.getCategoryName();
		
		List<ProductVO> searchNameList =  service.searchProductName(searchName);	// 추가함
		
		System.out.println("받아온 검색한 내용 출력 : "+searchName);

		// 가져온 파일 정보 목록을 View페이지로 보낸다.
		request.setAttribute("searchName", searchName);			// 추가함
		request.setAttribute("categoryName", categoryName);
		request.setAttribute("productList", productList);
		request.setAttribute("paging", paging);
		request.setAttribute("viewPage", "/includes/shop/4-2.shopProductItems.jsp");
		
		request.getRequestDispatcher("/includes/shop/0.shopIndex.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
