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
import javax.servlet.http.HttpSession;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PageVO;

/**
 * Servlet implementation class myPageBoardList
 */
@WebServlet("/myPageBoardList.do")
public class myPageBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//0.
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		//0. 클라이언트 전송시 전달 데이터 받기 - page, stype, sword
		int spage = 1;
		if(request.getParameter("page")!=null) {
			spage = Integer.parseInt(request.getParameter("page"));
		}
		String stype =request.getParameter("stype");
		String sword =request.getParameter("sword");
		int catval =Integer.parseInt(request.getParameter("catval"));
		
		System.out.println("stype=" + stype) ;
		System.out.println("sword=" + sword) ;
		System.out.println("catval=" + catval) ;
		//1. service객체 얻기
		
		IBoardService service = BoardServiceImpl.getService();
		
		//2-1. service메소드 호출 - 결과값받기
		PageVO vo = service.pageInfo(spage, stype, sword, catval);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		map.put("stype", "mem_id");
		map.put("sword", mem_id);
		map.put("catval", catval);
		List<BoardVO> list = service.selectByPage(map);
		
		//3. 결과값을 request에 저장
		request.setAttribute("list", list);
		request.setAttribute("vo", vo);
		//4. view페이지로 이동 - 출력
		request.getRequestDispatcher("view/list.jsp").forward(request, response);
	}

}
