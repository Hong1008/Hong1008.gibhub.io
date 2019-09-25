package chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import dto.NotiDTO;
import dto.UserDTO;
import service.UserService;

@Aspect
public class WebSocketHandler extends TextWebSocketHandler{

	List<WebSocketSession> sessions = new ArrayList<>();
	Map<String, WebSocketSession> userSessions = new HashMap<>();
	@Autowired
	private UserService service;
		
	

		private final Logger logger = LogManager.getLogger(getClass());

		
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception{
			System.out.println("afterConnectionEstablished:" + session);
			sessions.add(session);
			String senderId = getId(session);
			userSessions.put(senderId, session);
		}
		
		
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			System.out.println("handleTextMessage:" + session + " : " + message);
			String senderId = getId(session);
//			for (WebSocketSession sess: sessions) {
//				sess.sendMessage(new TextMessage(senderId + ": " + message.getPayload()));
//			}
			
			//protocol: cmd,댓글작성자,게시글작성자,bno  (ex: reply,user2,user1,234)
			String msg = message.getPayload();
			int result=0;
			if (StringUtils.isNotEmpty(msg)) {
			
				String[] strs = msg.split(",");
				System.out.println(strs[0]);
				if(strs[0].equals("open"))
				{
					WebSocketSession oSession = userSessions.get(senderId);
			            result=service.select_noti_countProcess(senderId);
			            List<NotiDTO> dto=service.select_notificationProcess(senderId);
			            List<HashMap<String, Object>> notiList =service.notifi_listProcess(senderId);
			         String res= String.valueOf(result);
			        
			         for(HashMap<String, Object> List:notiList)
			         {
			        	 if(List.get("state").toString().equals("0"))
			        	 {
			        		 res+=",<div>"+List.get("name").toString()+"님이"+List.get("pro_name")+""
			        		 		+ "팀에 귀하를 초대하셨습니다 팀에 가입하시겠습니까?.<input type='hidden' value='"+List.get("") +"'/><input type='hidden' value='"+List.get("pro_id") +"'/><input id='btn_yes' class='btn_yes' type='button' value='yes'/> <input id='btn_no' type='button' value='no'/> </div>";
			        	 }
			        	 
			         }
			         oSession.sendMessage(new TextMessage(res)); 

					
				}
				
				else if(strs[0].equals("invite"))
				{
					
					System.out.println(strs[1]);
					WebSocketSession oSession = userSessions.get(strs[1]);
					result=service.select_noti_countProcess(strs[1]);
			         String res= String.valueOf(result);
			         res+=",invite,asdsad";
			         oSession.sendMessage(new TextMessage(res)); 
				}
				
				
				
				
			/*	if (strs != null && strs.length == 4) {
					String cmd = strs[0];
					String replyWriter = strs[1];
					String boardWriter = strs[2];
					String bno = strs[3];
					
					WebSocketSession boardWriterSession = userSessions.get(boardWriter);
					if ("reply".equals(cmd) && boardWriterSession != null) {
						TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
								+ "<a href='/board/read?bno=" + bno + "'>" + bno + "</a>번 게시글에 댓글을 달았습니다!");
						boardWriterSession.sendMessage(tmpMsg);
					}
				}*/
			}
		}

		private String getId(WebSocketSession session) {
			Map<String, Object> httpSession = session.getAttributes();
			String loginUser = (String)httpSession.get("id");
	
			if (null == loginUser)
				return session.getId();
			else
				return loginUser;
		}

		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			System.out.println("afterConnectionEstablished:" + session + ":" + status);
		}



	
			//현재 수신자에게 몇개의 메세지가 와있는지 디비에서 검색함. message.getPayload();
			//count세주는거니까 select count(*) from notification where id="" and yn in("1","2");
			//count 두개해줘야할듯 select count(*) from notificatin where invited_id="" and yn=0; //1일때 2일떄 들어갔습니다 거부했습니다 알림할필요있나
		
		

	      
			

	
	

		




	}