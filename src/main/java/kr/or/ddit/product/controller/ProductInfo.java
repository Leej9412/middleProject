package kr.or.ddit.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.product.service.IProductService;
import kr.or.ddit.product.service.ProductServiceImpl;
import kr.or.ddit.vo.ProductVO;

@WebServlet("/productInfo.do")
public class ProductInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ProductVO pvo = new ProductVO();
		
		// 파일이 아닌 일반 데이터는 getParameter()메서드나 getParameterValues()메서드를 이용해서 구하면 된다.
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		
		IProductService service = ProductServiceImpl.getInstance();
		
		pvo = service.showProduct(productNo);
		request.setAttribute("viewPage", pvo);
		request.getRequestDispatcher("/includes/shop/1-1.detailIndex.jsp").forward(request, response);	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
