package kr.or.ddit.pay.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.pay.service.IPayService;
import kr.or.ddit.pay.service.PayServiceImpl;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PayListVO;

@WebServlet("/payList.do")
public class PayList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		IPayService service = PayServiceImpl.getService();
		HttpSession session = request.getSession();
		
		//세션에서 회원정보 받아오기
		MemberVO memVo =  (MemberVO) session.getAttribute("loginMember");
		if(memVo==null) {
			response.sendRedirect(request.getContextPath() + "/login.do");
		}else {
			//로그인세션에서 회원아이디 선택해서 변수에 저장하기
//			String mem_id = "a001";
			String mem_id = memVo.getMem_id();
			List<PayListVO> payList = service.selectAllPay(mem_id);
			
			request.setAttribute("payList", payList);
			request.getRequestDispatcher("/includes/pay/ljy1.payList.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
