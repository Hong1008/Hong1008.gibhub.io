package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dto.Pro_TeamDTO;
import dto.ProjectDTO;
import lombok.extern.log4j.Log4j2;
import mapper.ProjectMapper;

@Service
public class ProjectServiceImp implements ProjectService{
	@Autowired
	private ProjectMapper mapper;
	
	@Transactional
	@Override
	public void insertProject(ProjectDTO pdto, String id) {
		// TODO Auto-generated method stub
		try {
			mapper.insertProject(pdto);
			mapper.insertProTeam(new Pro_TeamDTO(id, 1));
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	@Override
	public List<HashMap<String, Object>> projectHomeList(String id) {
		// TODO Auto-generated method stub
		return mapper.projectHomeList(id);
	}
	
	@Override
	public List<Integer> proIdList(String id) {
		// TODO Auto-generated method stub
		return mapper.proIdList(id);
	}
}
