package kr.or.ddit.member.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.util.SqlMapClientFactory;
import kr.or.ddit.vo.MemberVO;

public class MemberDaoImpl implements IMemberDao {
	private SqlMapClient smc;
	private static IMemberDao dao;
	
	private MemberDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	public static IMemberDao getInstance() {
		if(dao == null) dao = new MemberDaoImpl();
		return dao;
	}

	@Override
	public int insertMember(MemberVO memVo) {
		int cnt = 0;
		
		try {
			Object obj = smc.insert("member.insertMember", memVo);
			if(obj == null) cnt = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	@Override
	public MemberVO loginCheck(MemberVO memVo) {
		MemberVO vo = null;
		try {
			vo = (MemberVO) smc.queryForObject("member.loginCheck", memVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	@Override
	public MemberVO getMember(String memId) {
		MemberVO memVo = null;
		
		try {
			memVo = (MemberVO) smc.queryForObject("member.getMember", memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memVo;
	}
	@Override
	public MemberVO identityVerification(MemberVO memVo) {
		MemberVO mVo = null;
		
		try {
			mVo = (MemberVO) smc.queryForObject("member.identityVerification", memVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mVo;
	}
	@Override
	public int changePassword(MemberVO memVo) {
		int cnt = 0;
		try {
			cnt = smc.update("member.changePassword", memVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public String findId(MemberVO memVo) {
		String memId = "";
		try {
			memId = (String) smc.queryForObject("member.findId", memVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memId;
	}
	@Override
	public int modifyInformation(MemberVO memVo) {
		int cnt = 0;
		try {
			cnt = smc.update("member.modifyInformation", memVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int deleteAccount(String memId) {
		int cnt = 0;
		try {
			cnt = smc.delete("member.deleteAccount", memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
