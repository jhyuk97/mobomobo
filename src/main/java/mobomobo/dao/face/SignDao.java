package mobomobo.dao.face;

import java.util.HashMap;

import mobomobo.dto.UserInfo;

public interface SignDao {
	
	/**
	 * 아이디 중복검사 
	 * @param id - 입력한 id 값
	 * @return
	 */
	public int selectId(String id);
	
	/**
	 * 닉네임 중복검사
	 * @param nick 입력한 nick값
	 * @return
	 */
	public int selectNick(String nick);
	
	/**
	 * 회원가입 완료 후 저장
	 * 
	 * @param userInfo - 유저가 입력한 정보들
	 */
	public void join(UserInfo userInfo);

	/**
	 * 회원가입 성공시 userImg에 기본 이미지 저장
	 */
	public void joinUserImg();
	
	/**
	 * 로그인 검사
	 * @param userInfo
	 * @return
	 */
	public int login(UserInfo userInfo);

	/**
	 * 유저정보 조회
	 * @param id
	 * @return
	 */
	public UserInfo selectUserInfo(String id);
	
	/**
	 * kakao로 로그인 한 사람의 id 검사
	 * @param map
	 * @return
	 */
	public int kakaologin(HashMap<String, Object> map);
	
	/**
	 * kakao 유저정보 조회
	 * @param object
	 * @return
	 */
	public UserInfo selectKakaoUserInfo(Object object);
	
	/**
	 * 아이디 찾기
	 * @param userInfo
	 * @return
	 */
	public UserInfo selectFindUserId(UserInfo userInfo);
	
	/**
	 * 입력한 값중에서 id로 비밀번호 찾기
	 * @param userInfo  - 입력한 정보
	 * @return pw
	 */
	public int selectFindUserPw(UserInfo userInfo);
	
	/**
	 * 암호화된 pw 를 업데이트
	 * @param userInfo - pw가 포함된 userInfo
	 * @return
	 */
	public void updatePw(UserInfo userInfo);
	


}
