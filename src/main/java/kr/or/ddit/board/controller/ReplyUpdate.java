package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.vo.ReplyVO;




@WebServlet("/ReplyUpdate.do")
public class ReplyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//0. 클라이언트 전송 데이터 받기
		String mcont = request.getParameter("cont");
		int renum = Integer.parseInt(request.getParameter("num"));
		
		ReplyVO vo = new ReplyVO();
		vo.setBoard_reply_contents(mcont);
		vo.setBoard_reply_no(renum);
		
		//1.
		IBoardService service = BoardServiceImpl.getService();
		
		//2.
		int res = service.modifyReply(vo);
		
		//3.
		request.setAttribute("result", res);
		
		//4.
		request.getRequestDispatcher("view/result.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
