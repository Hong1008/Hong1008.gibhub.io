package service;

import java.util.List;

import dto.ChattingDTO;

public interface ChatService {
	public void insertchat(ChattingDTO dto);
	public List<ChattingDTO> chatList(String pro_id);
}
