package kr.or.ddit.pay.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.json.simple.parser.JSONParser;

import kr.or.ddit.pay.service.IPayService;
import kr.or.ddit.pay.service.PayServiceImpl;
import kr.or.ddit.reciept.service.IRecieptService;
import kr.or.ddit.reciept.service.RecieptServiceImpl;
import kr.or.ddit.vo.PayVO;
import kr.or.ddit.vo.RecieptVO;

@WebServlet("/payCancel.do")
public class PayCancel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		IRecieptService recService = RecieptServiceImpl.getService();
		IPayService payService = PayServiceImpl.getService();
		
		RecieptVO recieptVO = recService.selectReciept(Integer.parseInt(request.getParameter("payNo")));
		PrintWriter out = resp.getWriter();

		if (recieptVO != null) {
			List<NameValuePair> postParams = new ArrayList<NameValuePair>();
			postParams.add(new BasicNameValuePair("cid", "TC0ONETIME"));
			postParams.add(new BasicNameValuePair("tid", recieptVO.getRec_tid()));
			postParams.add(new BasicNameValuePair("cancel_amount", recieptVO.getRec_total()+""));
			postParams.add(new BasicNameValuePair("cancel_tax_free_amount", 0+""));

			System.out.println(postParams.toString());

			CloseableHttpClient client = HttpClients.createDefault();
			
			String endpointURI = "https://kapi.kakao.com/v1/payment/cancel";

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
							//결제취소 성공하면 pay_status=4로 update
							PayVO payVO = new PayVO();
							payVO.setPay_no(recieptVO.getPay_no());
							payVO.setPay_status(4);
							int res = payService.updatePay(payVO);
							request.setAttribute("result", res);
							request.getRequestDispatcher("/result.jsp").forward(request, resp);
							
						} catch (Exception e) {
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
