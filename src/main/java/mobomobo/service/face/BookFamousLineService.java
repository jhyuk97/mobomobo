package mobomobo.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import mobomobo.dto.BookBest;
import mobomobo.dto.BookBestImg;
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
	public List<HashMap<String, Object>> getList(BookBestPaging paging);

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
	 * @param img 
	 */
	public void insertBookInfo(BookBest info, BookBestImg img);

	/**
	 * 표제 이미지 dto 저장
	 * @param file
	 * @param bookbest 
	 * @return
	 */
	public BookBestImg saveImg(MultipartFile file, BookBest bookbest);

	/**
	 * 글번호로 글 상세보기 정보 가져오기
	 * @param bookBestno 
	 * @return
	 */
	public BookBest getBookBestInfo(String bookBestno);

	/**
	 * 글번호로 이미지 정보 가져오기 표지 이미지는 1개라서 글번호로는 무조건 하나의 이미지만 조회됨
	 * @param bookBestno
	 * @return
	 */
	public BookBestImg getBookBestImgInfo(String bookBestno);

	/**
	 * 이미지 리스트
	 * @return
	 */
	public List<BookBestImg> getImgList();

	/**
	 * 책 명대사 지우기
	 * @param bookBestno
	 */
	public void delete(String bookBestno);

	/**
	 * 추천 하기
	 * @param bookBestno
	 */
	public void like(String bookBestno);

}
