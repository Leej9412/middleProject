package kr.or.ddit.pay.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/kakaoPayCancel.do")
public class KakaoPayCancel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//결제 중 사용자 취소 시 ==> pay_status=3 으로 업데이트
		
		
//		pay_status
//		0: 결제대기
//		1: 결제성공
//		2: 결제실패
//		3: 결제취소
//		4: 교환/환불
		
		
		request.setAttribute("PayStatus", "cancel");
		request.getRequestDispatcher("/includes/pay/ljy0.pay.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
