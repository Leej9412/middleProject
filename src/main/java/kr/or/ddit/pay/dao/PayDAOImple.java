package kr.or.ddit.pay.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.util.SqlMapClientFactory;
import kr.or.ddit.vo.PayListVO;
import kr.or.ddit.vo.PayVO;

public class PayDAOImple implements IPayDAO {
	private SqlMapClient smc;
	
	private static PayDAOImple dao;
	
	private PayDAOImple() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static PayDAOImple getDao() {
		if(dao == null) dao = new PayDAOImple();
		return dao;
	}

	@Override
	public List<PayListVO> selectAllPay(String memId) {
		List<PayListVO> list = null;
		try {
			list = smc.queryForList("pay.selectAllPay", memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertPay(PayVO payVo) {
		int cnt = 0;
		try {
			Object obj = smc.insert("pay.insertPay", payVo);
			if(obj == null) cnt = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updatePay(PayVO payVo) {
		int cnt = 0;
		try {
			cnt = smc.update("pay.updatePay", payVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public PayVO selectPayNO(String memId) {
		PayVO payVO = null;
		try {
			payVO = (PayVO) smc.queryForObject("pay.selectPayNO", memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return payVO;
	}

	@Override
	public int updateProductQty(PayListVO payListVo) {
		int cnt = 0;
		try {
			cnt = smc.update("pay.updateProductQty", payListVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
}
