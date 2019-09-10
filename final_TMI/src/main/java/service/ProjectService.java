package service;

import java.util.List;

import dto.ProjectDTO;

public interface ProjectService {
	public void insertProject(ProjectDTO pdto);
	public List<ProjectDTO> projectList(String mem_id);
}
