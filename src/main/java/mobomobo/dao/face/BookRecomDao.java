package mobomobo.dao.face;

import java.util.HashMap;
import java.util.List;

import mobomobo.dto.BookBest;
import mobomobo.dto.BookKey;
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


	

}
