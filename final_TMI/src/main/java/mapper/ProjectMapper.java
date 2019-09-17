package mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import dto.Pro_TeamDTO;
import dto.ProjectDTO;

public interface ProjectMapper {
	
	public void firstInsertProject(ProjectDTO pdto);
	public void firstInsertProTeam(Pro_TeamDTO ptDto);
	public List<HashMap<String, Object>> projectHomeList(String id);
	public List<Integer> proIdList(String id);
	public List<String> searchIdList(String id);
	public List<ProjectDTO> calendarPro(@Param("pro_id") String pro_id,@Param("id") String id);
}
