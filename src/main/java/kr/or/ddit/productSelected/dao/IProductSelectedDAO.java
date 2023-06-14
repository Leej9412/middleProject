package kr.or.ddit.productSelected.dao;

import java.util.List;

import kr.or.ddit.vo.PayVO;
import kr.or.ddit.vo.ProductSelectedVO;

public interface IProductSelectedDAO {

	public List<ProductSelectedVO> selectProductSelected(int payNo);
	
	public int insertProductSelected(ProductSelectedVO psVo);
	
}
