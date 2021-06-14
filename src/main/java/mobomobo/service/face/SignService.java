package mobomobo.service.face;

import java.util.HashMap;

import mobomobo.dto.UserInfo;

public interface SignService {
	
	/**
	 * 
	 * 아이디 중복검사
	 * 
	 * @param id 회원가입 시 입력한 id
	 * @return int로 return
	 */
	public int signIdCheck(String id);
	

	/**
	 * 닉네임 중복검사
	 * 
	 * @param nick 회원가입 중 입력한 nick
	 * @return int return
	 */
	public int signNickCheck(String nick);

	/**
	 * 받아온 이메일 주소로 이메일 인증번호 발송
	 * @param email - 유저의 이메일 주소
	 * @return 인증번호
	 */
	public String signEmailSend(String email);
	
	/**
	 * 회원가입 완료
	 * @param userInfo - 유저가 입력한 회원가입 정보
	 * @return boolean값
	 */
	public boolean join(UserInfo userInfo);

	/**
	 * 
	 * 로그인 true, false검사
	 * 
	 * @param userInfo  - 입력한 id, pw
	 * @return 결과 
	 */
	public boolean login(UserInfo userInfo);

	
	/**
	 * 로그인 성공한 유저 아이디로 유저정보 조회
	 * 
	 * @param id - userid
	 * @return - 유저 정보
	 */
	public UserInfo getUserInfo(String id);

	/**
	 * 카카오 아이디로 로그인 검사
	 * @param map
	 * @return
	 */
	public boolean kakaologin(HashMap<String, Object> map);

	/**
	 * 카카오 로그인 성공한 유저 아이디로 유저정보 조회
	 * 
	 * @param object - kakaoid
	 * @return - 유저 정보
	 */
	public UserInfo getKakaoUserInfo(Object object);

	/**
	 * 아이디 찾기 - 사용자의 이름과 이메일로 아이디 조회
	 * @param userInfo - 사용자가 작성한 값
	 * @return id 조회
	 */
	public String findUserId(UserInfo userInfo);

	/**
	 * 비밀번호 찾기 
	 * 
	 * 사용자가 입력한 정보 검사
	 * 
	 * @param userInfo - 작성한 정보
	 * @return pw값
	 */
	public int findUserPw(UserInfo userInfo);

	/**
	 * 사용자의 새로운 pw 전송
	 * @param email - 사용자의 email
	 * @return
	 */
	public String rePwEmailSend(String email);

	/**
	 * 새로 발급된 암호화된pw DB에 저장
	 * @param pwd - 암호화 된 pw가 포함된 userInfo
	 * @return
	 */
	public void updatepw(UserInfo userInfo);


	

}
