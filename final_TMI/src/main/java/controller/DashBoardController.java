package controller;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.DashDTO;
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
	public ModelAndView DashMain(ModelAndView mav, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");		
		int pro_id = 19;
		
		mav.addObject("pjcnt",service.pjcntProcess(id));
		mav.addObject("alltodocnt", service.AlltodoProcess(id));
		mav.addObject("recnt",service.remaincntProcess(pro_id));
		mav.addObject("comcnt", service.completecntProcess(pro_id));
		
		//top5 list
		mav.addObject("topList",service.topListProcess(pro_id));
		//최근등록 일정
		mav.addObject("relist", service.recentlistProcess(pro_id));
		//다가올 일정
		mav.addObject("comlist",service.commingProcess(pro_id));
		//최신 타임라인
		mav.addObject("timelist", service.timelineProcess(id));
		mav.addObject("bg","../resources/Dash_images/"+service.bgViewProcess(id)+".jpg");
		mav.setViewName("DashBoard/DashMain");
		//그냥 메인호출햇을떄도 값 가져와야함
		return mav;
		
	}
	
	@RequestMapping("/DashChange")
	public ModelAndView DashChange(ModelAndView mav,HttpServletRequest req, @RequestParam String bgsel ,DashDTO dto) {
		System.out.println(bgsel + " : ccc");
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		int pro_id = 19;
		dto.setBgsel(bgsel);
		dto.setId(id);
		service.bgChange(dto);
		
		mav.addObject("pjcnt",service.pjcntProcess(id));
		mav.addObject("alltodocnt", service.AlltodoProcess(id));
		mav.addObject("recnt",service.remaincntProcess(pro_id));
		mav.addObject("comcnt", service.completecntProcess(pro_id));	
		//top5 list
		mav.addObject("topList",service.topListProcess(pro_id));
		//최근등록 일정
		mav.addObject("relist", service.recentlistProcess(pro_id));
		//다가올 일정
		mav.addObject("comlist",service.commingProcess(pro_id));
		//최신 타임라인
		mav.addObject("timelist", service.timelineProcess(id));
		mav.addObject("bg","../resources/Dash_images/"+bgsel+".jpg");
		mav.setViewName("DashBoard/DashMain");
		
		return mav;
	}
	
}