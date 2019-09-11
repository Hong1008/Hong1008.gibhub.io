package service;

import java.util.HashMap;
import java.util.List;

import dto.ProjectDTO;

public interface ProjectService {
	public void insertProject(ProjectDTO pdto, String id);
	public List<HashMap<String, Object>> projectHomeList(String id);
	public List<Integer> proIdList(String id);
}
