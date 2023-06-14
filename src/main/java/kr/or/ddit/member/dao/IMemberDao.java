package kr.or.ddit.member.dao;

import kr.or.ddit.vo.MemberVO;

public interface IMemberDao {
	/**
	 * 회원을 insert하는 메서드
	 * @param memVo insert할 회원의 데이터가 저장된 MemberVO 객체 
	 * @return 작업성공 1, 실패 0
	 */
	public int insertMember(MemberVO memVo);
	
	public MemberVO loginCheck(MemberVO memVo);
	
	public MemberVO getMember(String memId);
	
	public MemberVO identityVerification(MemberVO memVo);
	
	public int changePassword(MemberVO memVo);
	
	public String findId(MemberVO memVo);
	
	public int modifyInformation(MemberVO memVo);
	
	public int deleteAccount(String memId);
	

}
