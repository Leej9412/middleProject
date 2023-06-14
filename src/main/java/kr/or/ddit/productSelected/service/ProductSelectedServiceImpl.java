package kr.or.ddit.productSelected.service;

import java.util.List;

import kr.or.ddit.productSelected.dao.ProductSelectedDAOImpl;
import kr.or.ddit.vo.PayVO;
import kr.or.ddit.vo.ProductSelectedVO;

public class ProductSelectedServiceImpl implements IProductSelectedService{
	private ProductSelectedDAOImpl dao;
	private static ProductSelectedServiceImpl service;
	private ProductSelectedServiceImpl() {
		dao = ProductSelectedDAOImpl.getDao();
	}
	public static ProductSelectedServiceImpl getService() {
		if(service == null) service = new ProductSelectedServiceImpl();
		return service;
	}

	@Override
	public List<ProductSelectedVO> selectProductSelected(int payNo) {
		return dao.selectProductSelected(payNo);
	}

	@Override
	public int insertProductSelected(ProductSelectedVO psVo) {
		return dao.insertProductSelected(psVo);
	}

}
