package kr.or.ddit.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PageVO;
import kr.or.ddit.vo.ReplyVO;



public class BoardServiceImpl implements IBoardService {
	
	private IBoardDao dao;
	private static IBoardService service;
	
	private BoardServiceImpl() {
		dao = BoardDaoImpl.getDao();
	}
	public static IBoardService getService() {
		if(service == null) service = new BoardServiceImpl();
		
		return service;
	}

	@Override
	public List<BoardVO> selectByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectByPage(map);
	}

	@Override
	public int deleteBoard(int num) {
		// TODO Auto-generated method stub
		return dao.deleteBoard(num);
	}

	@Override
	public int modifyBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.modifyBoard(vo);
	}

	@Override
	public int insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.insertBoard(vo);
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.totalCount(map);
	}

	@Override
	public int updateHit(int num) {
		// TODO Auto-generated method stub
		return dao.updateHit(num);
	}

	@Override
	public int insertReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return dao.insertReply(vo);
	}

	@Override
	public int modifyReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return dao.modifyReply(vo);
	}

	@Override
	public int deleteReply(int renum) {
		// TODO Auto-generated method stub
		return dao.deleteReply(renum);
	}

	
	@Override
	public PageVO pageInfo(int page, String stype, String sword, int catval) {
		
		//전체 글 갯수 구하기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stype", stype);
		map.put("sword", sword);
		map.put("catval", catval);

		
		int count = this.totalCount(map);
		
		//전체 페이지 수 구하기 - totalPage
		int perList = PageVO.getPerList();
		int totalPage = (int)( Math.ceil( (double)count / perList ) );
		
		//page가 8마지망이었는데 글이모두 지워져서 8이 사라진경우
		//page번호를 7로 수정
		if(page > totalPage) page = totalPage;
		
		//start, end구하기 - page 를 기준으로
		int start = (page-1) * PageVO.getPerList() + 1;
		int end = start + PageVO.getPerList() - 1;
		if( end > count ) end = count;
		
		//startPage, endPage 구하기 - page를 기준으로
		int perPage = PageVO.getPerPage();
		int startPage = ( (page-1) / perPage * perPage ) + 1;
		int endPage = startPage + perPage - 1;
		if(endPage > totalPage) endPage = totalPage;
		
		//PageVo에 저장
		PageVO vo = new PageVO();
		vo.setStart(start);
		vo.setEnd(end);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		
		
		return vo;
	}
	
	@Override
	public PageVO pageInfo2(int page, String stype, String sword) {
		
		//전체 글 갯수 구하기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stype", stype);
		map.put("sword", sword);
		map.put("board_report", 0);
		
		int count = this.BoardReportTotalCount(map);
		
		//전체 페이지 수 구하기 - totalPage
		int perList = PageVO.getPerList();
		int totalPage = (int)( Math.ceil( (double)count / perList ) );
		
		//page가 8마지망이었는데 글이모두 지워져서 8이 사라진경우
		//page번호를 7로 수정
		if(page > totalPage) page = totalPage;
		
		//start, end구하기 - page 를 기준으로
		int start = (page-1) * PageVO.getPerList() + 1;
		int end = start + PageVO.getPerList() - 1;
		if( end > count ) end = count;
		
		//startPage, endPage 구하기 - page를 기준으로
		int perPage = PageVO.getPerPage();
		int startPage = ( (page-1) / perPage * perPage ) + 1;
		int endPage = startPage + perPage - 1;
		if(endPage > totalPage) endPage = totalPage;
		
		//PageVo에 저장
		PageVO vo = new PageVO();
		vo.setStart(start);
		vo.setEnd(end);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		
		return vo;
	}
	
	@Override
	public List<ReplyVO> selectReply(int bonum) {

		return dao.selectReply(bonum);
	}
	@Override
	public BoardVO seletContent(int num) {
		// TODO Auto-generated method stub
		return dao.seletContent(num);
	}
	@Override
	public int selectboardcat(int catval) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int boardreport(int num) {
		// TODO Auto-generated method stub
		return dao.boardreport(num);
	}
	@Override
	public List<BoardVO> BoardReportList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.BoardReportList(map);
	}
	@Override
	public int BoardReportTotalCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.BoardReportTotalCount(map);
	}

}
