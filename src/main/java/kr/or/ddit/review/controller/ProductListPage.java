package kr.or.ddit.review.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewServiceImpl;
import kr.or.ddit.vo.PageVO;
import kr.or.ddit.vo.ReviewVO;



@WebServlet("/productListPage.do")
public class ProductListPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		// 0. 클라이언트 전송시 요청데이터를 받는다. - page, stype, sword
		int spage = Integer.parseInt(request.getParameter("page"));
		String stype = request.getParameter("stype");
//		String sword = request.getParameter("sword");
//		String mem_id = request.getParameter("mem_id");
//		String mem_id = "wpdls"; //  로그인 한 회원의 id가 셋팅되도록 한다.
		
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		
		int p_id= 1;
		
		// 1. sevice객체를 얻어온다.
		IReviewService service = ReviewServiceImpl.getInstance();
		
		// 2-1. service메서드를 호출 한다. -결과를 리턴 받는다.
		PageVO pvo = service.pageInfo(spage, stype, mem_id);
//		PageVO pvo = service.pageInfo(spage, stype, sword);
		
		// 2-2. list 목록 가져오기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", pvo.getStart());
		map.put("end", pvo.getEnd());
//		map.put("stype", stype); 
		
		map.put("mem_id", mem_id);   
		map.put("p_id", p_id);
		
//		map.put("sword", sword);
		
		List<ReviewVO> list = service.productReviewList(map);
		
		// 3. 결과를 request에 저장한다.
		request.setAttribute("list", list);
		request.setAttribute("pvo", pvo);
		
		// 4. view페이지로 이동(forward 방식) = html을 이용하여 출력 하거나 또는 json데이터를 생성.
		request.getRequestDispatcher("review/prodReviewList.jsp").forward(request, response);
	}

}
