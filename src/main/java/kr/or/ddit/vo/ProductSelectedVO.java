package kr.or.ddit.vo;

public class ProductSelectedVO {
	private String ps_date;
	private int ps_qty;
	private int ps_cost;
	private int p_id;
	private int pay_no;
	public String getPs_date() {
		return ps_date;
	}
	public void setPs_date(String ps_date) {
		this.ps_date = ps_date;
	}
	public int getPs_qty() {
		return ps_qty;
	}
	public void setPs_qty(int ps_qty) {
		this.ps_qty = ps_qty;
	}
	public int getPs_cost() {
		return ps_cost;
	}
	public void setPs_cost(int ps_cost) {
		this.ps_cost = ps_cost;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
}
