package mobomobo.dao.face;

import java.util.HashMap;
import java.util.List;

import mobomobo.dto.BookBest;
import mobomobo.dto.BookKey;
import mobomobo.dto.BookMark;
import mobomobo.dto.BookStarRating;
import mobomobo.util.BookRecomPaging;

public interface BookRecomDao {

	/**
	 * isbn 배열로 별점 통계 가져오기
	 * @param isbn
	 * @return
	 */
	public HashMap<String,Object> selectBookStarRating(String isbn);

	/**
	 * 명대사 리스트 전체 출력
	 * @param paging 
	 * @return
	 */
	public List<BookBest> selectAll(BookRecomPaging paging);

	/**
	 * 시상식 총 게시글 수 
	 * @return
	 */
	public int selectTotalCntByAwards();

	/**
	 * 시상식 리스트 전체 출력
	 * @return
	 */
	public List<HashMap<String, Object>> selectAll();

	/**
	 * isbn, userno를 이용해 북마크 상태 조회
	 * @param bookMark
	 * @return
	 */
	public int selectBookMarkByKeyUserno(BookMark bookMark);

	/**
	 * key, userno를 이용해 북마크 상태 제거
	 * @param bookMark
	 */
	public void deleteBookMarkByKeyUserno(BookMark bookMark);

	/**
	 * key, userno를 이용해 북마크 상태 삽입
	 * @param bookMark
	 */
	public void insertBookMarkByKeyUserno(BookMark bookMark);

	/**
	 * bookStarRatingkey,userno,age,starRating 삽입하기 
	 * @param bookStarRating
	 */
	public void insertBookStarRaingByRatingKeyUsernoAge(BookStarRating bookStarRating);

	/**
	 * isbn을 가지고 평균 구하기
	 * @param isbn
	 * @return
	 */
	public HashMap<String, Object> selectBookStarRatingByIsbn(String isbn);


	

}
