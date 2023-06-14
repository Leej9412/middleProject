package kr.or.ddit.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.cart.service.CartServiceImpl;
import kr.or.ddit.cart.service.ICartService;
import kr.or.ddit.vo.CartVO;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/cartDelete.do")
public class CartDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		//세션에서 회원정보 받아오기
		MemberVO memVo =  (MemberVO) session.getAttribute("loginMember");
		if(memVo==null) {
			response.sendRedirect(request.getContextPath() + "/login.do");
		}else {
			String mem_id = memVo.getMem_id();
			int cno = Integer.parseInt(request.getParameter("cno"));
			
			CartVO vo = new CartVO();
			vo.setCart_no(cno);
			vo.setMem_id(mem_id);
			
			ICartService service = CartServiceImpl.getService();
			
			int res = service.deleteCart(vo);
			
			request.setAttribute("result", res);
			
			request.getRequestDispatcher("/result.jsp").forward(request, response);
			
		}
	}

}
