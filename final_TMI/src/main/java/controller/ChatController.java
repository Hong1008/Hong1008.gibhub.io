package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/chat/*")
public class ChatController {

	@RequestMapping("/chattingroom")
	public ModelAndView park_chat(ModelAndView mav, HttpSession session) {
		
		
		mav.addObject("roomNumber", session);
		mav.setViewName("chat/chatRoom");
		return mav;
	}

}
