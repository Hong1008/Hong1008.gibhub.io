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
import dto.ProjectDTO;
import dto.UserDTO;
import service.ProjectService;
import service.UserService;

@Aspect
public class WebSocketHandler extends TextWebSocketHandler{

	List<WebSocketSession> sessions = new ArrayList<>();
	Map<String, WebSocketSession> userSessions = new HashMap<>();
	@Autowired
	private UserService service;
	
	@Autowired
	private ProjectService proservice;
	

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
			            
			   
			           
			            List<HashMap<String, Object>> notiList =service.notifi_listProcess(senderId);
			            
			         String res= String.valueOf(result);
			        
			         for(HashMap<String, Object> List:notiList)
			         {
			        	 if(List.get("state").toString().equals("0"))
			        	 {   //첫번쨰 input보낸사람 두번째 input 받은사람 3번째 pro_id
			        		 res+=",<div>"+List.get("name").toString()+"님이"+List.get("pro_name")+""
			        		 		+ "팀에 귀하를 초대하셨습니다 팀에 가입하시겠습니까?.<input type='hidden' value='"+List.get("pro_name")+"'/><input type='hidden' value='"+List.get("id") +"'/><input type='hidden' value='"+senderId +"'/><input type='hidden' value='"+List.get("pro_id") +"'/><input id='btn_yes' class='btn_yes' type='button' value='yes'/> <input id='btn_no' type='button' value='no'/> </div>";
			        	 }
			        	 else if(List.get("state").toString().equals("3"))
			        	 {
			        		NotiDTO dto=service.select_notificationProcess(senderId, List.get("no").toString());
			        		UserDTO udto=service.select_mypageProcess(dto.getNoti_id());
			                
			        	
			        		 res+=",<div>"+udto.getName()+"님이"+List.get("pro_name")+"초대를 수락하셨습니다.<input type='hidden' value='"+dto.getNoti_id()+"'><input type='hidden' value='"+List.get("pro_id")+"'><div id='notification_deleteBtn'>X</div></div>";
			        	 }
			        	 else if(List.get("state").toString().equals("4"))
			        	 {
			        		 NotiDTO dto=service.select_notificationProcess(senderId, List.get("no").toString());
				        		UserDTO udto=service.select_mypageProcess(dto.getNoti_id());
				        		 res+=",<div>"+udto.getName()+"님이"+List.get("pro_name")+"초대를 거절하셨습니다.<input type='hidden' value='"+dto.getNoti_id()+"'><input type='hidden' value='"+List.get("pro_id")+"'><div id='notification_deleteBtn'>X</div></div>";
			        	 }
			        	 else if(List.get("state").toString().equals("6"))
			        	 {
			        		 
							  ProjectDTO pdto=	proservice.proSelect(List.get("pro_id").toString());
								 res+=",delete,"+pdto.getPro_name()+"프로젝트에서 제외 되셨습니다.<input type='hidden' value='"+senderId+"'><input type='hidden' value='"+List.get("pro_id").toString()+"'><div id='notification_deleteBtn'>X</div></div>";
							
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
			         UserDTO udto=service.select_mypageProcess(strs[2]);
			         
			         //초대보낸사람  ,프로젝트이름,  첫번쨰 input보낸사람 두번째 input 받은사람 3번째 pro_id
			         res+=",invite,<div>"+udto.getName()+"님이"+strs[3]
		        		 		+ "팀에 귀하를 초대하셨습니다 팀에 가입하시겠습니까?.<input type='hidden' value='"+strs[3]+"'><input type='hidden' value='"+strs[2] +"'/><input type='hidden' value='"+strs[1] +"'/>"
		        		 				+ "<input type='hidden' value='"+strs[4] +"'/>"
		        		 				+ "<input id='btn_yes' class='btn_yes' type='button' value='yes'/> <input id='btn_no' type='button' value='no'/> </div>";
			         oSession.sendMessage(new TextMessage(res)); 
				}
				else if(strs[0].equals("yes"))
				{
					//id는 알림받을사람 noti_id는 초대를 보낸사람 버튼을누른사람
					WebSocketSession oSession = userSessions.get(strs[1]);
					String pro_id=strs[2];
					String invite_id=strs[3];//초대받은사람  1이 보낸사람
                    String name=strs[4];
					UserDTO dto=service.select_mypageProcess(invite_id);
					result=service.select_noti_countProcess(strs[1]);
			         String res= String.valueOf(result);
			         //알림받은사람은 session 받은사람 pro_id
			         res+=",yes,<div>"+dto.getName()+"님이"+name+"프로젝트 초대를 수락하셨습니다.<input type='hidden' value='"+invite_id+"'><input type='hidden' value='"+pro_id+"'><div id='notification_deleteBtn'>X</div></div>";
			        		 
			         oSession.sendMessage(new TextMessage(res)); 
				}
				else if(strs[0].equals("no"))
				{
					//id는 알림받을사람 noti_id는 초대를 보낸사람 버튼을누른사람
					WebSocketSession oSession = userSessions.get(strs[1]);
					String pro_id=strs[2];
					String invite_id=strs[3];//초대받은사람  1이 보낸사람
                    String name=strs[4];
					UserDTO dto=service.select_mypageProcess(invite_id);
					result=service.select_noti_countProcess(strs[1]);
			         String res= String.valueOf(result);
			         //초대보낸사람 받은사람 pro_id
			         res+=",no,<div>"+dto.getName()+"님이"+name+"프로젝트 초대를 거절하셨습니다.<input type='hidden' value='"+invite_id+"'><input type='hidden' value='"+pro_id+"'><div id='notification_deleteBtn'>X</div></div>";
			         oSession.sendMessage(new TextMessage(res)); 	
				}
				else if(strs[0].equals("delete"))
				{
					WebSocketSession oSession = userSessions.get(strs[2]);
					System.out.println(strs[2]);
					
					System.out.println("result"+result);
					NotiDTO dto=new NotiDTO();
					dto.setState(6);
					dto.setPro_id(Integer.valueOf(strs[1]));
					dto.setId(strs[2]);
					dto.setNoti_id(senderId);
					service.noti_insertProcess(dto);
				/*	service.noti_updateProcess("6",strs[1] ,strs[2]);*/
				     ProjectDTO pdto=	proservice.proSelect(strs[1]);
				     result=service.select_noti_countProcess(strs[2]);
					 String res= String.valueOf(result);
					 res+=",delete,"+pdto.getPro_name()+"프로젝트에서 제외 되셨습니다.<input type='hidden' value='"+strs[2]+"'><input type='hidden' value='"+strs[1]+"'><div id='notification_deleteBtn'>X</div></div>";
					oSession.sendMessage(new TextMessage(res)); 	
				}
				
				
				
				
		
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