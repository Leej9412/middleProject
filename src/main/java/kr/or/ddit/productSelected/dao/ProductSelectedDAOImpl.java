package kr.or.ddit.productSelected.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.util.SqlMapClientFactory;
import kr.or.ddit.vo.PayVO;
import kr.or.ddit.vo.ProductSelectedVO;

public class ProductSelectedDAOImpl implements IProductSelectedDAO {
	private SqlMapClient smc;
	
	private static ProductSelectedDAOImpl dao;
	
	private ProductSelectedDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static ProductSelectedDAOImpl getDao() {
		if(dao == null) dao = new ProductSelectedDAOImpl();
		return dao;
	}

	@Override
	public List<ProductSelectedVO> selectProductSelected(int payNo) {
		List<ProductSelectedVO> list = null;
		try {
			list = smc.queryForList("productSelected.selectProductSelected", payNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertProductSelected(ProductSelectedVO psVo) {
		int cnt = 0;
		try {
			Object obj = smc.insert("productSelected.insertProductSelected", psVo);
			if(obj == null) cnt = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
