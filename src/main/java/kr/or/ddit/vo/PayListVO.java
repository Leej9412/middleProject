package kr.or.ddit.vo;

public class PayListVO {
	//상품카테고리
	private String p_cat_no;
	private String p_cat_name;
	
	//상품
	private int p_id;
	private String p_name;
	private int p_price;
	private String p_detail;
	private int p_qty;
	private String p_size;
	private int p_mileage;
	private String p_date;
	private long file_size;
	
	//상품이미지
	private int img_no;
	private String img_path;
	
	//결제창
	private int pay_no;
	private int pay_total;
	private int pay_status;
	private String pay_date;
	
	//상품_선택
	private String ps_date;
	private int ps_qty;
	private int ps_cost;
	
	public String getP_cat_no() {
		return p_cat_no;
	}
	public void setP_cat_no(String p_cat_no) {
		this.p_cat_no = p_cat_no;
	}
	public String getP_cat_name() {
		return p_cat_name;
	}
	public void setP_cat_name(String p_cat_name) {
		this.p_cat_name = p_cat_name;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_detail() {
		return p_detail;
	}
	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}
	public int getP_qty() {
		return p_qty;
	}
	public void setP_qty(int p_qty) {
		this.p_qty = p_qty;
	}
	public String getP_size() {
		return p_size;
	}
	public void setP_size(String p_size) {
		this.p_size = p_size;
	}
	public int getP_mileage() {
		return p_mileage;
	}
	public void setP_mileage(int p_mileage) {
		this.p_mileage = p_mileage;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public long getFile_size() {
		return file_size;
	}
	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}
	public int getImg_no() {
		return img_no;
	}
	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	public int getPay_total() {
		return pay_total;
	}
	public void setPay_total(int pay_total) {
		this.pay_total = pay_total;
	}
	public int getPay_status() {
		return pay_status;
	}
	public void setPay_status(int pay_status) {
		this.pay_status = pay_status;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
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
	
}
