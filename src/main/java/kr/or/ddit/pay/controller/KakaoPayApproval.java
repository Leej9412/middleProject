package kr.or.ddit.pay.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import kr.or.ddit.cart.service.CartServiceImpl;
import kr.or.ddit.cart.service.ICartService;
import kr.or.ddit.pay.service.IPayService;
import kr.or.ddit.pay.service.PayServiceImpl;
import kr.or.ddit.productSelected.service.IProductSelectedService;
import kr.or.ddit.productSelected.service.ProductSelectedServiceImpl;
import kr.or.ddit.reciept.service.IRecieptService;
import kr.or.ddit.reciept.service.RecieptServiceImpl;
import kr.or.ddit.vo.CartVO;
import kr.or.ddit.vo.KakaoPayVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PayListVO;
import kr.or.ddit.vo.PayVO;
import kr.or.ddit.vo.ProductSelectedVO;
import kr.or.ddit.vo.RecieptVO;

@WebServlet("/kakaoPayApproval.do")
public class KakaoPayApproval extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		ICartService service = CartServiceImpl.getService();
		
		//세션에서 회원정보 받아오기
		HttpSession session = request.getSession();
		MemberVO memVo =  (MemberVO) session.getAttribute("loginMember");
		if(memVo==null) { //실제모드
			resp.sendRedirect(request.getContextPath() + "/login.do");
		}else {
			String mem_id = memVo.getMem_id();
			
			String endpointURI = "https://kapi.kakao.com/v1/payment/approve";
			
			LocalDate nowDate = LocalDate.now();
			LocalTime nowTime = LocalTime.now();
			String POID = (nowDate.toString()  + nowTime.toString()).replaceAll("-", "").replaceAll(":", "").replaceAll(" ", "").replaceAll("\\.", "");
			
			KakaoPayVO kaPayVO = (KakaoPayVO) session.getAttribute("kakaoPayRes");

		    List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		    postParams.add(new BasicNameValuePair("cid", "TC0ONETIME"));
		    postParams.add(new BasicNameValuePair("tid", kaPayVO.getTid()));
		    postParams.add(new BasicNameValuePair("partner_order_id", kaPayVO.getPartner_order_id()));
		    postParams.add(new BasicNameValuePair("partner_user_id", memVo.getMem_id()));
			postParams.add(new BasicNameValuePair("pg_token", request.getParameter("pg_token")));
			
		    System.out.println( postParams.toString() );
		    
			CloseableHttpClient client = HttpClients.createDefault();
			
			try {
				HttpPost httpPost = new HttpPost(endpointURI);
				// httpPost.setEntity(new StringEntity(payload));
				

			    //Post 방식인 경우 데이터를 Request body message에 전송
			    HttpEntity postEntity = new UrlEncodedFormEntity(postParams, "UTF-8");
			    httpPost.setEntity(postEntity);
			    
			    
				httpPost.setHeader("Accept", "application/json");
				httpPost.setHeader("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
				httpPost.setHeader("Authorization", "KakaoAK 91de792b5cb78fbd9e988c5927b11c21");
				
				
				CloseableHttpClient httpClient = HttpClientBuilder.create().build();
				CloseableHttpResponse response = httpClient.execute(httpPost);
				
				PrintWriter out = resp.getWriter();

				try {
					if (response.getStatusLine().getStatusCode() != HttpStatus.SC_OK) {
						System.err.println("Status Code: " + response.getStatusLine().getStatusCode());
						System.err.println("Status Line: " + response.getStatusLine());
						String responseEntity = EntityUtils.toString(response.getEntity());
						System.err.println("Response Entity: " + responseEntity);

						throw new RuntimeException(
								"An error occurred when invoking Decision Service at: "
										+ endpointURI
										+ "\n"
										+ response.getStatusLine() + ": " + responseEntity);
						
						
					}  else {
						String result = EntityUtils.toString(response.getEntity());
//						JSONParser parser = new JSONParser();
//				        try {
//				        	//String을 JSON데이터로 변환
//							JSONObject kakaoPayRes = (JSONObject) parser.parse(result);
//							//result "tid" 뽑기... jsonObject.get("tid")
//							//세션에 JSON 통째로 저장
//							session.setAttribute("kakaoPayRes", kakaoPayRes);
//						} catch (ParseException e) {
//							e.printStackTrace();
//						}

						//결제 성공이면 결제창 결제상태update, 영수증insert, 장바구니delete
						IPayService payService = PayServiceImpl.getService();
						PayVO payVO = new PayVO();
						payVO.setPay_no(kaPayVO.getPay_no());
						System.out.println("\n\n\n\n\n\n kaPayVO.getPay_no() : " + kaPayVO.getPay_no());
						payVO.setPay_status(1);
						int res = payService.updatePay(payVO);
						
//						pay_status
//						0: 결제대기
//						1: 결제성공
//						2: 결제실패
//						3: 결제취소
//						4: 교환/환불
						
						IProductSelectedService psService = ProductSelectedServiceImpl.getService();
						
						List<ProductSelectedVO> psList = psService.selectProductSelected(kaPayVO.getPay_no());
						
						for(int i=0; i<psList.size(); i++) {
							PayListVO payListVo = new PayListVO();
							
							payListVo.setP_id(psList.get(i).getP_id());
							payListVo.setPs_qty(psList.get(i).getPs_qty());
							
							//결제 성공이면 재고 업데이트
							int res4 = payService.updateProductQty(payListVo);
						}
						
						IRecieptService receiptService = RecieptServiceImpl.getService();
						RecieptVO recieptVO = new RecieptVO();
						recieptVO.setRec_total(kaPayVO.getTotal_amount());
						recieptVO.setPay_no(kaPayVO.getPay_no());
						recieptVO.setRec_tid(kaPayVO.getTid());
						int res2 = receiptService.insertReciept(recieptVO);
						
						ICartService cartService = CartServiceImpl.getService();
						String[] cartNoArr = kaPayVO.getCartNoArr();
						CartVO cartVo = new CartVO();
						cartVo.setMem_id(memVo.getMem_id());
						for(int i=0; i<cartNoArr.length; i++) {
							int elem = Integer.parseInt(cartNoArr[i]);
							cartVo.setCart_no(elem);
							int res3 = cartService.deleteCart(cartVo);
						}
						
						
						System.out.println("Result: " + result);
						
						//out.print(result);
						//out.print("<script>location.herf='/'</script>");
						
						request.setAttribute("PayStatus", "success");
						request.getRequestDispatcher("/includes/pay/ljy0.pay.jsp").forward(request, resp);
						
					}
				} catch(Exception e) {
					e.printStackTrace();
				}  finally {
					if (response != null) {
						response.close();
					}
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				client.close();
			}
		}
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
