package mapper;

import java.util.List;

import dto.Pro_TeamDTO;
import dto.ProjectDTO;

public interface ProjectMapper {
	
	public void insertProject(ProjectDTO pdto);
	public void insertProTeam(Pro_TeamDTO ptDto);
	public List<ProjectDTO> projectList(String id);
	public List<Integer> proIdList(String id);
}
