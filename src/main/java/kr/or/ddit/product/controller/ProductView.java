package kr.or.ddit.product.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.product.service.IProductService;
import kr.or.ddit.product.service.ProductServiceImpl;
import kr.or.ddit.vo.ProductVO;

@WebServlet("/productView.do")
public class ProductView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		
		IProductService service = ProductServiceImpl.getInstance();
		ProductVO pvo = service.showProduct(productNo);
		
		// 파일 업로드하면 저장이 될 폴더
//		String filePath = "C:\\Users\\PC-13\\Desktop\\중프\\productfiles";
		String filePath = "C:\\Users\\yeeji\\OneDrive\\바탕 화면\\PANGPANG PRO\\images";
		
		File file = new File(filePath + File.separator + pvo.getSave_file_name());
		
		BufferedInputStream bin = null;
		BufferedOutputStream bout = null;
		
		if(file.exists()) {		// 해당 이미지 파일이 있을 경우
			try {
				bin = new BufferedInputStream(new FileInputStream(file));
				bout = new BufferedOutputStream(response.getOutputStream());
				
				byte[] temp = new byte[1024];
				int len = 0;
				while ((len = bin.read(temp)) > 0) {
					bout.write(temp, 0, len);
				}
				bout.flush();
			} catch (IOException e) {
				System.out.println("입출력 오류 : " + e.getMessage());
			} finally {
				if(bout!=null) try {bout.close(); } catch(IOException e) {}
				if(bin!=null) try {bin.close(); } catch(IOException e) {}
			}
		} // if문 끝
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
