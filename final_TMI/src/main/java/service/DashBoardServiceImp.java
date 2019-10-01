package service;

import java.util.HashMap;
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
	public int AlltodoProcess(String id) {
		return mapper.alltodocnt(id);
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
	public List<DashDTO> recentlistProcess(int pro_id) {
		return mapper.recentlist(pro_id);
	}

	@Override
	public List<DashDTO> commingProcess(String id) {
		return mapper.comminglist(id);
	}

	@Override
	public List<DashDTO> timelineProcess(String id) {
		return mapper.timelist(id);
	}
	
	@Override
	public void bgChange(DashDTO dto) {
		mapper.bgChange(dto);
	}

	@Override
	public String bgViewProcess(String id) {
		return mapper.bgView(id);
	}

	@Override
	public List<DashDTO> topListProcess(int pro_id) {
		return mapper.toplist(pro_id);
	}
	
	public List<DashDTO> donutgraphProcess(String id){
		return mapper.donutgraph(id);
	}
	
	@Override
	public List<DashDTO> graphProcess(HashMap<String, String> map) {
		return mapper.graphlist(map);
	}
	
}
