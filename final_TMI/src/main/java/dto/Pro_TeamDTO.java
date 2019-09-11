package dto;

public class Pro_TeamDTO {
	private int pro_id;
	private String id;
	private int pt_level;
	
	public Pro_TeamDTO(int pro_id, String id, int pt_level) {
		this.pro_id = pro_id;
		this.id = id;
		this.pt_level = pt_level;
	}
	public Pro_TeamDTO(String id, int pt_level) {
		// TODO Auto-generated constructor stub
		this.id = id;
		this.pt_level = pt_level;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPt_level() {
		return pt_level;
	}
	public void setPt_level(int pt_level) {
		this.pt_level = pt_level;
	}
	
	
	
}
