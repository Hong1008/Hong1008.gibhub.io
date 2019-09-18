package controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.ManageDTO;
import service.ManageService;

@Controller
@RequestMapping("/setting/*")
public class ManageController {
	@Autowired
	private ManageService service;
	
	public ManageController() {
		// TODO Auto-generated constructor stub
	}
	
	public void setService(ManageService service) {
		this.service = service;
	}
	
	@RequestMapping("/main")
	public ModelAndView main(ModelAndView mav) {
		String pro_id= "2";
		
		mav.addObject("content", service.manageContentProcess(pro_id));
		mav.addObject("people", service.managePeopleProcess(pro_id));
		mav.setViewName("manage/mg_main");
		return mav;
	}
	
	@RequestMapping("/pjset")
	public ModelAndView pjsetting(ModelAndView mav, String pro_id) {
		mav.addObject("dto", service.manageContentProcess(pro_id));
		mav.setViewName("manage/mg_setting");
		return mav;
	}
	
	@RequestMapping("/contentUpt")
	public String pjupdate(String pro_id, String pro_name, String pro_info, Date pro_start, Date pro_end, Date pro_rend) {
		ManageDTO dto = new ManageDTO();
		dto.setPro_id(pro_id);
		dto.setPro_name(pro_name);
		dto.setPro_info(pro_info); 
		dto.setPro_start(pro_start);
		dto.setPro_end(pro_end);
		dto.setPro_rend(pro_rend);
		
		service.manageContentUpdateProcess(dto);		
				
		return "redirect:/setting/main";
	}
	
	@RequestMapping("/setpeople")
	public ModelAndView pjpeople(ModelAndView mav, String pro_id) {
		
		mav.addObject("people", service.managePeopleProcess(pro_id));
		
		mav.setViewName("manage/mg_people");
		return mav;
	}
	
	@RequestMapping("/manager")
	public String pjmanager(String pro_id, String id) {
		service.managerResetProcess(pro_id);
		ManageDTO dto = new ManageDTO();
		dto.setPro_id(pro_id);
		dto.setId(id);
		service.managerChangeProcess(dto);
		service.managerProcess(dto);
		
		return "redirect:/setting/main";
	}
}
