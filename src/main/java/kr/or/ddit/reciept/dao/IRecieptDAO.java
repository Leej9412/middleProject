package kr.or.ddit.reciept.dao;

import kr.or.ddit.vo.RecieptVO;

public interface IRecieptDAO {

	public int insertReciept(RecieptVO recieptVO);
	
	public RecieptVO selectReciept(int payNo);
	
}
