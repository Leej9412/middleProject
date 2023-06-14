package kr.or.ddit.cart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.cart.service.CartServiceImpl;
import kr.or.ddit.cart.service.ICartService;
import kr.or.ddit.vo.CartListVO;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/cartList.do")
public class CartList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		ICartService service = CartServiceImpl.getService();
		HttpSession session = request.getSession();
		
		//세션에서 회원정보 받아오기
		MemberVO memVo =  (MemberVO) session.getAttribute("loginMember");
		if(memVo==null) {
			response.sendRedirect(request.getContextPath() + "/login.do");
		}else {
			//로그인세션에서 회원아이디 선택해서 변수에 저장하기
//			String mem_id = "a001";
			String mem_id = memVo.getMem_id();
			List<CartListVO> cartList = service.selectAllCart(mem_id);
			
			request.setAttribute("cartList", cartList);
			request.getRequestDispatcher("/includes/cart/ljy0.cartIndex.jsp").forward(request, response);
		
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
