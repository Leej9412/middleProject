package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;


@WebServlet("/deleteAccount.do")
public class DeleteAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String memId =  (String) session.getAttribute("mem_id");
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		int res = service.deleteAccount(memId);
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("includes/member/key9.status.jsp").forward(request, response);
	}

}
