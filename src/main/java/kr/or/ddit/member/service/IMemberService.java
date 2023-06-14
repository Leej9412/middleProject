package kr.or.ddit.member.service;

import kr.or.ddit.vo.MemberVO;

public interface IMemberService {
	
	public int insertMember(MemberVO memVo);
	
	public MemberVO loginCheck(MemberVO memVo);
	
	public MemberVO getMember(String memId);
	
	public MemberVO identityVerification(MemberVO memVo);
	
	public int changePassword(MemberVO memVo);
	
	public String findId(MemberVO memVo);
	
	public int modifyInformation(MemberVO memVo);
	
	public int deleteAccount(String memId);

}
