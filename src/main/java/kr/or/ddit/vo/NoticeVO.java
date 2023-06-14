package kr.or.ddit.vo;

public class NoticeVO {
	private int  notice_no;
	private String  notice_title;
	private String  notice_contents;
	private String  notice_password;
	private String  notice_create_date;
	private String  manager_id;
	
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_contents() {
		return notice_contents;
	}
	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
	}
	public String getNotice_password() {
		return notice_password;
	}
	public void setNotice_password(String notice_password) {
		this.notice_password = notice_password;
	}
	public String getNotice_create_date() {
		return notice_create_date;
	}
	public void setNotice_create_date(String notice_create_date) {
		this.notice_create_date = notice_create_date;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	
	
}
