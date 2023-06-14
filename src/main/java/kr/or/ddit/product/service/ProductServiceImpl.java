package kr.or.ddit.product.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.product.dao.IProductDao;
import kr.or.ddit.product.dao.ProductDaoImpl;
import kr.or.ddit.vo.ProductVO;

public class ProductServiceImpl implements IProductService {
	private IProductDao dao;
	private static ProductServiceImpl service;
	private ProductServiceImpl() {
		dao = ProductDaoImpl.getInstance();
	}
	public static ProductServiceImpl getInstance() {
		if(service == null) service = new ProductServiceImpl();
		return service;
	}
	
	
	/**
	 * DB에 저장된 전체 상품 목록을 가져와 List에 담아서 반환하는 메서드
	 * @return 전체 상품 목록이 저장된 List객체
	 */
	@Override
	public List<ProductVO> getAllProduct(Map<String,Object> paramMap) {
		return dao.getAllProduct(paramMap);
	}
	
	/**
	 * DB에 저장되어 있는 모든 상품들의 수를 구하는 메서드
	 * @return 모든 상품의 수를 반환해줌
	 */
	public int getProductCount(Map<String,Object> paramMap) {
		return dao.getProductCount(paramMap);
	}
	
	/**
	 * 관리자가 상품을 등록할 수있도록 하는 메서드
	 * @param productVo 상품객체를 파라미터로 받는다
	 * @return 상품등록을 1개씩 하도록 설정하였으니 삽입이 성공하면 1을 반환한다
	 */
	@Override
	public int insertProduct(ProductVO productVo) {
		return dao.insertProduct(productVo);
	}
	
	/**
	 * 고객이 상품페이지를 방문했을 때 상품 이미지, 이름, 가격이 보여지도록 데이터를 가져우는 메서드
	 * @param productNo
	 * @return
	 */
	@Override
	public ProductVO showProduct(int productNo) {
		return dao.showProduct(productNo);
	}
	@Override
	public int deleteProduct(int productNo) {
		return dao.deleteProduct(productNo);
	}
	@Override
	public List<ProductVO> getCategoryName() {
		return dao.getCategoryName();
	}
	@Override
	public List<ProductVO> searchProductName(String searchName) {
		return dao.searchProductName(searchName);
	};
	
	
	


}
