package kr.or.ddit.pay.service;

import java.util.List;

import kr.or.ddit.pay.dao.PayDAOImple;
import kr.or.ddit.vo.PayListVO;
import kr.or.ddit.vo.PayVO;

public class PayServiceImpl implements IPayService {
	private PayDAOImple dao;
	private static PayServiceImpl service;
	private PayServiceImpl() {
		dao = PayDAOImple.getDao();
	}
	public static PayServiceImpl getService() {
		if(service == null) service = new PayServiceImpl();
		return service;
	}
	@Override
	public List<PayListVO> selectAllPay(String memId) {
		return dao.selectAllPay(memId);
	}

	@Override
	public int insertPay(PayVO payVo) {
		return dao.insertPay(payVo);
	}

	@Override
	public int updatePay(PayVO payVo) {
		return dao.updatePay(payVo);
	}
	@Override
	public PayVO selectPayNO(String memId) {
		return dao.selectPayNO(memId);
	}
	@Override
	public int updateProductQty(PayListVO payListVo) {
		return dao.updateProductQty(payListVo);
	}

}
