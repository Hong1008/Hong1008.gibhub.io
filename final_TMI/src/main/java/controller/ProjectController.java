package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.annotation.ProfileValueSourceConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.ProjectDTO;
import service.ProjectService;

@Controller
@RequestMapping("/project/*")
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping("/management")
	public ModelAndView ram_managementTest(ModelAndView mav, HttpServletRequest req, @RequestParam(value="pro_id", required=false) String pro_id ) { 
		HttpSession session = req.getSession();
		if(session.getAttribute("pro_id")==null && pro_id != null) {
			session.setAttribute("pro_id", pro_id);
		}else if(session.getAttribute("pro_id")!=pro_id && pro_id != null) {
			session.removeAttribute("pro_id");
			session.setAttribute("pro_id", pro_id);
			
		}
		mav.setViewName("project/management");
		return mav;
	}
	
	@RequestMapping("/kanbanboard")
	public ModelAndView kanbanboard(ModelAndView mav) {
		mav.setViewName("project/kanbanboard");
		return mav;
	}
	
	@RequestMapping("/calender")
	public ModelAndView ram_calanderTest(ModelAndView mav) {
		mav.setViewName("project/calender");
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
	
	@RequestMapping("/insertProject")
	public String insertProject(ProjectDTO pdto,HttpServletRequest req) {
		String id = req.getSession().getAttribute("id").toString();
		projectService.insertProject(pdto,id);
		return "redirect:/home";
	}

	@RequestMapping("/showWhat")
	public String showWhat(String where) {
		return "redirect:/project/"+where;
	}
	
	@RequestMapping("/searchId")
	public @ResponseBody List<String> searchId(String id) {
		return projectService.searchIdList(id);
	}

}
