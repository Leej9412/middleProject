package kr.or.ddit.product.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProductVO;

public interface IProductService {
	
	/**
	 * DB에 저장된 전체 상품 목록을 가져와 List에 담아서 반환하는 메서드
	 * @return 전체 상품 목록이 저장된 List객체
	 */
	public List<ProductVO> getAllProduct(Map<String,Object> paramMap);
	
	
	/**
	 * 카테고리 테이블에 있는 카테고리 이름을 가져오는 메서드
	 * @param paramMap
	 * @return
	 */
	public List<ProductVO> getCategoryName();
	
	/**
	 * DB에 저장되어 있는 모든 상품들의 수를 구하는 메서드
	 * @return 모든 상품의 수를 반환해줌
	 */
	public int getProductCount(Map<String,Object> paramMap);
	
	/**
	 * 관리자가 상품을 등록할 수있도록 하는 메서드
	 * @param productVo 상품객체를 파라미터로 받는다
	 * @return 상품등록을 1개씩 하도록 설정하였으니 삽입이 성공하면 1을 반환한다
	 */
	public int insertProduct(ProductVO productVo);
	
	/**
	 * 고객이 상품페이지를 방문했을 때 상품 이미지, 이름, 가격이 보여지도록 데이터를 가져우는 메서드
	 * @param productNo
	 * @return
	 */
	public ProductVO showProduct(int productNo);
	
	
	/**
	 * 상품 이름으로 검색해서 상품 목록을 출력하는 메서드
	 * @param searchName 검색할 상품 이름 문자
	 * @return
	 */
	public List<ProductVO> searchProductName(String searchName);
	
	/**
	 * productNo를 받아 상품 삭제
	 * @param productNo
	 * @return
	 */
	public int deleteProduct(int productNo);
	
}
