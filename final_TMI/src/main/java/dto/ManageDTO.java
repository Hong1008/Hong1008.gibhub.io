package dto;

import java.sql.Date;

public class ManageDTO {
	private String pro_id, pro_name, pro_info;
	private Date pro_start, pro_end, pro_rend;

	private String mem_id, mem_pwd, mem_email, mem_ip, mem_grade, mem_uuid, mem_name, mem_bg_style, mem_theme, mem_icon;

	private int pt_level;

	public ManageDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getPro_id() {
		return pro_id;
	}

	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getPro_info() {
		return pro_info;
	}

	public void setPro_info(String pro_info) {
		this.pro_info = pro_info;
	}

	public Date getPro_start() {
		return pro_start;
	}

	public void setPro_start(Date pro_start) {
		this.pro_start = pro_start;
	}

	public Date getPro_end() {
		return pro_end;
	}

	public void setPro_end(Date pro_end) {
		this.pro_end = pro_end;
	}

	public Date getPro_rend() {
		return pro_rend;
	}

	public void setPro_rend(Date pro_rend) {
		this.pro_rend = pro_rend;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pwd() {
		return mem_pwd;
	}

	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_ip() {
		return mem_ip;
	}

	public void setMem_ip(String mem_ip) {
		this.mem_ip = mem_ip;
	}

	public String getMem_grade() {
		return mem_grade;
	}

	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
	}

	public String getMem_uuid() {
		return mem_uuid;
	}

	public void setMem_uuid(String mem_uuid) {
		this.mem_uuid = mem_uuid;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_bg_style() {
		return mem_bg_style;
	}

	public void setMem_bg_style(String mem_bg_style) {
		this.mem_bg_style = mem_bg_style;
	}

	public String getMem_theme() {
		return mem_theme;
	}

	public void setMem_theme(String mem_theme) {
		this.mem_theme = mem_theme;
	}

	public String getMem_icon() {
		return mem_icon;
	}

	public void setMem_icon(String mem_icon) {
		this.mem_icon = mem_icon;
	}

	public int getPt_level() {
		return pt_level;
	}

	public void setPt_level(int pt_level) {
		this.pt_level = pt_level;
	}

}
