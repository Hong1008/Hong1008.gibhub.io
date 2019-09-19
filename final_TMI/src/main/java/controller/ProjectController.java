package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.annotation.ProfileValueSourceConfiguration;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@RequestMapping(value="/management", method=RequestMethod.GET)
	public ModelAndView managementPost(ModelAndView mav) {
		mav.setViewName("project/management");
		return mav;
	}
	
	@RequestMapping(value="/management", method=RequestMethod.POST)
	public ModelAndView managementPost(ModelAndView mav, HttpSession session, @RequestParam(value = "pro_id") String pro_id ) { 
		session.setAttribute("pro_id", pro_id);
		/*else if(session.getAttribute("pro_id")!=pro_id && pro_id != null) {
			session.removeAttribute("pro_id");
			session.setAttribute("pro_id", pro_id);
		}*/
		/*else if(session.getAttribute("pro_id")==null) {
			mav.setViewName("redirect:/home");
		}*/
		mav.setViewName("project/management");
		return mav;
	}
	
	@RequestMapping("/kanbanboard")
	public ModelAndView kanbanboard(ModelAndView mav, HttpSession session) {
		mav.addObject("ptList", projectService.proTeamSelect(session.getAttribute("pro_id").toString()));
		mav.addObject("stList", projectService.schTeamSelect(session.getAttribute("pro_id").toString()));
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
	public String insertProject(ProjectDTO pdto,HttpServletRequest req, @RequestParam(value="pro_team_list") List<String> pro_team_list) {
		String id = req.getSession().getAttribute("id").toString();
		projectService.insertProject(pdto,id,pro_team_list);
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
	
	@RequestMapping("/calendarPro")
	public @ResponseBody List<ProjectDTO> calendarPro(HttpSession session) {
		return projectService.calendarPro(session.getAttribute("pro_id").toString(), session.getAttribute("id").toString());
	}
	
	@RequestMapping("/proSelect")
	public @ResponseBody ProjectDTO proSelect(HttpSession session) {
		return projectService.proSelect(session.getAttribute("pro_id").toString());
	}

}
