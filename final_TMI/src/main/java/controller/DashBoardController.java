package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/DashBoard/*")
public class DashBoardController {
	
	@RequestMapping("/DashMain")
	public ModelAndView DashMain(ModelAndView mav) {
		mav.setViewName("DashBoard/DashMain");
		return mav;
	}
}
