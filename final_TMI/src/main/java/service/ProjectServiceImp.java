package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dto.Pro_TeamDTO;
import dto.ProjectDTO;
import dto.Sch_TeamDTO;
import lombok.extern.log4j.Log4j2;
import mapper.ProjectMapper;

@Service
public class ProjectServiceImp implements ProjectService{
	@Autowired
	private ProjectMapper mapper;
	
	@Transactional
	@Override
	public void insertProject(ProjectDTO pdto, String id, List<String> pro_team_list) {
		// TODO Auto-generated method stub
		Pro_TeamDTO ptDto = new Pro_TeamDTO();
		try {
			pdto.setPro_mgr(id);
			mapper.firstInsertProject(pdto);
			
			ptDto.setId(id);
			ptDto.setPt_level(1);
			mapper.firstInsertProTeam(ptDto);
			for (String string : pro_team_list) {
				ptDto.setId(string);
				ptDto.setPt_level(0);
				mapper.firstInsertProTeam(ptDto);
			}
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

	@Override
	public List<String> searchIdList(String id) {
		// TODO Auto-generated method stub
		return mapper.searchIdList(id);
	}
	
	@Override
	public List<ProjectDTO> calendarPro(String pro_id, String id) {
		// TODO Auto-generated method stub
		return mapper.calendarPro(pro_id, id);
	}
	
	@Override
	public ProjectDTO proSelect(String pro_id) {
		// TODO Auto-generated method stub
		return mapper.proSelect(pro_id);
	}
	
	@Override
	public List<Pro_TeamDTO> proTeamSelect(String pro_id) {
		// TODO Auto-generated method stub
		return mapper.proTeamSelect(pro_id);
	}
	
	@Override
	public List<Sch_TeamDTO> schTeamSelect(String pro_id) {
		// TODO Auto-generated method stub
		return mapper.schTeamSelect(pro_id);
	}
}
