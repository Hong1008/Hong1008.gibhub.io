package dto;

public class DashDTO {
	private String tl_info; // timeline 글
	private String tl_id; // timeline_id	
	private String sch_info; //다가올일정&최근일정
	private String sch_id; //다가올일정_id & 최근일정_id
	private String sch_name; //일정 이름
	private String id; //작성자
	private String sch_start; //일정 시작일  
	private String sch_end; //일정 마감일 
	private String bgsel; //background color pick
	private int total; //top5 list 

	
	public DashDTO() {
	}
	
	
	
	
	
	public String getSch_start() {
		return sch_start;
	}



	public void setSch_start(String sch_start) {
		this.sch_start = sch_start;
	}


	public String getSch_end() {
		return sch_end;
	}





	public void setSch_end(String sch_end) {
		this.sch_end = sch_end;
	}





	public int getTotal() {
		return total;
	}



	public void setTotal(int total) {
		this.total = total;
	}



	public String getTl_info() {
		return tl_info;
	}

	public void setTl_info(String tl_info) {
		this.tl_info = tl_info;
	}

	public String getTl_id() {
		return tl_id;
	}

	public void setTl_id(String tl_id) {
		this.tl_id = tl_id;
	}

	public String getSch_info() {
		return sch_info;
	}

	public void setSch_info(String sch_info) {
		this.sch_info = sch_info;
	}

	public String getSch_id() {
		return sch_id;
	}

	public void setSch_id(String sch_id) {
		this.sch_id = sch_id;
	}

	public String getSch_name() {
		return sch_name;
	}

	public void setSch_name(String sch_name) {
		this.sch_name = sch_name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBgsel() {
		return bgsel;
	}

	public void setBgsel(String bgsel) {
		this.bgsel = bgsel;
	}
	
	
	
	
	
}
