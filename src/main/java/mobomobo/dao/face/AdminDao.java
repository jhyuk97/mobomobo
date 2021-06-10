package mobomobo.dao.face;

import java.util.HashMap;
import java.util.List;

import mobomobo.dto.MovieAward;
import mobomobo.dto.MovieBest;
import mobomobo.dto.MovieBestImg;
import mobomobo.dto.UserInfo;
import mobomobo.util.AdminMovieRecomPaging;
import mobomobo.util.MovieBestPaging;
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
	
	/**
	 * 회원 정보 변경 
	 * @param userno
	 */
	public void userUpdate(UserInfo userInfo);

	public void insertMovierecom(HashMap<String, String> map);

	public int selectMoiveCnt();

	public List<MovieAward> selectMovieAwardList(AdminMovieRecomPaging moviepaging);

	public void deleteMovierecom(MovieAward movieAward);


	/**
	 * 명장면 게시판 전체 게시글 수 조회 
	 * @return
	 */
	public int movieBestSelectCntAll();
	
	/**
	 * 명장면 게시판 페이징 전체 조회
	 * @param paging
	 * @return
	 */
	public List<MovieBest> selectPageMovieBest(MovieBestPaging paging);
	
	/**
	 * 명장면 게시판 글 삽입
	 * @param movieBest
	 */
	public void movieBestInsert(MovieBest movieBest);
	
	/**
	 * 명장면 게시판 첨부파일 삽입
	 * @param movieBestImg
	 */
	public void movieBestInsertFile(MovieBestImg movieBestImg);
	
	/**
	 * 명장면 게시판 첨부파일 이용해 파일 조회 
	 * @param imgNo
	 * @return
	 */
	public MovieBestImg selectByMovieBestFileNo(int imgNo);
	
	/**
	 * 명장면 게시판 글 번호 이용한 첨부파일 조회 
	 * @param viewMovieBest
	 * @return
	 */
	public MovieBestImg selectByMovieBestNo(MovieBest viewMovieBest);
	
	/**
	 * 명장면 게시판 이미지 삭제 
	 * @param movieBest
	 */
	public void deleteMovieBestImg(MovieBest movieBest);
	
	/**
	 * 명장면 게시판 정보 삭제
	 * @param movieBest
	 */
	public void deleteMovieBest(MovieBest movieBest);
	
	
	


}
