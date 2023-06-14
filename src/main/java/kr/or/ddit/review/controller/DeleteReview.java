package kr.or.ddit.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewServiceImpl;


@WebServlet("/deleteReview.do")
public class DeleteReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int re_no = Integer.parseInt(request.getParameter("re_no"));
		
		IReviewService service = ReviewServiceImpl.getInstance();
		
		int res = service.deleteMyReview(re_no);
		
		request.setAttribute("result", res);
		
		request.getRequestDispatcher("review/result.jsp").forward(request, response);
		
		
	}


}
