package kr.or.ddit.board.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.ReplyVO;




public interface IBoardDao {
	
	public int boardreport(int num);
	
	public int selectboardcat (int catval);
	
	// 글 리스트 - 글내용보기(아코디언형식) - 조건에 따라서
	public List<BoardVO> selectByPage(Map<String, Object> map);
	
	public List<BoardVO> BoardReportList(Map<String, Object> map);
	
	// 글 삭제
	public int deleteBoard(int num);
	
	// 글 수정
	public int modifyBoard(BoardVO vo);
	
	// 글 쓰기 -  저장 후 num을 리턴
	public int insertBoard(BoardVO vo);
	
	// 글 전체 갯수 구하기 - 조건에 따라서
	public int totalCount(Map<String, Object> map);
	
	
	public int BoardReportTotalCount(Map<String, Object> map);
	
	public BoardVO seletContent(int num);
	
	// 조회수 증가 - update
	public int updateHit(int num);
	
	// 댓글 등록 - 댓글번호(renum)
	public int insertReply(ReplyVO vo);
	
	// 댓글 수정
	public int modifyReply(ReplyVO vo);
	
	// 댓글 삭제
	public int deleteReply(int renum);
	
	// 댓글 리스트
	public List<ReplyVO> selectReply(int bonum);
}
