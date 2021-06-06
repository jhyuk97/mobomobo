package mobomobo.dao.face;

import java.util.List;

import mobomobo.dto.BookBest;
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
	public List<BookBest> selectList(BookBestPaging paging);

	/**
	 * bookbest 테이블에 삽입
	 * @param info
	 */
	public void insertBookBest(BookBest info);

}
