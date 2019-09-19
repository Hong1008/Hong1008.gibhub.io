package mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import dto.Pro_TeamDTO;
import dto.ProjectDTO;
import dto.Sch_TeamDTO;
import dto.ScheduleDTO;
import dto.TodoDTO;

public interface ProjectMapper {
	
	public void firstInsertProject(ProjectDTO pdto);
	public void firstInsertProTeam(Pro_TeamDTO ptDto);
	public List<HashMap<String, Object>> projectHomeList(String id);
	public List<Integer> proIdList(String id);
	public List<String> searchIdList(String id);
	public List<ProjectDTO> calendarPro(@Param("pro_id") String pro_id,@Param("id") String id);
	public List<ScheduleDTO> calendarSch(String pro_id);
	public List<TodoDTO> calendarTodo(String sch_id);
	public ProjectDTO proSelect(String pro_id);
	public ScheduleDTO schOne(String sch_id);
	public List<ScheduleDTO> schSelect(String pro_id);
	public List<TodoDTO> tdSelect(String sch_id);
	public List<TodoDTO> tdViewSelect(String sch_id);
	public List<Pro_TeamDTO> proTeamSelect(String pro_id);
	public List<Sch_TeamDTO> schTeamSelect(String pro_id);
	public void firstInsertSchedule(ScheduleDTO sdto);
	public void firstInsertSchTeam(Sch_TeamDTO stDto);
	public void firstInsertTodo(TodoDTO tdto);
}
