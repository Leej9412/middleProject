package kr.or.ddit.vo;

public class ReplyVO {
	private int	   board_no ;
	private int    board_reply_no;
	private String board_reply_contents  ;
	private String reply_date  ;
	private String reply_name ;
	
	
	public String getReply_name() {
		return reply_name;
	}
	public void setReply_name(String reply_name) {
		this.reply_name = reply_name;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
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
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	
	
	
	
	
}
