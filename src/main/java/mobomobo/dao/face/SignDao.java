package mobomobo.dao.face;

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

}
