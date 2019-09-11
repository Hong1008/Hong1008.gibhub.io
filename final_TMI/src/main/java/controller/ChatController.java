package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.ChattingDTO;
import service.ChatService;


@Controller
@RequestMapping("/chat/*")
public class ChatController {
	@Autowired
	private ChatService chatservice;
//테스트
	@RequestMapping("/chattingroom")
	public ModelAndView park_chat(ModelAndView mav, HttpSession session) {
		String pro_id =(String) session.getAttribute("pro_id");
		mav.addObject("chatList",chatservice.chatList(pro_id));
		mav.setViewName("chat/chatRoom");
		return mav;
	}

}
