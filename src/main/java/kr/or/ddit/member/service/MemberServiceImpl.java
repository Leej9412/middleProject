package kr.or.ddit.member.service;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {
	private IMemberDao dao;
	private static IMemberService service;
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	}
	public static IMemberService getInstance() {
		if(service == null) service = new MemberServiceImpl();
		return service;
	}

	@Override
	public int insertMember(MemberVO memVo) {
		return dao.insertMember(memVo);
	}
	@Override
	public MemberVO loginCheck(MemberVO memVo) {
		return dao.loginCheck(memVo);
	}
	@Override
	public MemberVO getMember(String memId) {
		return dao.getMember(memId);
	}
	@Override
	public MemberVO identityVerification(MemberVO memVo) {
		return dao.identityVerification(memVo);
	}
	@Override
	public int changePassword(MemberVO memVo) {
		return dao.changePassword(memVo);
	}
	@Override
	public String findId(MemberVO memVo) {
		return dao.findId(memVo);
	}
	@Override
	public int modifyInformation(MemberVO memVo) {
		return dao.modifyInformation(memVo);
	}
	@Override
	public int deleteAccount(String memId) {
		return dao.deleteAccount(memId);
	}

}
