package mobomobo.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import mobomobo.dto.BookBest;
import mobomobo.dto.BookBestComment;
import mobomobo.dto.BookBestCommentLike;
import mobomobo.dto.BookBestImg;
import mobomobo.dto.BookBestLike;
import mobomobo.dto.BookMark;
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
	 * ajax로 보내줄 추천개수
	 * @param bookBestLike
	 * @return
	 */
	public int viewLike(BookBestLike bookBestLike);

	/**
	 * 첫화면에 보여질 추천 개수
	 * @return
	 */
	public int viewLike(String bookBestno);
	/**
	 * 북마크 확인 및 개수
	 * @param bookMark
	 * @return
	 */
	public int viewBookMark(BookMark bookMark);
	
	/**
	 * 첫화면에 보여질 북마크 상태
	 * @param bookBestno
	 * @param session
	 * @return
	 */
	public boolean viewBookMark(String bookBestno, HttpSession session);

	/**
	 * 댓글 dto 정보 저장
	 * @param bookBestComment
	 * @param session
	 * @return
	 */
	public BookBestComment getBookBestComment(BookBestComment bookBestComment, HttpSession session);

	/**
	 * 댓글 등록
	 * @param info
	 */
	public void insert(BookBestComment info);

	/**
	 * 삽입후 댓글 바로 불러오기
	 * @param info
	 * @return
	 */
	public BookBestComment getComment(BookBestComment info);

	/**
	 * 댓글 불러오기
	 * @param bookBestno
	 * @return
	 */
	public List<HashMap<String, Object>> getCommentList(String bookBestno);

	/**
	 * 댓글 삭제
	 * @param bookBestComment
	 */
	public void delete(BookBestComment bookBestComment);

	/**
	 * 댓글 추천
	 * @param bookBestCommentlike
	 * @return 
	 */
	public boolean viewCommentLike(BookBestCommentLike bookBestCommentlike);

	/**
	 * 코맨트 추천 개수
	 * @param bookBestCommentlike
	 * @return
	 */
	public int getCommentCnt(BookBestCommentLike bookBestCommentlike);

}

