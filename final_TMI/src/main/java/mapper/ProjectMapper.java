package mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import dto.Pro_TeamDTO;
import dto.ProjectDTO;
import dto.Sch_TeamDTO;

public interface ProjectMapper {
	
	public void firstInsertProject(ProjectDTO pdto);
	public void firstInsertProTeam(Pro_TeamDTO ptDto);
	public List<HashMap<String, Object>> projectHomeList(String id);
	public List<Integer> proIdList(String id);
	public List<String> searchIdList(String id);
	public List<ProjectDTO> calendarPro(@Param("pro_id") String pro_id,@Param("id") String id);
	public ProjectDTO proSelect(String pro_id);
	public List<Pro_TeamDTO> proTeamSelect(String pro_id);
	public List<Sch_TeamDTO> schTeamSelect(String pro_id);
}
