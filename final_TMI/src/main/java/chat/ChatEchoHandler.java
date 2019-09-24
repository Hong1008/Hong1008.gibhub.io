package chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import dto.ChattingDTO;
import service.ChatService;

public class ChatEchoHandler extends TextWebSocketHandler {
	@Autowired
	private ChatService chatservice;
	ChattingDTO dto= new ChattingDTO();
	private List<WebSocketSession> usersInfo = new ArrayList<>();// 유저정보 넣는 리스트
	private Map<WebSocketSession, String> roomList = new HashMap<>();// 방정보 받는 리스트

	@Override
	// 연결시
	// 테스트
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		usersInfo.add(session);
		System.out.println(session + ": 웹소켓접속");
		
		Map<String, Object> httpSession = session.getAttributes();
		String roomNumber =  (String) httpSession.get("pro_id");
		roomList.put(session, roomNumber);
		System.out.println(roomNumber + "방번호");
		dto.setPro_id(roomNumber);
		
	}

	@Override
	// jsp send시
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		// 전송된 메시지를 모든 클라이언트에게 전송
		String msg = (String) message.getPayload();
		// arg[0]=방번호(프로젝트 아이디)
		// arg[1]=아이디 또는 네임
		// arg[2]=내용
		// arg[3]=파일
		//4개로 쪼갬
		String[] arg = msg.split(":");
		//채팅 dto설정
		dto.setId(arg[1]);
		dto.setChat_content(arg[2]);
		System.out.println(arg[3]);
		if(arg[3].equals("null")) {
			chatservice.insertchat(dto);
		}
		
		//jsp로 보내주는 부분
		for (WebSocketSession socket : usersInfo) {
			// 메시지 생성
			WebSocketMessage<String> sentMsg = new TextMessage(arg[1]+":"+arg[2]+":"+arg[3]);
			System.out.println(arg[1]);
			System.out.println(arg[2]);
			System.out.println(arg[3]);
			// 같은 방에만 전송
				if (arg[0].equals(roomList.get(socket))) {
					socket.sendMessage(sentMsg);
				}
					
			
			
		}
	}

	@Override
	// 연결종료시
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		usersInfo.remove(session);
	}

}
