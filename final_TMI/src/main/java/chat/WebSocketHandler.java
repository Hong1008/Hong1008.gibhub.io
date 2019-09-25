package chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import service.UserService;

public class WebSocketHandler extends TextWebSocketHandler{

	

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
			String id=message.getPayload();
			String str[] =id.split(",");
			boolean id_res=false;
			if(str.length>1)
			{
			for(int i=1; i<str.length;i++)
			{
				if(str[0]==str[i])
				{
					id_res=true;
				}
			}
			}
			
			int result=0;
			if(id_res==true)
			{
				result=service.select_noti_countProcess(str[0]);
			}
			else
			{
				result=service.select_noti_countProcess(str[0]);
				
			}
		
			
	        
			String res= String.valueOf(result);
			session.sendMessage(new TextMessage(res)); 

	      
			

		}
	 public static HttpServletRequest getCurrentRequest() {

		 ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder
		 .currentRequestAttributes();

		 HttpServletRequest hsr = sra.getRequest();
		 return hsr;
		 }

		




	}