package mobomobo.service.face;

import java.util.HashMap;
import java.util.List;

import mobomobo.dto.MovieAward;
import mobomobo.dto.UserInfo;
import mobomobo.util.AdminMovieRecomPaging;
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
	
	/**
	 * 회원관리 페이지에서 user삭제 하기
	 * 
	 * @param userno - 삭제할 userno
	 * @return 
	 */
	public boolean userDelete(UserInfo userno);

	public void writeMovierecom(HashMap<String, String> map);

	public AdminMovieRecomPaging getAdminMovieListPaging(int curPage);

	public List<MovieAward> getAwardMovieList(AdminMovieRecomPaging moviepaging);

}
