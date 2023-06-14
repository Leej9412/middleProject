package kr.or.ddit.vo;

public class ShopBoardRepliesVO {
	private int  board_reply_no;
	private String  board_reply_contents;
	private String  reply_create_date;
	private String  manager_id;
	private int  board_no;
	
	public int getBoard_reply_no() {
		return board_reply_no;
	}
	public void setBoard_reply_no(int board_reply_no) {
		this.board_reply_no = board_reply_no;
	}
	public String getBoard_reply_contents() {
		return board_reply_contents;
	}
	public void setBoard_reply_contents(String board_reply_contents) {
		this.board_reply_contents = board_reply_contents;
	}
	public String getReply_create_date() {
		return reply_create_date;
	}
	public void setReply_create_date(String reply_create_date) {
		this.reply_create_date = reply_create_date;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	
	
}
