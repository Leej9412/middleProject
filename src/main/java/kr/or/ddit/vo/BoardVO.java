package kr.or.ddit.vo;

public class BoardVO {
	
	private int    board_no;     ;
	private String board_title ;
	private String board_contents ;
	private String mem_id  ;
	private String board_date  ;
	private String board_hit;
	private int	   board_cat_no     ;
	private int board_report;
	
	
	

	public int getBoard_report() {
		return board_report;
	}
	public void setBoard_report(int board_report) {
		this.board_report = board_report;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_contents() {
		return board_contents;
	}
	public void setBoard_contents(String board_contents) {
		this.board_contents = board_contents;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public String getBoard_hit() {
		return board_hit;
	}
	public void setBoard_hit(String board_hit) {
		this.board_hit = board_hit;
	}
	public int getBoard_cat_no() {
		return board_cat_no;
	}
	public void setBoard_cat_no(int board_cat_no) {
		this.board_cat_no = board_cat_no;
	}


	
	
}
