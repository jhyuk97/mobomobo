package mobomobo.dao.face;

import java.util.List;

import mobomobo.dto.UserInfo;
import mobomobo.util.Paging;

public interface AdminDao {
	
	/**
	 * 전체 유저의 수를 조회 해서 페이징 객체로 ..*
	 * 
	 * @param userPaging
	 * @return
	 */
	public int selectCntAll(Paging userPaging);
	
	/**
	 * 페이징 을 이용하여 userinfo의 list 만들기
	 * 
	 * @param paging - 계산 완료된 paging 객체
	 * @return
	 */
	public List<UserInfo> selectPageList(Paging paging);
	
	/**
	 * 회원관리 페이지에서 유저정보 삭제하기
	 * @param userno - 삭제할 유저 정보
	 */
	public void userDelete(UserInfo userno);
	
	/**
	 *  회원 번호 조회 후 true, false 검사
	 * @param userno
	 * @return
	 */
	public int countUser(UserInfo userno);



}
