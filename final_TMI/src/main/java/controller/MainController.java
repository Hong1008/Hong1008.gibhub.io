package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mapper.TestMapper;

@Controller
public class MainController {
	
	@Autowired
	private TestMapper mapper;
	
	@RequestMapping("/main")
	public ModelAndView index(ModelAndView mav) {
		mav.addObject("test", mapper.test());
		mav.setViewName("test");
		return mav;
	}
}
