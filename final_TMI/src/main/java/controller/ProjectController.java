package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.ProjectService;

@Controller
@RequestMapping("/project/*")
public class ProjectController {
	@Autowired
	private ProjectService projectService;
	
	
	@RequestMapping("/home")
	public ModelAndView ram_homeTest(ModelAndView mav) {
		mav.setViewName("Home_logOut");		
		projectService.testPrn();
		return mav;
	}
	
	@RequestMapping("/home2")
	public ModelAndView ram_homeTest2(ModelAndView mav) {
		mav.setViewName("Home_logIn");
		return mav;
	}
	
	@RequestMapping("/management")
	public ModelAndView ram_managementTest(ModelAndView mav) {
		mav.setViewName("project/management");
		return mav;
	}
	
	@RequestMapping("/calander")
	public ModelAndView ram_calanderTest(ModelAndView mav) {
		mav.setViewName("project/calander");
		return mav;
	}
	
	@RequestMapping("/schedule")
	public ModelAndView ram_scheduleTest(ModelAndView mav) {
		mav.setViewName("project/schedule");
		return mav;
	}
	
	@RequestMapping("/timeline")
	public ModelAndView ram_timelineTest(ModelAndView mav) {
		mav.setViewName("project/timeline");
		return mav;
	}

}
