package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatEchoController extends TextWebSocketHandler {
	private List<WebSocketSession> usersInfo = new ArrayList<>();//유저정보 넣는 리스트
	private Map<WebSocketSession, String> roomList= new HashMap<>();//방정보 받는 리스트
	
	@Override
	// 연결시
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		usersInfo.add(session);
		System.out.println(session+": 웹소켓접속");
		/*roomList.put(session, roomNumber);*/
	}
	
	@Override
	//jsp send시
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		// 전송된 메시지를 모든 클라이언트에게 전송
		String msg = (String) message.getPayload();
		System.out.println(msg);
		for (WebSocketSession socket : usersInfo) {
			// 메시지 생성
			WebSocketMessage<String> sentMsg = new TextMessage(msg);
			// 각 세션에게 메시지를 전송
			socket.sendMessage(sentMsg);
		}
	}
	@Override
	//연결종료시
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		usersInfo.remove(session);
	}

}
