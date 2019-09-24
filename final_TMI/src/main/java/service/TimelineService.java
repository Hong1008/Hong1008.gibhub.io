package service;

import java.util.List;

import dto.TimelineDTO;

public interface TimelineService {
	public List<TimelineDTO> timeList(String pro_id);
}

