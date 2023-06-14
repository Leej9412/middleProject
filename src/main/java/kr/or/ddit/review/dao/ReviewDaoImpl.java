package kr.or.ddit.review.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.util.SqlMapClientFactory;
import kr.or.ddit.vo.ReviewVO;

public class ReviewDaoImpl implements IReviewDao {
	
	private SqlMapClient smc;
	private static ReviewDaoImpl dao;
	
	private ReviewDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	
	}
	
	public static ReviewDaoImpl getInstance() {
		if(dao == null) dao = new ReviewDaoImpl();
		return dao;
	}
	
	/**
	 * 리뷰내용을 작성한다.
	 */
	@Override
	public int insertReview(ReviewVO reviewVo) {
		int cnt = 0;
		try {
			cnt  =(int) smc.insert("review.insertReview",reviewVo);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	/**
	 * 리뷰 리스트를 보여준다.
	 */
	@Override
	public List<ReviewVO> productReviewList(Map<String, Object> map) {
		List<ReviewVO> reviewList = null;
		try {
			reviewList = smc.queryForList("review.productReviewList", map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reviewList;
	}

	/**
	 * 마이페이지 내가쓴 리뷰 모아보기 리스트임.
	 */
	@Override
	   public List<ReviewVO> myReviewList(Map<String, Object> map) {
	      List<ReviewVO> reviewList = null;
	      try {
	         reviewList = smc.queryForList("review.myReviewList", map);
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      return reviewList;
	   }

	

	@Override
	public int deleteMyReview(int re_no) {
		int cnt = 0;
		try {
			cnt = smc.delete("review.deleteMyReview", re_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	// 내가 작성한 리뷰 갯수를 가져오는 메서드 (상품별 리뷰갯수를 가져오는 메서드는 새로 만들어야 함)
	@Override
	public int totalCount(Map<String, Object> map) {
		int totalCount = 0;
		try {
			totalCount = (int) smc.queryForObject("review.myReviewTotalCount", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}

	@Override
	public List<ReviewVO> selectByPage(int revewNo) {
		List<ReviewVO> list = null;
		try {
			list = smc.queryForList("review.selectByPage", revewNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int modifyMyReview(ReviewVO vo) {
		int cnt = 0;
		try {
			cnt = smc.update("review.modifyMyReview", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}


}
