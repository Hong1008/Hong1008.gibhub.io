package mapper;

import java.util.List;

import dto.DashDTO;

public interface DashBoardMapper {
	
	public int pjcnt(String id);
	
	public int allschcnt(String id);
	
	public int remaincnt(String id);
	
	public int compcnt(String id);
	
	//최근일정 목록
	public List<DashDTO> recentlist(String alldata);
	//다가오는 일정 목록
	public List<DashDTO> comminglist(String alldata);
	//타임라인 
	public List<DashDTO> timelist(String alldata);
	
}
