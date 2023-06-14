package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;


@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=utf-8");
		//세션위치
		
		RequestDispatcher dispatcher = null;
		
		String mem_id = request.getParameter("mem_id");
		String mem_pass = request.getParameter("mem_pass");
		
		String checkId = request.getParameter("remember-me");	//checkID값
		
		// 입력받은 userid값을 갖는 쿠키 객체 생성
		Cookie cookie = new Cookie("USERID", mem_id);

		// 체크박스가 체크되지 않았으면 쿠키를 삭제한다.
		if(checkId==null) { //체크박스 체크를 하지 않았을 경우
			cookie.setMaxAge(0);	//유지시간을 0으로 설정
		}
		cookie.setPath("/");
		response.addCookie(cookie);

				
		MemberVO vo = new MemberVO();
		vo.setMem_id(mem_id);
		vo.setMem_pass(mem_pass);
		
		IMemberService service = MemberServiceImpl.getInstance();
		MemberVO check = service.loginCheck(vo);

		String status = "";
		if(check != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", check);
			session.setAttribute("mem_id", check.getMem_id());
			
			if(check.getMem_admin() == 1) {
				response.sendRedirect(request.getContextPath() + "/includes/admin/key0.adminhomeIndex.jsp");
			}else {
//			dispatcher = request.getRequestDispatcher("/index.jsp").forward(request, response);
			response.sendRedirect(request.getContextPath() + "/includes/0.homeIndex.jsp");
			}
		}else {
			
			if(mem_id == null || mem_id.equals("")) {
				status = "invalidId";
//				request.setAttribute("status", "invalidId");
//				dispatcher = request.getRequestDispatcher("/login.jsp");
			}
			else if(mem_pass == null || mem_pass.equals("")) {
				status = "invalidPass";
//				request.setAttribute("status", "invalidPass");
//				dispatcher = request.getRequestDispatcher("/login.jsp");
			}else {
				status = "failed";
//				request.setAttribute("status", "failed");
//				dispatcher = request.getRequestDispatcher("/login.jsp");
			}
			Cookie statusCookie = new Cookie("status", status);
			response.addCookie(statusCookie);
//		dispatcher.forward(request, response);
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
		
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
