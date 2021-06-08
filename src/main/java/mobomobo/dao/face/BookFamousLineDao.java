package mobomobo.dao.face;

import java.util.HashMap;
import java.util.List;

import mobomobo.dto.BookBest;
import mobomobo.dto.BookBestImg;
import mobomobo.dto.BookBestLike;
import mobomobo.dto.BookMark;
import mobomobo.util.BookBestPaging;

public interface BookFamousLineDao {

	/**
	 * 게시판 전체 개수 조회
	 * @return
	 */
	public int selectCntAll();

	/**
	 * 전체 리스트 가져오기
	 * @param paging 
	 * @return
	 */
	public List<HashMap<String, Object>> selectList(BookBestPaging paging);

	/**
	 * bookbest 테이블에 삽입
	 * @param info
	 */
	public void insertBookBest(BookBest info);

	/**
	 * bookbestimg 테이블에 이미지 삽입
	 * @param img
	 */
	public void insertBookBestImg(BookBestImg img);

	/**
	 * bookbestNo가져오기
	 * @return
	 */
	public int selectCntBookBestNo();

	/**
	 * fileNo 가져오기
	 * @return
	 */
	public int selectBookBestImgFileNo();

	/**
	 * 책 정보 가져오기
	 * @param bookBestno 
	 * @return
	 */
	public BookBest selectBookBest(String bookBestno);

	/**
	 * 책 이미지 정보 가져오기
	 * @param bookBestno
	 * @return
	 */
	public BookBestImg selectBookBestImg(String bookBestno);

	/**
	 * 책 이미지 정보 리스트 가져오기
	 * @return
	 */
	public List<BookBestImg> selectImgList();
	
	/**
	 * 책 명대사 제거
	 * @param bookBestno
	 */
	public void deleteBookBest(String bookBestno);

	/**
	 * 명대사 추천 조회
	 * @param bookBestLike
	 * @return
	 */
	public int selectBookBestLikeCnt(BookBestLike bookBestLike);

	/**
	 * 명대사 추천 기능
	 * @param bookBestLike
	 */
	public void insertBookBestLike(BookBestLike bookBestLike);

	/**
	 * 명대사 추천 해제 기능
	 * @param bookBestLike
	 */
	public void deleteBookBestLike(BookBestLike bookBestLike);

	/**
	 * 명대사 추천 개수 조회
	 * @param bookBestLike
	 * @return
	 */
	public int selectBookBestLike(BookBestLike bookBestLike);

	/**
	 * 첫 화면 명대사 추천 개수 조회
	 * @param bookBestno
	 * @return
	 */
	public int selectBookBestLikeByFirstView(String bookBestno);

	/**
	 * 북마크 유무 확인
	 * @param bookMark
	 * @return
	 */
	public int selectBookMarkCnt(BookMark bookMark);

	/**
	 * 북마크 삭제 기능
	 * @param bookMark
	 */
	public void deleteBookMark(BookMark bookMark);

	/**
	 * 북마크 등록 기능
	 * @param bookMark
	 */
	public void insertBookMark(BookMark bookMark);

}
