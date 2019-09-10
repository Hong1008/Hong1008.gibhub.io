package mapper;

import java.util.List;

import dto.ProjectDTO;

public interface ProjectMapper {
	
	public void insertProject(ProjectDTO pdto);
	public List<ProjectDTO> projectList(String mem_id);
}
