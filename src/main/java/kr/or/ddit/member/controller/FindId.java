package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;


@WebServlet("/findId.do")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		MemberVO vo = new MemberVO();
		String memName = request.getParameter("mem_name");
		String memTel = request.getParameter("mem_tel");
		
		vo.setMem_name(memName);
		vo.setMem_tel(memTel);
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		String memId = service.findId(vo);
		
        if(memId == null || memId == "") {//결과가 없으면(정보가 맞지 않으면)
 
        	 response.sendRedirect("forgotId.jsp?error");
        	 return;
         }
         else {//결과가 있으면(정보가 맞다면)
            	request.setAttribute("status", "findId");
            	request.setAttribute("member_id", memId);
            	request.getRequestDispatcher("empty.jsp").forward(request, response);
         }
		
		
		
	}

}
