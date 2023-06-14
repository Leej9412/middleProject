package kr.or.ddit.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.review.dao.IReviewDao;
import kr.or.ddit.review.dao.ReviewDaoImpl;
import kr.or.ddit.vo.PageVO;
import kr.or.ddit.vo.ReviewVO;

public class ReviewServiceImpl implements IReviewService {
	
	private IReviewDao dao;
	private static ReviewServiceImpl service;
	private ReviewServiceImpl() {
		dao = ReviewDaoImpl.getInstance();
	}
	
	public static ReviewServiceImpl getInstance() {
		if(service == null) service = new ReviewServiceImpl();
		return service;
	}
	
	@Override
	public int insertReview(ReviewVO reviewVo) {
		return dao.insertReview(reviewVo);
	}

	@Override
	public List<ReviewVO> productReviewList(Map<String, Object> map) {
		return dao.productReviewList(map);
	}
	
	@Override
	public List<ReviewVO> myReviewList(Map<String, Object> map) {
		return dao.myReviewList(map);
	}

	@Override
	public int deleteMyReview(int re_no) {
		return dao.deleteMyReview(re_no);
	}

	@Override
	public PageVO pageInfo(int page, String stype, String mem_id) {
		// 전체글 갯수 구하기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stype", stype);
//		map.put("sword", sword);
		map.put("mem_id", mem_id);
		int count = this.totalCount(map);
		
		// 전체 페이지 수 구하기 totalPage
		int perList = PageVO.getPerList();
		int totalPage = (int)(Math.ceil( (double)count / perList));
		
		if(page > totalPage) page = totalPage;
		
		// start, end 구하기 - page를 기준으로
		int start = (page -1 ) * perList + 1;
		int end = start + perList - 1;
		if(end > count) end = count;
		
		// startPage, endPage 구하기 - page를 기준으로
		int perPage = PageVO.getPerPage();
		int startPage = ((page-1) / perPage * perPage) + 1;
		int endPage = startPage + perPage -1;
		if(endPage > totalPage) endPage = totalPage;
		
		// pageVO에 저장
		PageVO vo = new PageVO();
		vo.setStart(start);
		vo.setEnd(end);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		
		return vo;
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		return dao.totalCount(map);
	}

	@Override
	public List<ReviewVO> selectByPage(int re_no) {
		return dao.selectByPage(re_no);
	}

	@Override
	public int modifyMyReview(ReviewVO vo) {
		return dao.modifyMyReview(vo);
	}


}
