package mapper;

import java.util.List;

import dto.ManageDTO;

public interface ManageMapper {
	public List<ManageDTO> pj_people(String pro_id);
	
	public ManageDTO pj_content(String pro_id);
	
	public void pj_content_upt(ManageDTO dto);
}
