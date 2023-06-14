package kr.or.ddit.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import kr.or.ddit.product.service.IProductService;
import kr.or.ddit.product.service.ProductServiceImpl;
import kr.or.ddit.vo.ProductVO;

@WebServlet("/productUpload.do")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30, maxRequestSize = 1024 * 1024 * 100 // ==> Megabyte
		)
public class ProductUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET방식으로 요청하면 productUpload폼이 있는 jsp문서로 보내준다.
		request.getRequestDispatcher("/includes/shop/4-4.shopUpload.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 파일을 추가했을 때 저장이 될 폴더 설정
//		String uploadPath = "C:\\Users\\PC-13\\Desktop\\중프\\productfiles";
		String uploadPath = "C:\\Users\\yeeji\\OneDrive\\바탕 화면\\PANGPANG PRO\\images";
		
		// 저장될 폴더가 존재하지 않으면 새로 생성한다.
		File f = new File(uploadPath);
		if(!f.exists()) {
			f.mkdir();
		}
		
		
		// 파일이 아닌 일반 데이터는 getParameter()메서드나 getParameterValues()메서드를 이용해서 구하면 된다.
		String productName = request.getParameter("productName");
		System.out.println("일반 파라미터 데이터 userName => " + productName);
		int productPrice = Integer.parseInt(request.getParameter("prodcutPrice"));
		System.out.println("상품가격 : "+productPrice);
		String productInfo = request.getParameter("productInfo");
		System.out.println("상품상세정보 : "+productInfo);
		int productQty = Integer.parseInt(request.getParameter("productQty"));
		System.out.println("상품수량 : "+productQty);
		String productSize = request.getParameter("productSize");
		System.out.println("상품사이즈"+productSize);
		int productMileage = Integer.parseInt(request.getParameter("productMileage"));
		System.out.println("상품마일리지"+productMileage);
		int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
		System.out.println("카테고리번호"+categoryNo);
		
		// 수신 받은 파일 데이터 처리하기
		String fileName = "";	// 수신된 파일의 파일명이 저장될 변수
		ProductVO pvo = new ProductVO();
		pvo.setP_name(productName);
		pvo.setP_price(productPrice);
		pvo.setP_detail(productInfo);
		pvo.setP_qty(productQty);
		pvo.setP_size(productSize);
		pvo.setP_mileage(productMileage);
		pvo.setP_cat_no(categoryNo);
		// 전체 Part객체 개수만큼 반복 처리
		for(Part part : request.getParts()) {
			fileName = extractFileName(part);
			System.out.println("fileName : "+fileName);
			// 찾은 파일명이 공백("")이면 이것은 파일이 아닌 일반 데이터라는 의미이다.
			if(!"".equals(fileName)) {
				// 1개의 Upload파일에 대한 정보를 저장할 VO객체 생성
//				ProductVO pvo = new ProductVO();
				pvo.setP_name(productName);
				pvo.setP_price(productPrice);
				pvo.setP_detail(productInfo);
				pvo.setP_qty(productQty);
				pvo.setP_size(productSize);
				pvo.setP_mileage(productMileage);
				pvo.setP_cat_no(categoryNo);
				
				// 실제 저장되는 파일 이름이 중복되는 것을 방지하기 위해서 UUID 객체를 이용하여
				// 저장할 파일명을 만든다.
				String saveFileName = UUID.randomUUID().toString();
				pvo.setSave_file_name(saveFileName); // 만들어진 저장 파일명을 VO에 셋팅
				
				// 전송된 파일의 크기는 Part객체의 getSize()메서드를 이용해서 구한다. (단위:byte)
				// byte단위의 파일 크기를 KB단위로 변환해서 VO에 셋팅
				pvo.setFile_size((long)Math.ceil(part.getSize()/1024.0));
				//형변환을 원치 않으면 par.getSize()만 사용해도 괜찮다.
				
				try {
					// Upload된 파일 저장하기
					// 형식) Part객체변수.write("경로명/저장할파일명");
					part.write(uploadPath + File.separator + saveFileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}//if문 끝
		}//for문 끝
		
		IProductService service = ProductServiceImpl.getInstance();
		
		service.insertProduct(pvo);
		
		
		response.sendRedirect(request.getContextPath()+"/productList.do");
		
	}

	private String extractFileName(Part part) {
		String filename = "";
		String contentDisposition = part.getHeader("content-disposition");
		String[] items = contentDisposition.split(";");
		for(String item : items) {
			if(item.trim().startsWith("filename")) {
				filename = item.substring(item.indexOf("=") + 2, item.length() - 1);
			}
		}
		return filename;
	}

}
