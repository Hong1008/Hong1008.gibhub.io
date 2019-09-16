package dto;

public class DashDTO {
	private int pjcnt; // pj count용
	private int tdcnt; // 일정 count용
	private int remaincnt; //남은 업무 cnt
	private int complecnt; //완료 업무 cnt
	private String timeline; // timeline 글
	private String todaysch; //금일&다가올일정
	private String recentsch; //최근일정
	
	
	public int getPjcnt() {
		return pjcnt;
	}
	public void setPjcnt(int pjcnt) {
		this.pjcnt = pjcnt;
	}
	public int getTdcnt() {
		return tdcnt;
	}
	public void setTdcnt(int tdcnt) {
		this.tdcnt = tdcnt;
	}
	public int getRemaincnt() {
		return remaincnt;
	}
	public void setRemaincnt(int remaincnt) {
		this.remaincnt = remaincnt;
	}
	public int getComplecnt() {
		return complecnt;
	}
	public void setComplecnt(int complecnt) {
		this.complecnt = complecnt;
	}
	public String getTimeline() {
		return timeline;
	}
	public void setTimeline(String timeline) {
		this.timeline = timeline;
	}
	public String getTodaysch() {
		return todaysch;
	}
	public void setTodaysch(String todaysch) {
		this.todaysch = todaysch;
	}
	public String getRecentsch() {
		return recentsch;
	}
	public void setRecentsch(String recentsch) {
		this.recentsch = recentsch;
	}
	
	
	
}
