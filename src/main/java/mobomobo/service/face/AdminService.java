package mobomobo.service.face;

import java.util.List;

import mobomobo.dto.UserInfo;
import mobomobo.util.Paging;

public interface AdminService {

	/**
	 * 회원관리 list - 페이징 계산
	 * @param userPaging - 페이징 객체
	 * @return
	 */
	public Paging getPaging(Paging userPaging);
	
	/**
	 * 페이징 처리한 게시글 list 만들기
	 * 
	 * @param paging - paging 처리한 객체
	 * @return - list
	 */
	public List<UserInfo> list(Paging paging);
	
}
