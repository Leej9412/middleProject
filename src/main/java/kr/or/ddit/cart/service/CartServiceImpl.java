package kr.or.ddit.cart.service;

import java.util.List;

import kr.or.ddit.cart.dao.CartDAOImpl;
import kr.or.ddit.vo.CartListVO;
import kr.or.ddit.vo.CartVO;

public class CartServiceImpl implements ICartService {
	private CartDAOImpl dao;
	private static CartServiceImpl service;
	private CartServiceImpl() {
		dao = CartDAOImpl.getDao();
	}
	public static CartServiceImpl getService() {
		if(service == null) service = new CartServiceImpl();
		return service;
	}
	@Override
	public List<CartListVO> selectAllCart(String memId) {
		return dao.selectAllCart(memId);
	}
	@Override
	public CartVO selectOneCart(int cartNo) {
		return dao.selectOneCart(cartNo);
	}
	@Override
	public int insertCart(CartVO cartVO) {
		// select(제품id,회원id ) >=1 ===> update
		// else insert 
		CartVO checkCartProduct = dao.checkCartProduct(cartVO);
		if(checkCartProduct == null) {
			return dao.insertCart(cartVO);
		}else {
			//수량선택하지 않고 그냥 장바구니 담기 누르면 +1
			if(checkCartProduct.getCart_qty() == 0) checkCartProduct.setCart_qty(1);
			//기존수량 + 신규수량
			cartVO.setCart_qty(  cartVO.getCart_qty() + checkCartProduct.getCart_qty()  );
			return dao.updateCartQty(cartVO);
		}
		// 지운 이유를 써주는거야 : udate insert를 했음에도 불구하고 또 한번 return insert해주서
		// return dao.insertCart(cartVO);
	}
	@Override
	public int updateCartQty(CartVO cartVO) {
		return dao.updateCartQty(cartVO);
	}
	@Override
	public int deleteCart(CartVO cartVO) {
		return dao.deleteCart(cartVO);
	}
	@Override
	public int deleteAllCart(String memId) {
		return dao.deleteAllCart(memId);
	}
	@Override
	public int selectProdCount(String memId) {
		return dao.selectProdCount(memId);
	}

}
