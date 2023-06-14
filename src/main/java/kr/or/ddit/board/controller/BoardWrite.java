package kr.or.ddit.board.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.vo.BoardVO;



/**
 * Servlet implementation class BoardWrite
 */
@WebServlet("/BoardWrite.do")
public class BoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public BoardWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		//0. 클라이언트 전송시 데이터 받기
		BoardVO vo = new BoardVO();
		vo.setMem_id(mem_id);
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		vo.setWip(request.getRemoteAddr());
		
		//1. service객체얻기
		IBoardService service = BoardServiceImpl.getService();
		vo.setMem_id((String) session.getAttribute("mem_id"));
		//2. service메소드 호출하기 - 결과값받기
		int res = service.insertBoard(vo);
		
		//3. 결과값을 request에 저장
		request.setAttribute("result", res);
		
		//4. view페이지로 이동
		request.getRequestDispatcher("view/result.jsp").forward(request, response);
	}

}
