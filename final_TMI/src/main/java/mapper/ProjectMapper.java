package mapper;

import java.util.HashMap;
import java.util.List;

import dto.Pro_TeamDTO;
import dto.ProjectDTO;

public interface ProjectMapper {
	
	public void firstInsertProject(ProjectDTO pdto);
	public void firstInsertProTeam(Pro_TeamDTO ptDto);
	public List<HashMap<String, Object>> projectHomeList(String id);
	public List<Integer> proIdList(String id);
	public List<String> searchIdList(String id);
}
