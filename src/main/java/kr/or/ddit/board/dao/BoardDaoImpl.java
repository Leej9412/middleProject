package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.util.SqlMapClientFactory;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.ReplyVO;


public class BoardDaoImpl implements IBoardDao {
	
	private SqlMapClient client;
	private static IBoardDao dao;
	
	private BoardDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IBoardDao getDao() {
		if(dao == null) dao = new BoardDaoImpl();
		
		return dao;
	}

	@Override
	public List<BoardVO> selectByPage(Map<String, Object> map) {
	      List<BoardVO> list = null;
	      try {
	         list = client.queryForList("board.selectByPage", map);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      
	      return list;

	}

	@Override
	public int deleteBoard(int num) {
		int res = 0;
		try {
			res = (int) client.delete("board.deleteBoard", num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int modifyBoard(BoardVO vo) {
		int res = 0;
		try {
			res = (int) client.update("board.modifyBoard", vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insertBoard(BoardVO vo) {
	      int res = 0;
	      try {
	         res =  (int) client.insert("board.insertBoard", vo);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return res;
	   }


	@Override
	public int totalCount(Map<String, Object> map) {
		int res = 0;
		try {
			res = (int) client.queryForObject("board.totalCount", map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int updateHit(int num) {
		int res = 0;
		try {
			res = (int) client.update("board.updateHit", num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	

	@Override
	public int insertReply(ReplyVO vo) {
		int res = 0;
		try {
			res = (int) client.insert("reply.insertReply",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int modifyReply(ReplyVO vo) {
		int res = 0;
		try {
			res = (int) client.update("reply.modifyReply",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deleteReply(int renum) {
		int res = 0;
		try {
			res = (int) client.delete("reply.deleteReply", renum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<ReplyVO> selectReply(int bonum) {
		List<ReplyVO> list = null;
		try {
			list = client.queryForList("reply.selectReply", bonum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BoardVO seletContent(int num) {
		BoardVO vo = null;
		
		try {
			vo = (BoardVO) client.queryForObject("board.seletContent",num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public int selectboardcat(int catval) {
		int res = 0;
		
		try {
			res = (int) client.queryForObject("board.selectboardcat", catval);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int boardreport(int num) {
		int res = 0;
		try {
			res= client.update("board.boardreport", num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<BoardVO> BoardReportList(Map<String, Object> map) {
		List<BoardVO> list = null;
		try {
			list = client.queryForList("board.BoardReportList", map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int BoardReportTotalCount(Map<String, Object> map) {
		int res = 0;
		try {
			res = (int) client.queryForObject("board.BoardReportTotalCount", map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return res;
	}



}
