package chat;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import service.UserService;

public class WebSocketHandler extends TextWebSocketHandler {

	

	/* @Autowired

		SqlSession sqlsession;*/

	@Autowired
	private UserService service;
		

		private final Logger logger = LogManager.getLogger(getClass());

		

	  @Override

		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

			

		}



	  @Override

		public void afterConnectionEstablished(WebSocketSession session) throws Exception {

			

		}



	 @Override

		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {


			this.logger.info(message.getPayload());
			//현재 수신자에게 몇개의 메세지가 와있는지 디비에서 검색함. message.getPayload();
			//count세주는거니까 select count(*) from notification where id="" and yn in("1","2");
			//count 두개해줘야할듯 select count(*) from notificatin where invited_id="" and yn=0; //1일때 2일떄 들어갔습니다 거부했습니다 알림할필요있나
			int result=service.select_noti_countProcess(message.getPayload());
			String res= String.valueOf(result);
			session.sendMessage(new TextMessage(res)); 

	

			

		}





	}