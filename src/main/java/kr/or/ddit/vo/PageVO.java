package kr.or.ddit.vo;

	public class PageVO {
		
		private int start; //출력 시작 번호
		private int end;   //출력 끝 번호
		
		private int startPage; //출력페이지 시작번호
		private int endPage;   //출력페이지 끝번호
		private int totalPage; //총 페이지 수
		
		private static int perList = 6;  //한 화면에 출력할 글 수
		private static int perPage = 2;  //한 화면에 출력한 페이지수
		
	
		
		
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public static int getPerList() {
		return perList;
	}
	public static void setPerList(int perList) {
		PageVO.perList = perList;
	}
	public static int getPerPage() {
		return perPage;
	}
	public static void setPerPage(int perPage) {
		PageVO.perPage = perPage;
	}
	
	
}
