package service;

import java.util.HashMap;
import java.util.List;

import dto.ProjectDTO;

public interface ProjectService {
	public void insertProject(ProjectDTO pdto, String id, List<String> pro_team_list);
	public List<HashMap<String, Object>> projectHomeList(String id);
	public List<Integer> proIdList(String id);
	public List<String> searchIdList(String id);
	public List<ProjectDTO> calendarPro(String pro_id, String id);
}
