package service;

import java.util.List;

import dto.ManageDTO;

public interface ManageService {
	public List<ManageDTO> managePeopleProcess(String pro_id);
	
	public ManageDTO manageContentProcess(String pro_id);
	
	public void manageContentUpdateProcess(ManageDTO dto);
	
}
