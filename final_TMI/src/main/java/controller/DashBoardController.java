package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.DashBoardService;

@Controller
@RequestMapping("/DashBoard/*")
public class DashBoardController {
	
	@Autowired
	private DashBoardService service;
	
	public void setService(DashBoardService service) {
		this.service = service;
	}
	
	@RequestMapping("/DashMain")
	public ModelAndView DashMain(ModelAndView mav) {
		String id = "박기현";
		int pro_id = 1;
		
		//HttpSession session = req.getSession();
		//String id = session.setAttribute("id", dto.getId());
		mav.addObject("pjcnt",service.pjcntProcess(id));
		mav.addObject("alltodocnt", service.AlltodoProcess(id));
		mav.addObject("recnt",service.remaincntProcess(pro_id));
		mav.addObject("comcnt", service.completecntProcess(pro_id));
		
		//최근등록 일정
		mav.addObject("relist", service.recentlistProcess(pro_id));
		//다가올 일정
		mav.addObject("comlist",service.commingProcess(pro_id));
		//최신 타임라인
		mav.addObject("timelist", service.timelineProcess(pro_id));
		mav.setViewName("DashBoard/DashMain");
		return mav;
		
	}
}