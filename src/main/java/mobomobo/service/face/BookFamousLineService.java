package mobomobo.service.face;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	public List<BookBest> getList(BookBestPaging paging);

	/**
	 * 글쓰기 BookBest dto저장
	 * @param bookbest
	 * @param bestContext1
	 * @param bestContext2
	 * @param bestContext3
	 * @param session 
	 * @return
	 */
	public BookBest saveBookBest(BookBest bookbest, String bestContext1, String bestContext2, String bestContext3, HttpSession session);

	/**
	 * 글쓰기 정보 모두 삽입, 이미지, 글내용
	 * @param info
	 */
	public void insertBookInfo(BookBest info);

}
