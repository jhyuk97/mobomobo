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


}
