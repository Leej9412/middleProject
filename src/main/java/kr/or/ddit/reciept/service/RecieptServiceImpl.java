package kr.or.ddit.reciept.service;

import kr.or.ddit.reciept.dao.RecieptDAOImpl;
import kr.or.ddit.vo.RecieptVO;

public class RecieptServiceImpl implements IRecieptService {
	private RecieptDAOImpl dao;
	private static RecieptServiceImpl service;
	private RecieptServiceImpl() {
		dao = RecieptDAOImpl.getDao();
	}
	public static RecieptServiceImpl getService() {
		if(service == null) service = new RecieptServiceImpl();
		return service;
	}
	@Override
	public int insertReciept(RecieptVO recieptVO) {
		return dao.insertReciept(recieptVO);
	}
	@Override
	public RecieptVO selectReciept(int payNo) {
		return dao.selectReciept(payNo);
	}

}
