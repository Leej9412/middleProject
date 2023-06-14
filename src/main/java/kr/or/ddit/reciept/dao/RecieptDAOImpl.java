package kr.or.ddit.reciept.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.util.SqlMapClientFactory;
import kr.or.ddit.vo.RecieptVO;

public class RecieptDAOImpl implements IRecieptDAO{
	private SqlMapClient smc;
	
	private static RecieptDAOImpl dao;
	
	private RecieptDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	public static RecieptDAOImpl getDao() {
		if(dao == null) dao = new RecieptDAOImpl();
		return dao;
	}

	@Override
	public int insertReciept(RecieptVO recieptVO) {
		int cnt = 0;
		try {
			Object obj = smc.insert("reciept.insertReciept", recieptVO);
			if(obj == null) cnt = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public RecieptVO selectReciept(int payNo) {
		RecieptVO recieptVO = null;
		try {
			recieptVO = (RecieptVO) smc.queryForObject("reciept.selectReciept", payNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return recieptVO;
	}

}
