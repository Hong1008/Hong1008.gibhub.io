package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dto.ChattingDTO;
import service.ChatService;

@Controller
@RequestMapping("/chat/*")
public class ChatController {
	@Autowired
	private ChatService chatservice;

	// 테스트
	@RequestMapping("/chattingroom")
	public ModelAndView park_chat(ModelAndView mav, HttpSession session) {
		String pro_id = (String) session.getAttribute("pro_id");
		mav.addObject("chatList", chatservice.chatList(pro_id));
		mav.addObject("dateList", chatservice.dateList(pro_id));
		mav.addObject("today", chatservice.today());
		mav.setViewName("chat/chatRoom");
		return mav;
	}

	@RequestMapping(value = "/chatInsertFile", produces="text/plain;charset=UTF-8")
	public @ResponseBody String park_chatInsertFile(MultipartHttpServletRequest req, MultipartFile file, ChattingDTO dto) {
		String fileName="";
		// 경로
		String root = req.getSession().getServletContext().getRealPath("/");
		String saveDirectory = root + "temp" + File.separator;
		System.out.println(saveDirectory);
		// 경로 없으면 생성
		File fe = new File(saveDirectory);
		if (!fe.exists()) {
			fe.mkdir();
		}
		List<MultipartFile> fileList = req.getFiles("file");

		UUID random=UUID.randomUUID();
	
		for (MultipartFile mf : fileList) {
			File ff= new File(saveDirectory, random + "_" + mf.getOriginalFilename());
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
				dto.setUpload(random + "_" + mf.getOriginalFilename());
				fileName=dto.getUpload();
				chatservice.chatUpLoadFile(dto);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return fileName;
	}

}
