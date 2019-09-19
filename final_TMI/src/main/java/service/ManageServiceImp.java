package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.ManageDTO;
import mapper.ManageMapper;

@Service
public class ManageServiceImp implements ManageService{
	@Autowired
	private ManageMapper mapper;

	@Override
	public List<ManageDTO> managePeopleProcess(String pro_id) {
		return mapper.pj_people(pro_id);
	}

	@Override
	public ManageDTO manageContentProcess(String pro_id) {
		return mapper.pj_content(pro_id);
	}

	@Override
	public void manageContentUpdateProcess(ManageDTO dto) {
		mapper.pj_content_upt(dto);
	}

	@Override
	public void managerResetProcess(String pro_id) {
		mapper.managerReset(pro_id);
	}

	@Override
	public void managerChangeProcess(ManageDTO dto) {
		mapper.managerChange(dto);
	}

	@Override
	public void managerProcess(ManageDTO dto) {
		mapper.manager(dto);
	}
	
}
