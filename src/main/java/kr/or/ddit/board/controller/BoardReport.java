package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;



/**
 * Servlet implementation class BoardReport
 */
@WebServlet("/BoardReport.do")
public class BoardReport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
				//0.
				int num = Integer.parseInt(request.getParameter("num"));
				//String memId = request.getParameter("memId");
				
				//1.
				IBoardService service = BoardServiceImpl.getService();
				
				//2.
				int res = service.boardreport(num);
				
				//3.
				request.setAttribute("result", res);
				//request.setAttribute("memId", memId);
				//
				request.getRequestDispatcher("view/result.jsp").forward(request, response);
				
	}

}
