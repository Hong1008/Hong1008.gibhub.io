package service;

import java.util.List;

import dto.ChattingDTO;
import dto.FileDTO;

public interface ChatService {
	public void insertchat(ChattingDTO dto);
	public List<ChattingDTO> chatList(String pro_id);
	public List<ChattingDTO> dateList(String pro_id);
	public String today();
	public void chatUpLoadFile(FileDTO dto);
}
