package mobomobo.dao.face;

import java.util.List;

import mobomobo.dto.Notice;
import mobomobo.util.NoticePaging;

public interface NoticeDao {

	/**
	 * 공지사항 목록의 페이징 처리
	 * @param noticePaging
	 * @return
	 */
	public int selectNoticeCntAll(NoticePaging noticePaging);

	/**
	 * 페이징을 이용하여 notice의 list 만들기
	 * @param noticePaging
	 * @return
	 */
	public List<Notice> selectNoticeList(NoticePaging noticePaging);

	/**
	 * 공지사항 게시글 상세페이지 불러오기 
	 * @param notice
	 * @return
	 */
	public Notice selectByNoticeNo(Notice notice);

	/**
	 * 공지사항 게시글 정보 삽입
	 * 
	 * @param notice - 게시글 정보를 가진 객체
	 */
	public void insert(Notice notice);

	/**
	 * 공지사항 게시글정보를 삭제
	 * 
	 * @param notice - 삭제할 게시글의 글번호 객체
	 */
	public void delete(Notice notice);

	/**
	 * 공지사항 게시글정보를 수정
	 * 
	 * @param notice - 수정할 내용을 가진 게시글 객체
	 */
	public void update(Notice notice);

	/**
	 * 조회하려는 게시글의 조회수를 1 증가시킴
	 * 
	 * @param notice - 게시글번호를 가진 객체
	 */
	public void updateHit(Notice notice);
	
}
