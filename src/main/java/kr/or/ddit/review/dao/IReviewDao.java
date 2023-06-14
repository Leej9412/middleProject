package kr.or.ddit.review.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ReviewVO;

public interface IReviewDao {
	
	/**
	 * 글 리스트 보는 인터페이스 메소드긴 한데 잘 모르겠음 .
	 * @param map
	 * @return
	 */
	public List<ReviewVO> selectByPage(int re_no);
	
	/**
	 * 글 갯수 구하는 인터페이스 메소드
	 * @param map
	 * @return
	 */
	public int totalCount(Map<String, Object> map);
	
	/**
	 * 리뷰 등록 하는 인터페이스 메소드
	 * @param reviewVo ReivewVO라는 객체를 넘겨주고 넘겨받음.
	 * @return 
	 */
	public int insertReview(ReviewVO reviewVo);
	
	/**
	 * 상품 리뷰 리스트를 보여주는 인터페이스 메소드
	 * @return
	 */
	public List<ReviewVO> productReviewList(Map<String, Object> map);
	
	/**
	 * 나의 리뷰 리스트를 보여주는 인터페이스 메소드
	 * @return
	 */
	public List<ReviewVO> myReviewList(Map<String, Object> map);
	
	/**
	 * 리뷰를 삭제하는 인터페이스 메소드
	 * @param re_no
	 * @return
	 */
	public int deleteMyReview(int re_no);
	
	/**
	 * 리뷰를 수정하는 인터페이스 메소드
	 * @param vo
	 * @return
	 */
	public int modifyMyReview(ReviewVO vo);
	
	
}
