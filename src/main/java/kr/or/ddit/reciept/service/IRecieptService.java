package kr.or.ddit.reciept.service;

import kr.or.ddit.vo.RecieptVO;

public interface IRecieptService {
	
	public int insertReciept(RecieptVO recieptVO);
	
	public RecieptVO selectReciept(int payNo);
	
}
