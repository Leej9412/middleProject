package kr.or.ddit.member.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		RequestDispatcher dispatcher = null;
		IMemberService service = MemberServiceImpl.getInstance();
		String memId = (String) session.getAttribute("mem_id");
		MemberVO vo = new MemberVO();
		
		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
			vo.setMem_id(memId);
			vo.setMem_pass(newPassword);
			
			int cnt = service.changePassword(vo);
			
			if (cnt > 0) {
				request.setAttribute("status", "resetSuccess");
				dispatcher = request.getRequestDispatcher("empty.jsp");
			} else {
				request.setAttribute("status", "resetFailed");
				dispatcher = request.getRequestDispatcher("empty.jsp");
			}
			dispatcher.forward(request, response);
	
		}
	}

}
