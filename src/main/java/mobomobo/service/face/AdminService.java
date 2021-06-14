package mobomobo.service.face;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import mobomobo.dto.MovieAward;
import mobomobo.dto.MovieBest;
import mobomobo.dto.MovieBestImg;
import mobomobo.dto.UserInfo;
import mobomobo.util.AdminMovieRecomPaging;
import mobomobo.util.MovieBestPaging;
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
	
	/**
	 * 회원관리 페이지에서 user의 grade 변경
	 * @param userno
	 * @return 결과
	 */
	public boolean userUpdate(UserInfo userInfo);
	
	
	/**
	 * 명장면 게시판 페이징 객체 생성
	 * @param inData
	 * @return
	 */
	public MovieBestPaging getPaging(MovieBestPaging inData);
	
	/**
	 * 명장면 관리자 페이지 페이징 게시글 목록 조회
	 * @param paging
	 * @return
	 */
	public List<MovieBest> movieBestlist(MovieBestPaging paging);
	
	
	/**
	 * 게시글과 첨부파일 
	 * @param movieBest
	 * @param file
	 */
	public void movieBestWrite(MovieBest movieBest , MultipartFile file );
	
	/**
	 * 파일번호로 명장면 게시판 업로드 파일 정보 조회 
	 * @param imgNo
	 * @return
	 */
	public MovieBestImg getMovieBestImg(int imgNo);
	
	/**
	 * 게시글 번호 이용해 업로드된 파일 정보 조회 
	 * @param viewMovieBest
	 * @return
	 */
	public MovieBestImg getMovieBestFile(MovieBest viewMovieBest);
	
	/**
	 * 영화 명장면 게시판 글, 이미지 삭제
	 * @param moiveBest
	 */
	public void moiveBestDelete(MovieBest movieBest);
	
	
	

	public void writeMovierecom(HashMap<String, String> map);

	public AdminMovieRecomPaging getAdminMovieListPaging(int curPage);

	public List<MovieAward> getAwardMovieList(AdminMovieRecomPaging moviepaging);

	public void removeMovierecom(MovieAward movieAward);

}
