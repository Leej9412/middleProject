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
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import kr.or.ddit.cart.service.CartServiceImpl;
import kr.or.ddit.cart.service.ICartService;
import kr.or.ddit.pay.service.IPayService;
import kr.or.ddit.pay.service.PayServiceImpl;
import kr.or.ddit.productSelected.service.IProductSelectedService;
import kr.or.ddit.productSelected.service.ProductSelectedServiceImpl;
import kr.or.ddit.vo.CartListVO;
import kr.or.ddit.vo.KakaoPayVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PayVO;
import kr.or.ddit.vo.ProductSelectedVO;

@WebServlet("/kakaoPay.do")
public class KakaoPay extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		PrintWriter out = resp.getWriter();
		
		ICartService cartService = CartServiceImpl.getService();
		
		// 카카오페이로 넘기는 파라미터들 담는 VO
		KakaoPayVO kakaoVO = new KakaoPayVO();

		// 세션에서 회원정보 받아오기
		HttpSession session = request.getSession();
		MemberVO memVo = (MemberVO) session.getAttribute("loginMember");
		if (memVo == null) { // 실제모드
			resp.sendRedirect(request.getContextPath() + "/login.do");
		} else {
			String mem_id = memVo.getMem_id();

			List<CartListVO> cartList = cartService.selectAllCart(mem_id);
			String chkProductList = request.getParameter("chkProductList");

			String chkProductListArr[] = chkProductList.split("\\&");
			// 1&2&3 ==> [1,2,3]

			String item_name = "";
			int quantity = 0;
			int total_amount = 0;
			int tax_free_amount = 0;
			String cartNo = "";
			

			for (int i = 0; i < cartList.size(); i++) {
				CartListVO vo = cartList.get(i);

				for (int j = 0; j < chkProductListArr.length; j++) {

					if (vo.getP_id() == Integer.parseInt(chkProductListArr[j])) { // 체크한 것만 가져와서
						cartNo += vo.getCart_no();
						
						if(vo.getCart_qty() > vo.getP_qty()) {
							out.print("'result':{ 'status':false, 'message':'재고가 부족합니다.' } ");
							// 결제 진행 막아야 함
							// #1 : true일 때만 결제 진행하는 boolean선언하고, 이 부분 들어오면 false로 바꿔주는 것
							// #2 : 디스패쳐 해서 바로 보내버리기 
						}
						
						if (chkProductListArr.length > 1) {
							item_name = vo.getP_name() + " 외 " + (chkProductListArr.length - 1) + "건";
							if(j!= (chkProductListArr.length)-1) {
								cartNo += "&";
							}
						} else {
							item_name = vo.getP_name();
						}
						
						quantity += vo.getCart_qty();
						total_amount += vo.getP_price() * vo.getCart_qty();

					}

				}

			}
			
			// 카트에 담긴 상품 
			String[] cartNoArr = cartNo.split("\\&");
			kakaoVO.setCartNoArr(cartNoArr);

			System.out.println(item_name + " : " + quantity + " : " + total_amount + " : " + tax_free_amount);

			String endpointURI = "https://kapi.kakao.com/v1/payment/ready";

			LocalDate nowDate = LocalDate.now();
			LocalTime nowTime = LocalTime.now();
			String POID = (nowDate.toString() + nowTime.toString()).replaceAll("-", "").replaceAll(":", "")
					.replaceAll(" ", "").replaceAll("\\.", "");
			
			kakaoVO.setPartner_order_id(POID);

			IPayService payService = PayServiceImpl.getService();

			// Pay 테이블 DB로 넘기는 파라미터들 담는 VO
			PayVO payVO = new PayVO();
			payVO.setMem_id(memVo.getMem_id());
			payVO.setPay_total(total_amount);

			int res = payService.insertPay(payVO);
			payVO = payService.selectPayNO(memVo.getMem_id());
			
			
			IProductSelectedService psService = ProductSelectedServiceImpl.getService();
			
			//장바구니 전체
			for (int i = 0; i < cartList.size(); i++) {
				CartListVO vo = cartList.get(i);
				
				//내가 체크한 상품들
				for (int j = 0; j < chkProductListArr.length; j++) {

					if (vo.getP_id() == Integer.parseInt(chkProductListArr[j])) { // 체크한 것만 가져와서
						
						ProductSelectedVO psVO = new ProductSelectedVO();
						psVO.setPs_qty(vo.getCart_qty());
						psVO.setPs_cost(vo.getP_price() * vo.getCart_qty());
						psVO.setP_id(vo.getP_id());
						psVO.setPay_no(payVO.getPay_no());
						
						int res2 = psService.insertProductSelected(psVO);

					}

				}

			}
			
			//통신하는 부분...?
			if (res > 0) {
				List<NameValuePair> postParams = new ArrayList<NameValuePair>();
				postParams.add(new BasicNameValuePair("cid", "TC0ONETIME"));
				postParams.add(new BasicNameValuePair("partner_order_id", POID));
//			    postParams.add(new BasicNameValuePair("partner_user_id", request.getParameter("mem_id")));//TEST모드
				postParams.add(new BasicNameValuePair("partner_user_id", memVo.getMem_id()));// 실제모드
				postParams.add(new BasicNameValuePair("item_name", item_name));
				postParams.add(new BasicNameValuePair("quantity", quantity + ""));
				postParams.add(new BasicNameValuePair("total_amount", total_amount + ""));
				postParams.add(new BasicNameValuePair("tax_free_amount", tax_free_amount + ""));
				postParams.add(new BasicNameValuePair("approval_url",
						"http://localhost" + request.getContextPath() + "/kakaoPayApproval.do"));
				postParams.add(new BasicNameValuePair("cancel_url",
						"http://localhost" + request.getContextPath() + "/kakaoPayCancel.do"));
				postParams.add(new BasicNameValuePair("fail_url",
						"http://localhost" + request.getContextPath() + "/kakaoPayFail.do"));

				System.out.println(postParams.toString());

				CloseableHttpClient client = HttpClients.createDefault();

				try {
					HttpPost httpPost = new HttpPost(endpointURI);
					// httpPost.setEntity(new StringEntity(payload));

					// Post 방식인 경우 데이터를 Request body message에 전송
					HttpEntity postEntity = new UrlEncodedFormEntity(postParams, "UTF-8");
					httpPost.setEntity(postEntity);

					httpPost.setHeader("Accept", "application/json");
					httpPost.setHeader("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
					httpPost.setHeader("Authorization", "KakaoAK 91de792b5cb78fbd9e988c5927b11c21");

					CloseableHttpClient httpClient = HttpClientBuilder.create().build();
					CloseableHttpResponse response = httpClient.execute(httpPost);

					

					try {
						if (response.getStatusLine().getStatusCode() != HttpStatus.SC_OK) {
							System.err.println("Status Code: " + response.getStatusLine().getStatusCode());
							System.err.println("Status Line: " + response.getStatusLine());
							String responseEntity = EntityUtils.toString(response.getEntity());
							System.err.println("Response Entity: " + responseEntity);

							throw new RuntimeException("An error occurred when invoking Decision Service at: "
									+ endpointURI + "\n" + response.getStatusLine() + ": " + responseEntity);
						} else {
							String result = EntityUtils.toString(response.getEntity());
							JSONParser parser = new JSONParser();
							try {
								// String을 JSON데이터로 변환
								JSONObject kakaoPayRes = (JSONObject) parser.parse(result);
								// result "tid" 뽑기... kakaoPayRes.get("tid")
								// 세션에 result "tid" 뽑아서 저장
								kakaoVO.setTid(kakaoPayRes.get("tid").toString());
								kakaoVO.setPay_no(payVO.getPay_no());
								kakaoVO.setTotal_amount(total_amount);
								session.setAttribute("kakaoPayRes", kakaoVO);
							} catch (ParseException e) {
								e.printStackTrace();
							}
							System.out.println("Result: " + result);
							out.print(result);
						}
					} finally {
						if (response != null) {
							response.close();
						}
					}
				} finally {
					client.close();
				}
			}else {
				out.print("결제에 실패했습니다.");
			}
		}

	}

	/*
	 * protected void doPost(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { HttpURLConnection conn =
	 * null; JsonObject responseJson = null; JsonObject params = new JsonObject();
	 * 
	 * try { //URL 설정 URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
	 * 
	 * conn = (HttpURLConnection) url.openConnection();
	 * 
	 * // type의 경우 POST, GET, PUT, DELETE 가능 conn.setRequestMethod("POST");
	 * conn.setRequestProperty("Content-Type", "application/json");
	 * conn.setRequestProperty("Authorization",
	 * "KakaoAK 91de792b5cb78fbd9e988c5927b11c21"); conn.setRequestProperty("Host",
	 * "kapi.kakao.com"); conn.setRequestProperty("Content-Length", "259");
	 * conn.setDoOutput(true);
	 * 
	 * 
	 * BufferedWriter bw = new BufferedWriter(new
	 * OutputStreamWriter(conn.getOutputStream())); // JSON 형식의 데이터 셋팅 JsonObject
	 * commands = new JsonObject(); JsonArray jsonArray = new JsonArray();
	 * 
	 * LocalDate nowDate = LocalDate.now(); LocalTime nowTime = LocalTime.now();
	 * String POID = "PNG"+(nowDate.toString() + nowTime.toString()).replaceAll("-",
	 * "").replaceAll(":", "").replaceAll(" ", "").replaceAll("\\.", "");
	 * 
	 * System.out.println(POID);
	 * 
	 * params.addProperty("cid", "TC0ONETIME");
	 * params.addProperty("partner_order_id", POID);
	 * params.addProperty("partner_user_id", request.getParameter("mem_id"));
	 * params.addProperty("item_name", request.getParameter("p_name")); //
	 * params.addProperty("item_code", request.getParameter("p_id"));
	 * params.addProperty("quantity", request.getParameter("totalQty"));
	 * params.addProperty("total_amount", request.getParameter("totalAmount"));
	 * params.addProperty("tax_free_amount", request.getParameter("taxFreeAmount"));
	 * 
	 * params.addProperty("approval_url", "http://localhost" +
	 * request.getContextPath() + "/kakaoPayApproval.do");
	 * params.addProperty("cancel_url", "http://localhost" +
	 * request.getContextPath() + "/kakaoPayCancel.do");
	 * params.addProperty("fail_url", "http://localhost" + request.getContextPath()
	 * + "/kakaoPayFail.do");
	 * 
	 * //commands.add("userInfo", params); // JSON 형식의 데이터 셋팅 끝
	 * 
	 * // 데이터를 STRING으로 변경 Gson gson = new
	 * GsonBuilder().setPrettyPrinting().create(); String jsonOutput =
	 * gson.toJson(params);
	 * 
	 * 
	 * System.out.println(jsonOutput); bw.write(jsonOutput.toString()); bw.flush();
	 * bw.close();
	 * 
	 * // 보내고 결과값 받기 int responseCode = conn.getResponseCode();
	 * System.out.println("responseCode : " + responseCode ); System.out.println(
	 * conn.getResponseMessage() );
	 * 
	 * System.out.println( conn.getContent() );
	 * 
	 * if (responseCode == 200) { BufferedReader br = new BufferedReader(new
	 * InputStreamReader(conn.getInputStream())); StringBuilder sb = new
	 * StringBuilder(); String line = ""; while ((line = br.readLine()) != null) {
	 * sb.append(line); } // responseJson = new JsonObject();
	 * 
	 * System.out.println(sb); // 응답 데이터 System.out.println("responseJson :: " +
	 * responseJson); } else {
	 * 
	 * } } catch (MalformedURLException e) { e.printStackTrace(); } catch
	 * (IOException e) { e.printStackTrace(); } catch (Exception e) {
	 * e.printStackTrace(); }
	 * 
	 * }
	 */
	/*
	 * protected void doPost(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { URL url = new
	 * URL("https://kapi.kakao.com/v1/payment/ready"); HttpURLConnection conn =
	 * (HttpURLConnection)url.openConnection(); conn.setRequestMethod("POST");
	 * conn.setDoOutput(true); conn.setRequestProperty("Authorization",
	 * "KakaoAK 2c41dce389a43715a2ed0fdd26ed8140");
	 * conn.setRequestProperty("Content-type",
	 * "application/x-www-form-urlencoded;charset=utf-8");
	 * 
	 * 
	 * 
	 * LocalDate nowDate = LocalDate.now(); LocalTime nowTime = LocalTime.now();
	 * String POID = (nowDate.toString() + nowTime.toString()).replaceAll("-",
	 * "").replaceAll(":", "").replaceAll(" ", "").replaceAll("\\.", "");
	 * 
	 * System.out.println(POID);
	 * 
	 * Map<String, String> params = new HashMap<String, String>(); params.put("cid",
	 * "TC0ONETIME"); params.put("partner_order_id", POID);
	 * params.put("partner_user_id", request.getParameter("mem_id"));
	 * params.put("item_name", request.getParameter("p_name")); //
	 * params.put("item_code", request.getParameter("p_id")); params.put("quantity",
	 * request.getParameter("totalQty")); params.put("total_amount",
	 * request.getParameter("totalAmount")); params.put("tax_free_amount",
	 * request.getParameter("taxFreeAmount"));
	 * 
	 * params.put("approval_url", "http://localhost" + request.getContextPath() +
	 * "/kakaoPayApproval.do"); params.put("cancel_url", "http://localhost" +
	 * request.getContextPath() + "/kakaoPayCancel.do"); params.put("fail_url",
	 * "http://localhost" + request.getContextPath() + "/kakaoPayFail.do");
	 * 
	 * String stringParams = new String(); for(Map.Entry<String, String> elem :
	 * params.entrySet()) { stringParams += (elem.getKey() + "=" + elem.getValue() +
	 * "&"); } System.out.println("stringParams \n\n" + stringParams);
	 * 
	 * conn.getOutputStream().write(stringParams.getBytes());
	 * 
	 * BufferedReader in = new BufferedReader(new
	 * InputStreamReader(conn.getInputStream()));
	 * 
	 * JsonParser parser = new JsonParser(); JsonObject obj = (JsonObject)
	 * parser.parse(in);
	 * 
	 * String successUrl = obj.get("next_redirect_pc_url").toString(); PrintWriter
	 * out = new PrintWriter(System.out); out.print(successUrl);
	 * 
	 * }
	 */

}
