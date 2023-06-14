package kr.or.ddit.vo;

public class ShopQuestionBoardsVO {
	private int  board_no;
	private String  board_type;
	private String  board_title;
	private String  board_contents;
	private int  board_is_answered;
	private String  board_create_date;
	private String  mem_id;
	
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
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
	public int getBoard_is_answered() {
		return board_is_answered;
	}
	public void setBoard_is_answered(int board_is_answered) {
		this.board_is_answered = board_is_answered;
	}
	public String getBoard_create_date() {
		return board_create_date;
	}
	public void setBoard_create_date(String board_create_date) {
		this.board_create_date = board_create_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
}
