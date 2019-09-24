package mapper;

import java.util.List;

import dto.TimelineDTO;

public interface TimelineMapper {
	public List<TimelineDTO> timeList(String pro_id);
}
