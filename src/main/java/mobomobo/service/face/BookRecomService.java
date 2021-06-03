package mobomobo.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import mobomobo.dto.BookBest;
import mobomobo.dto.BookKey;
import mobomobo.dto.BookMark;
import mobomobo.dto.BookStarRating;
import mobomobo.util.BookRecomPaging;

public interface BookRecomService {

	/**
	 * 별점 테이블 리스트로 받아오기 
	 * @param isbn
	 * @return
	 */
	public List<HashMap<String,Object>> getRating(String[] isbn);

	/**
	 * 명장면 전체리스트
	 * @param paging 
	 * @return
	 */
	public List<BookBest> getList(BookRecomPaging paging);

	/**
	 * 페이징
	 * @param inData
	 * @return
	 */
	public BookRecomPaging getPaing(BookRecomPaging inData);

	/**
	 * 시상식 전체 리스트 목록
	 * @return
	 */
	public List<HashMap<String, Object>> getList();


	/**
	 * 북마크 상태 조회
	 * @param substring
	 * @param session
	 * @return
	 */
	public boolean getBookMarkInfo(String substring, HttpSession session);

	/**
	 * 북마크 삭제
	 * @param key
	 * @param session
	 */
	public void deleteBookMark(BookMark bookMarkInfo);

	/**
	 * 북마크 삽입
	 * @param key
	 * @param session
	 */
	public void insertBookMark(BookMark bookMarkInfo);

	/**
	 * 북마크 삽입 삭제를 위한 정보 담기
	 * @param bookMark
	 * @param session
	 * @return
	 */
	public BookMark saveBookMarkInfo(BookMark bookMark, HttpSession session);

	/**
	 * 책 평점 삽입
	 * @param bookStarRating
	 */
	public void insertBookStarRating(BookStarRating bookStarRating);

	/**
	 * 상세보기 평점 조회
	 * @param isbn
	 * @return
	 */
	public HashMap<String, Object> getDetailAvg(String isbn);

	

}
