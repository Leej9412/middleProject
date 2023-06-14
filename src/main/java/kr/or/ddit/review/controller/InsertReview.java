package kr.or.ddit.review.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewServiceImpl;
import kr.or.ddit.vo.ReviewVO;

@WebServlet("/insertReview.do")
public class InsertReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/review/mainReview.jsp").forward(request, response);
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
//		String mem_id = "wpdls";
		
		ReviewVO vo = new ReviewVO();
		vo.setMem_id(mem_id);
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		System.out.println(vo.getRe_rate());
		System.out.println(vo.getRe_content());
		System.out.println(vo.getMem_id());
		
//		String content = request.getParameter("content");
//		int rate = Integer.parseInt(request.getParameter("rating"));
//		
//		System.out.println(rate);
//		System.out.println(content);
//		vo.setRe_rate(rate);
//		vo.setRe_content(content);
		
		IReviewService service = ReviewServiceImpl.getInstance();
		
		int res = service.insertReview(vo);
		
		request.setAttribute("result", res);
		request.getRequestDispatcher("review/result.jsp").forward(request, response);
		
		
	}

}
