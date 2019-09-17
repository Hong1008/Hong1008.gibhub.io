package mapper;

import java.util.List;

import dto.ChattingDTO;
import dto.FileDTO;

public interface ChatMapper {
	
	public void insertChat(ChattingDTO dto);
	public List<ChattingDTO> chatList(String pro_id);
	public List<ChattingDTO> dateList(String pro_id);
	public String today();
	public void chatUpLoadFile(FileDTO dto);
}
