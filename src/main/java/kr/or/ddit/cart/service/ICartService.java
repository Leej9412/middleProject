package kr.or.ddit.cart.service;

import java.util.List;

import kr.or.ddit.vo.CartListVO;
import kr.or.ddit.vo.CartVO;

public interface ICartService {

public List<CartListVO> selectAllCart(String memId);
	
	public CartVO selectOneCart(int cartNo);

	public int insertCart(CartVO cartVO);
	
	public int updateCartQty(CartVO cartVO);
	
	public int deleteCart(CartVO cartVO);
	
	public int deleteAllCart(String memId);
	
	public int selectProdCount(String memId);
	
}
