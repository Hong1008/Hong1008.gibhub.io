package mapper;

import java.util.HashMap;
import java.util.List;

import dto.Pro_TeamDTO;
import dto.ProjectDTO;

public interface ProjectMapper {
	
	public void insertProject(ProjectDTO pdto);
	public void insertProTeam(Pro_TeamDTO ptDto);
	public List<HashMap<String, Object>> projectHomeList(String id);
	public List<Integer> proIdList(String id);
	public List<String> searchIdList(String id);
}
