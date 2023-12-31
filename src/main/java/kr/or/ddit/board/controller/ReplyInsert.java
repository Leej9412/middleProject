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
import kr.or.ddit.vo.ReplyVO;




@WebServlet("/ReplyInsert.do")
public class ReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ReplyInsert() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		//0. - name, bonum, cont
		ReplyVO vo = new ReplyVO();
		vo.setReply_name(mem_id);
		
		//String name = request.getParameter("name");
		//vo.setName(name)
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//1.
		IBoardService service = BoardServiceImpl.getService();
		
		//2.
		int res = service.insertReply(vo);
		
		//3.
		request.setAttribute("result", res);
		
		//4.
		request.getRequestDispatcher("view/result.jsp").forward(request, response);
		
		
	}

}
