package kr.or.ddit.vo;

public class CartListVO {
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
	
	//장바구니
	private int cart_no;
	private int cart_qty;
	private String cart_date;
	private String mem_id;
	
	//장바구니 품목 조회
	private int cartCount;
	
	
	public int getCartCount() {
		return cartCount;
	}
	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}
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
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getCart_qty() {
		return cart_qty;
	}
	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}
	public String getCart_date() {
		return cart_date;
	}
	public void setCart_date(String cart_date) {
		this.cart_date = cart_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	
}
