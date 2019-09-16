package service;

import java.util.List;

import dto.DashDTO;

public interface DashBoardService {
	
	public int pjcntProcess(String id);
	
	public int AllschProcess(String id);
	
	public int remaincntProcess(String id);
	
	public int completecntProcess(String id);
	
	//최근일정 목록
	public List<DashDTO> recentlistProcess(String alldata);
	//다가오는 일정 목록
	public List<DashDTO> commingProcess(String alldata);
	//타임라인
	public List<DashDTO> timelineProcess(String alldata);
	
	
	
}
