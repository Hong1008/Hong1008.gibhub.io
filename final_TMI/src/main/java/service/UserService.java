package service;

import java.util.List;

import dto.UserDTO;

public interface UserService {

	//회원가입 insert
	public void insertProcess(UserDTO dto);
	//메일보내기
	public void postmailProcess(UserDTO dto,String subject,String content);
	// 비밀번호찾기 (grade uid 검색)
	public UserDTO find_idProcess(String email);
	//grade 1로변경
	public void update_gradeProcess(String uid);
	//비밀번호 변경
	public void update_pwdProcess(UserDTO dto);
	//uuid 변경
	public void update_uuidProcess(UserDTO dto);
	//로그인 인증
	public UserDTO select_idProcess(UserDTO dto);
	//중복검사
	public int test_idProcess(UserDTO dto);
	
	//ip검사
	public String select_ipProcess(String ip);
	
	//ip update
	
	public void update_ipProcess(UserDTO dto);
	
	public void insert_googleProcess(UserDTO dto);
	//email 중복검사
	public int test_emailProcess(UserDTO dto);
	
	
}
