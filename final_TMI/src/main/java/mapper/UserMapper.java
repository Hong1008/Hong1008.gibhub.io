package mapper;

import java.util.List;

import dto.UserDTO;

public interface UserMapper {
    
	//회원가입 insert
	public void insertMethod(UserDTO dto);
	//비밀번호찾기 select
	public UserDTO FindEmailMethod(String email);
	//이메일인증시 1로 upate
	public void UpdateGrade(String uid);
	//비밀번호변경
	public void UpdatePwd(UserDTO dto);
	//uuidupdate
	public void UpdateUuid(UserDTO dto);
	//로그인 인증
	public UserDTO Select_id(UserDTO dto);
	//중복검사
	public int Test_id(UserDTO dto);
   //ip확인
	public String Select_ip(String ip);
	
	public void Update_ip(UserDTO dto);
	
	public void insert_google(UserDTO dto);	
	//이메일 중복검사
	public int Test_email(UserDTO dto);
	//mypage 계정 update
	public void update_member(UserDTO dto);
	//mypage 내용 불러오는거
	public UserDTO select_mypage(String id);
}
