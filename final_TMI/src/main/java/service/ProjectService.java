package service;

import java.util.HashMap;
import java.util.List;

import dto.Pro_TeamDTO;
import dto.ProjectDTO;
import dto.Sch_TeamDTO;

public interface ProjectService {
	public void insertProject(ProjectDTO pdto, String id, List<String> pro_team_list);
	public List<HashMap<String, Object>> projectHomeList(String id);
	public List<Integer> proIdList(String id);
	public List<String> searchIdList(String id);
	public List<ProjectDTO> calendarPro(String pro_id, String id);
	public ProjectDTO proSelect(String pro_id);
	public List<Pro_TeamDTO> proTeamSelect(String pro_id);
	public List<Sch_TeamDTO> schTeamSelect(String pro_id);
}
