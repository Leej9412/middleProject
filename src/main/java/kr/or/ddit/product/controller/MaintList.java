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

//@SuppressWarnings("serial")
@WebServlet("/mainList.do")
public class MaintList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IProductService service = ProductServiceImpl.getInstance();
		
		String searchName = request.getParameter("searchName");					//추가함
		
		int page = 1;
		
		if(request.getParameter("page")!=null){
            page = Integer.parseInt(request.getParameter("page"));
        }
		
		Map<String,Object> paramMap = new HashMap<>();
       paramMap.put("searchCol", "검색할 대상");
       paramMap.put("searchWord", searchName);								// 추가함
      
		// 전체 레코드갯수를 구해온다.
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
		
		List<ProductVO> searchNameList = (List<ProductVO>) service.searchProductName(searchName);	// 추가함
		
		// 가져온 파일 정보 목록을 View페이지로 보낸다.
		request.setAttribute("categoryName", categoryName);
		request.setAttribute("productList", productList);
		request.setAttribute("paging", paging);
		request.getRequestDispatcher("/includes/0.homeIndex.jsp").forward(request, response);
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
