package kr.or.ddit.cart.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.util.SqlMapClientFactory;
import kr.or.ddit.vo.CartListVO;
import kr.or.ddit.vo.CartVO;

public class CartDAOImpl implements ICartDAO {
	private SqlMapClient smc;
	
	private static CartDAOImpl dao;
	
	private CartDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	public static CartDAOImpl getDao() {
		if(dao == null) dao = new CartDAOImpl();
		return dao;
	}
	
	@Override
	public CartVO checkCartProduct(CartVO cartVO) {
		CartVO vo = null;
		try {
			vo = (CartVO) smc.queryForObject("cart.checkCartProduct", cartVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	@Override
	public List<CartListVO> selectAllCart(String memId) {
		List<CartListVO> list = null;
		try {
			list = smc.queryForList("cart.selectAllCart", memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public CartVO selectOneCart(int cartNo) {
		CartVO vo = null;
		try {
			vo = (CartVO) smc.queryForObject("cart.selectOneCart", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	@Override
	public int insertCart(CartVO cartVO) {
		int cnt = 0;
		try {
			Object obj = smc.insert("cart.insertCart", cartVO);
			if(obj==null) cnt = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int updateCartQty(CartVO cartVO) {
		int cnt = 0;
		try {
			cnt = smc.update("cart.updateCartQty", cartVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int deleteCart(CartVO cartVO) {
		int cnt = 0;
		try {
			cnt = smc.delete("cart.deleteCart", cartVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int deleteAllCart(String memId) {
		int cnt = 0;
		try {
			cnt = smc.delete("cart.deleteAllCart", memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int selectProdCount(String memId) {
		int cnt = 0;
		try {
			cnt = (int) smc.queryForObject("cart.selectProdCount", memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}


}
