package mapper;

import java.util.List;

import dto.DashDTO;

public interface DashBoardMapper {
	
	public int pjcnt(String id);
	
	public int alltodocnt(String id);
	
	public int remaincnt(int pro_id);
	
	public int compcnt(int pro_id);
	
	
	
	//top5 List
	public List<DashDTO> toplist(int pro_id);
	
	//최근일정 목록
	public List<DashDTO> recentlist(int pro_id);
	//다가오는 일정 목록
	public List<DashDTO> comminglist(int pro_id);
	//타임라인 
	public List<DashDTO> timelist(String id);
	
	public String bgView(String id);
	
	public void bgChange(DashDTO DTO);
	
}
