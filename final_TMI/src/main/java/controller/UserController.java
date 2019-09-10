package controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.social.google.connect.GoogleOAuth2Template;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.databind.ObjectMapper;

import common.VerifyRecaptcha;
import dto.AuthInfo;
import dto.UserDTO;
import service.UserService;


@Controller
public class UserController {

	@Autowired
	private UserService service;

	@Autowired
	    private AuthInfo authInfo;
	    
	    @Autowired
	    private GoogleOAuth2Template googleOAuth2Template;
	    
	    @Autowired
	    private OAuth2Parameters googleOAuth2Parameters;

	public void setService(UserService service) {
		this.service = service;
	}

	public UserController() {
		// TODO Auto-generated constructor stub
	}

	//아이디 중복검사 
	@RequestMapping("/id_test.do")
	public @ResponseBody int id_test(UserDTO dto)
	{
		int result=service.test_idProcess(dto);
		return result;
		
	}
	//email 중복검사 
	@RequestMapping("/email_test.do")
	public @ResponseBody int email_test(UserDTO dto)
	{
		int result=service.test_emailProcess(dto);
		return result;
	}
	//구글로그인 로그인했을때
	@RequestMapping(value = "/googlelogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String googlelogin(UserDTO dto) {
        
		dto.setId(dto.getEmail());
		int result=service.test_idProcess(dto);
		String login="";
		if(result==1)
		{
			//session 등록
			login="signin";
		}
		else
		{
			//구글로그인 회원가입
			login="signup";
		}
		
                  	
		return login;
	}
	//구글 로그인했을때 회원가입 안되있으면 회원가입
	@RequestMapping("/google_sign_up.do")
	public @ResponseBody String googlelogin_signup(UserDTO dto)
	{
		dto.setId(dto.getEmail()+"_google");
		dto.setEmail(dto.getEmail()+"_google");
		service.insert_googleProcess(dto);
		return "true";
	}

	
	
	
	 
	
	// 회원가입
	@ResponseBody
	@RequestMapping(value = "/UserInsert.do", method = RequestMethod.POST)
	public String UserInsertMethod(UserDTO dto, HttpServletRequest req) {
        
		UUID uid = UUID.randomUUID();
		dto.setIp(req.getRemoteAddr());
		dto.setUuid(uid.toString());
       
		VerifyRecaptcha.setSecretKey("6Ld6HLYUAAAAADBVXoaB22rKK7FmA6aEBJCbrbq0");
		String gRecaptchaResponse = req.getParameter("recaptcha");
	
		// 0 = 성공, 1 = 실패, -1 = 오류
		try {
			if (VerifyRecaptcha.verify(gRecaptchaResponse)) {
				service.insertProcess(dto);
				String subject = "EASY TASK[이메일 인증]";// 제목
				String content = "<div align='center'>\r\n"
						+ "        <img src=\"https://ww.namu.la/s/34f4f86a25e4f020f4f2df539231f36df7e209a1c08137102b7bf3eb9a884b270273333c6a3e576d2a0ddf7ac4e0f782de5319f1eef41d42f4a0b170156150f02b736b9019e792a2cf3340572f21cd4ca74789532b72c843e3baf3e5d9ca705c\" style=\"width: 50%;\">\r\n"
						+ "<p >We heard that you lost your TMI password. Sorry about that!<br>\r\n"
						+ "        But don’t worry! You can use the following link to reset your password:</p>\r\n"
						+ "<a href='http://localhost:8090/tmi/confirm_email.do?uid=" + dto.getUuid() +

						"' style='text-decoration: none;\r\n" + "    font-size: 27px;\r\n" + "    font-weight: bold;\r\n"
						+ "    color: rgb(36, 173, 228);\r\n" + "\'>Click me!</a><br>";
				service.postmailProcess(dto, subject, content);
				return "0";
			} else {
				return "1";
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			return "-1";
		}

	}

	// 메인 뷰
	@RequestMapping("/main.do")
	public ModelAndView MainView(ModelAndView mav) {
		mav.setViewName("/member/main");
		return mav;
	}

	// 비밀번호찾기 뷰
	@RequestMapping("/forgot_pw.do")
	public ModelAndView Forgot_pw_View(ModelAndView mav) {
		mav.setViewName("/member/forgot_pw");
		return mav;
	}

	// 로그인 뷰
	@RequestMapping("/sign_in.do")
	public ModelAndView Sign_in_View(ModelAndView mav) {
	
	   //구글로그인 url
		String url = googleOAuth2Template.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
        System.out.println("/googleLogin, url : " + url);
        mav.addObject("google_url", url);
        
		mav.setViewName("/member/sign_in");
		return mav;
	}

	
	// 로그인 버튼눌렀을시
	@RequestMapping("/sign_in_do.do")
	public @ResponseBody String Sign_in_do(UserDTO dto, HttpServletRequest req) {

		String result="";
		if (service.select_idProcess(dto) == null) {
			result="false";
		} else {
			dto = service.select_idProcess(dto);
			/*
			HttpSession session = req.getSession();
			session.setAttribute("id", dto.getId());
			session.setAttribute("grade", dto.getGrade());*/
			
		
			String ip=service.select_ipProcess(dto.getId());
			String [] iplist=ip.split(",");
			String ipreq= req.getRemoteAddr();
			for (int i=0;i<iplist.length;i++)
			{
				//if(ipreq.equals(iplist[i]))
				if(ipreq.equals("0"))
				{
					return "true";
				}
				else
				{
					result="ip";
				}
			}
			
			
		}

		return result;
	}
	
	//로그인 > ip확인 >캡차 확인눌렀을때 
	@RequestMapping("/sign_in_recaptcha.do")
	public @ResponseBody String Sign_in_recaptcha(HttpServletRequest req,UserDTO dto)
	{
		
		String result="";
		VerifyRecaptcha.setSecretKey("6Ld6HLYUAAAAADBVXoaB22rKK7FmA6aEBJCbrbq0");
		String gRecaptchaResponse = req.getParameter("recaptcha");
		try {
			if (VerifyRecaptcha.verify(gRecaptchaResponse))
			{
				dto.setIp(","+req.getRemoteAddr());
			   service.update_ipProcess(dto);
				result="0";
			}
			else
			{
				result="1";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result="-1";
		}
	
		return result;
		
	}
	

	// 회원가입 뷰
	@RequestMapping("/sign_up.do")
	public ModelAndView Sign_up_View(ModelAndView mav, HttpServletRequest req, UserDTO dto) {
		if (req.getParameter("id") != null) {
			dto.setId(req.getParameter("id"));
			dto.setEmail(req.getParameter("email"));
			dto.setPwd(req.getParameter("pwd"));
		} else {
			dto.setId("");
			dto.setEmail("");
			dto.setPwd("");
		}
		mav.addObject("dto", dto);
		mav.setViewName("/member/sign_up");
		return mav;
	}

	// 이메일인증 뷰

	@RequestMapping("/confirm_email.do")
	public String confirm_emailMethod(HttpServletRequest request) {
		String uid = request.getParameter("uid");

		service.update_gradeProcess(uid);
		return "/member/confirm_email";
	}

	// 비밀번호 변경폼 보이기
	@RequestMapping("/change_pwd_form.do")
	public String Change_pwd_form() {

		return "/member/change_pwd";
	}

	// 비밀번호 변경 하기 눌렀을시
	// 나중 transaction 설정
	// 보안위해서 한번쓰인 키는 바꿔줌
	@RequestMapping("/change_pwd.do")
	public String Change_pwd_do(UserDTO dto) {
		UUID uid = UUID.randomUUID();
		dto.setNewuuid(uid.toString());
		try {
		
			service.update_pwdProcess(dto);
			service.update_uuidProcess(dto);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("update 실패" + e.toString());
		}

		return "/member/main";
	}

	// 비밀번호 변경 인증 링크 이메일로 보내기
	@RequestMapping("/change_pwd_post.do")
	public @ResponseBody String Change_pwd(ModelAndView mav, String email, UserDTO dto) {
		String text = "";
		dto = service.find_idProcess(email);
		int grade = dto.getGrade();
		String uid = dto.getUuid();
		dto.setUuid(uid);
		dto.setEmail(email);
		System.out.println(grade + " " + uid + " " + email);

		if (uid != null && grade != 0) {
			String subject = "EASY TASK[비밀번호 변경]";// 제목
			String content = "<div align='center' style='border:1px solid black'>\r\n"
					+ "<h3 style='color:#ff5722; font-size:100%;'>비밀번호 변경 링크입니다</h3>\r\n"
					+ "<div style='font-size:130%;'><strong><a href='http://localhost:8090/tmi/change_pwd_form.do?uuid="
					+ dto.getUuid() + "'>비밀번호 변경 링크</a></strong></div><br>";// 내용

			service.postmailProcess(dto, subject, content);
			text = "Check your email.";

		} else {
			text = "Can't find that email, sorry.";
		}

		return text; // ajax값 보내줌
	}
	// 구글 Callback호출 메소드
		  @RequestMapping(value = "/oauth2callback.do", method = { RequestMethod.GET, RequestMethod.POST })
		  public String googleCallback(Model model, @RequestParam String code,HttpServletResponse response,HttpServletRequest req) throws IOException {
	        
		        //RestTemplate을 사용하여 Access Token 및 profile을 요청한다.
		        RestTemplate restTemplate = new RestTemplate();
		       MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
		        parameters.add("code", code);
		        parameters.add("client_id", authInfo.getClientId());
		        parameters.add("client_secret", authInfo.getClientSecret());
		        parameters.add("redirect_uri", googleOAuth2Parameters.getRedirectUri());
		        parameters.add("grant_type", "authorization_code");
		        HttpHeaders headers = new HttpHeaders();
		        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String, String>>(parameters, headers);
		        ResponseEntity<Map> responseEntity = restTemplate.exchange("https://www.googleapis.com/oauth2/v4/token", HttpMethod.POST, requestEntity, Map.class);
		        Map<String, Object> responseMap = responseEntity.getBody();
		 
		        String[] tokens = ((String)responseMap.get("id_token")).split("\\.");
		        Base64 base64 = new Base64(true);
		        String body = new String(base64.decode(tokens[1]));
		    
		        //Jackson을 사용한 JSON을 자바 Map 형식으로 변환
		        ObjectMapper mapper = new ObjectMapper();
		        Map<String, String> result = mapper.readValue(body, Map.class);
		        System.out.println(result.get("email"));
		    System.out.println("Google login success");
	       model.addAttribute("email", result.get("email"));
	       model.addAttribute("name",result.get("name"));
		    return "/member/google_signup";
		  }

}
