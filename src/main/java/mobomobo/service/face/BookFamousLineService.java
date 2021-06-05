package mobomobo.service.face;

import java.util.List;

import mobomobo.dto.BookBest;
import mobomobo.util.BookBestPaging;

public interface BookFamousLineService {

	
	/**
	 * 페이징 계산
	 * @param inData
	 * @return
	 */
	BookBestPaging getPaging(BookBestPaging inData);

	/**
	 * 게시판 리스트 가져오기
	 * @param paging
	 * @return
	 */
	List<BookBest> getList(BookBestPaging paging);

}
