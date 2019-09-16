package mapper;

import java.util.List;

import dto.ChattingDTO;

public interface ChatMapper {
	
	public void insertChat(ChattingDTO dto);
	public List<ChattingDTO> chatList(String pro_id);

}
