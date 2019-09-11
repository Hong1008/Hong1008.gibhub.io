package service;

import java.util.List;

import dto.ProjectDTO;

public interface ProjectService {
	public void insertProject(ProjectDTO pdto, String id);
	public List<ProjectDTO> projectList(String id);
	public List<Integer> proIdList(String id);
}
