package kr.or.ddit.productSelected.service;

import java.util.List;

import kr.or.ddit.vo.PayVO;
import kr.or.ddit.vo.ProductSelectedVO;

public interface IProductSelectedService {
	
	public List<ProductSelectedVO> selectProductSelected(int payNo);
	
	public int insertProductSelected(ProductSelectedVO psVo);
	
}
