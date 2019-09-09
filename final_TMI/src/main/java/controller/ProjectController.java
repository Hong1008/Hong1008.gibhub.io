package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mapper.TestMapper;

@Controller
public class ProjectController {
	
/*	@Autowired
	private ProjectMapper mapper;
	}*/
	
	@RequestMapping("/project/home")
	public ModelAndView ram_homeTest(ModelAndView mav) {
		mav.setViewName("Home");
		return mav;
	}
	
	@RequestMapping("/project/management")
	public ModelAndView ram_managementTest(ModelAndView mav) {
		mav.setViewName("project/management");
		return mav;
	}
	
	@RequestMapping("/project/calander")
	public ModelAndView ram_calanderTest(ModelAndView mav) {
		mav.setViewName("project/calander");
		return mav;
	}
	
	@RequestMapping("/project/schedule")
	public ModelAndView ram_scheduleTest(ModelAndView mav) {
		mav.setViewName("project/schedule");
		return mav;
	}
	
	@RequestMapping("/project/timeline")
	public ModelAndView ram_timelineTest(ModelAndView mav) {
		mav.setViewName("project/timeline");
		return mav;
	}

}
