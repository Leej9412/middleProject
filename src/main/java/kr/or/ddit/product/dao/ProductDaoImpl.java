package kr.or.ddit.product.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.util.SqlMapClientFactory;
import kr.or.ddit.vo.Paging;
import kr.or.ddit.vo.ProductVO;

public class ProductDaoImpl implements IProductDao {
	private SqlMapClient smc;
	private static ProductDaoImpl dao;
	
	
	private ProductDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static ProductDaoImpl getInstance() {
		if(dao == null) dao = new ProductDaoImpl();
		return dao;
	}
	
	/**
	 * DB에 저장된 전체 상품 목록을 가져와 List에 담아서 반환하는 메서드
	 * @return 전체 상품 목록이 저장된 List객체
	 */
	@Override
	public List<ProductVO> getAllProduct(Map<String,Object> paramMap) {	//상품전체보기
		List<ProductVO> productList = null;
		try {
			productList = smc.queryForList("product.getAllProduct", paramMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productList;
	}
	

	@Override
	public List<ProductVO> getCategoryName() {
		List<ProductVO> categoryName = null;
			try {
				categoryName = smc.queryForList("product.getCategoryName");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return categoryName;
	};
	
	/**
	 * DB에 저장되어 있는 모든 상품들의 수를 구하는 메서드
	 * @return 모든 상품의 수를 반환해줌
	 */
	public int getProductCount(Map<String,Object> paramMap) {
		int cnt=0;
		try {
			cnt = (int)smc.queryForObject("product.getProductCount", paramMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("총개수"+cnt);
		return cnt;
	}
	
	/**
	 * 관리자가 상품을 등록할 수있도록 하는 메서드
	 * @param productVo 상품객체를 파라미터로 받는다
	 * @return 상품등록을 1개씩 하도록 설정하였으니 삽입이 성공하면 1을 반환한다
	 */
	@Override
	public int insertProduct(ProductVO productVo) {
		int cnt = 0;
		try {
			Object obj = smc.insert("product.insertProduct", productVo);
			if (obj == null)
				cnt = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	/**
	 * 고객이 상품페이지를 방문했을 때 상품 이미지, 이름, 가격이 보여지도록 데이터를 가져우는 메서드
	 * @param productNo
	 * @return
	 */
	@Override
	public ProductVO showProduct(int productNo) {
		ProductVO productVo = null;
		try {
			productVo = (ProductVO) smc.queryForObject("product.showProduct", productNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productVo;
	}

	@Override
	public int deleteProduct(int productNo) {
		int cnt = 0;
		try {
			cnt = smc.delete("product.deleteProduct", productNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<ProductVO> searchProductName(String searchName) {
		List<ProductVO> list = null;
		try {
			list = smc.queryForList("product.searchProductName", searchName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}


}
