package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.PortableInterceptor.DISCARDING;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;


@WebServlet("/modifyInformation.do")
public class ModifyInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String memId =  (String) session.getAttribute("mem_id");
		String memName = request.getParameter("mem_name");
		String memNick = request.getParameter("mem_nick");
		String memPass = request.getParameter("mem_pass");
		String memTel = request.getParameter("mem_tel");
		String memAddr1 = request.getParameter("mem_addr1");
		String memAddr2 = request.getParameter("mem_addr2");
		String memMail = request.getParameter("mem_mail");
		String memBirth = request.getParameter("mem_birth");

		MemberVO memVo = new MemberVO();
		
		memVo.setMem_id(memId);
		memVo.setMem_name(memName);
		memVo.setMem_nick(memNick);
		memVo.setMem_pass(memPass);
		memVo.setMem_tel(memTel);
		memVo.setMem_addr1(memAddr1);
		memVo.setMem_addr2(memAddr2);
		memVo.setMem_mail(memMail);
		memVo.setMem_birth(memBirth);
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		int cnt = service.modifyInformation(memVo);
		
		request.setAttribute("res", cnt);
		
		request.getRequestDispatcher("includes/member/key9.status.jsp").forward(request, response);

		
	}

}
