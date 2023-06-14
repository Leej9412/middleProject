package kr.or.ddit.vo;

public class RecieptVO {
	private int rec_no;
	private String rec_date;
	private int rec_total;
	private int pay_no;
	private String rec_tid;
	public int getRec_no() {
		return rec_no;
	}
	public void setRec_no(int rec_no) {
		this.rec_no = rec_no;
	}
	public String getRec_date() {
		return rec_date;
	}
	public void setRec_date(String rec_date) {
		this.rec_date = rec_date;
	}
	public int getRec_total() {
		return rec_total;
	}
	public void setRec_total(int rec_total) {
		this.rec_total = rec_total;
	}
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	public String getRec_tid() {
		return rec_tid;
	}
	public void setRec_tid(String rec_tid) {
		this.rec_tid = rec_tid;
	}
	
}
