package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PageVO;

/**
 * Servlet implementation class BoardReportList
 */
@WebServlet("/BoardReportList.do")
public class BoardReportList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//0. 클라이언트 전송시 전달 데이터 받기 - page, stype, sword
		int spage = 1;
		if(request.getParameter("page")!=null) {
			spage = Integer.parseInt(request.getParameter("page"));
		}
		String stype =request.getParameter("stype");
		String sword =request.getParameter("sword");

		
		System.out.println("stype=" + stype) ;
		System.out.println("sword=" + sword) ;

		//1. service객체 얻기
		
		IBoardService service = BoardServiceImpl.getService();
		
		//2-1. service메소드 호출 - 결과값받기
		PageVO vo = service.pageInfo2(spage, stype, sword);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		map.put("stype", stype);
		map.put("sword", sword);
		map.put("board_report", 0);

		List<BoardVO> list = service.BoardReportList(map);
		
		//3. 결과값을 request에 저장
		request.setAttribute("list", list);
		request.setAttribute("vo", vo);
		
		//4. view페이지로 이동 - 출력
		request.getRequestDispatcher("view/list.jsp").forward(request, response);
	}

}
