package mobomobo.service.face;

import java.util.HashMap;
import java.util.List;

import mobomobo.dto.BookBest;
import mobomobo.dto.BookKey;
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

}
