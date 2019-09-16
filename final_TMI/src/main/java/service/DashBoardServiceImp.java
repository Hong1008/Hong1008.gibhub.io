package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.DashDTO;
import mapper.DashBoardMapper;

@Service
public class DashBoardServiceImp implements DashBoardService{

	
	@Autowired
	private DashBoardMapper mapper;
	
	public DashBoardServiceImp() {
	}
	
	@Override
	public int pjcntProcess(String id) {
		return mapper.pjcnt(id);
	}

	@Override
	public int AllschProcess(String id) {
		return mapper.allschcnt(id);
	}

	@Override
	public int remaincntProcess(String id) {
		return mapper.remaincnt(id);
	}

	@Override
	public int completecntProcess(String id) {
		return mapper.compcnt(id);
	}

	@Override
	public List<DashDTO> recentlistProcess(String alldata) {
		return mapper.recentlist(alldata);
	}

	@Override
	public List<DashDTO> commingProcess(String alldata) {

		return mapper.comminglist(alldata);
	}

	@Override
	public List<DashDTO> timelineProcess(String alldata) {
		return mapper.timelist(alldata);
	}

}
