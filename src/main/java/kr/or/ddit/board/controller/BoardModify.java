package kr.or.ddit.board.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.vo.BoardVO;




@WebServlet("/BoardModify.do")
public class BoardModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public BoardModify() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//0. 전송데이타 받기 - writer, subject, mail, password, content, num
		BoardVO vo = new BoardVO();
		
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
		
		//service객체 얻기
		IBoardService service = BoardServiceImpl.getService();
		
		// 메소드 호출 - 결과값 받기
		int res =service.modifyBoard(vo);
		
		//결과값을 request에 저장
		request.setAttribute("result", res);
		
		//view페이지로
		request.getRequestDispatcher("view/result.jsp").forward(request, response);
		
		
	}

}
