package service;

import java.util.List;

import dto.DashDTO;

public interface DashBoardService {
	
	public int pjcntProcess(String id);
	
	public int AlltodoProcess(String id);
	
	public int remaincntProcess(int pro_id);
	
	public int completecntProcess(int pro_id);
	
	//최근일정 목록
	public List<DashDTO> recentlistProcess(int pro_id);
	//다가오는 일정 목록
	public List<DashDTO> commingProcess(int pro_id);
	//타임라인
	public List<DashDTO> timelineProcess(int pro_id);
	
	
	
}