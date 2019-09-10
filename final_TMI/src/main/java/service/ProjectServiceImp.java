package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dto.ProjectDTO;
import mapper.ProjectMapper;

@Service
public class ProjectServiceImp implements ProjectService{
	@Autowired
	private ProjectMapper mapper;
	
	@Override
	public void insertProject(ProjectDTO pdto) {
		// TODO Auto-generated method stub
		mapper.insertProject(pdto);
	}
	
	@Override
	public List<ProjectDTO> projectList(String mem_id) {
		// TODO Auto-generated method stub
		return mapper.projectList(mem_id);
	}
	
}
