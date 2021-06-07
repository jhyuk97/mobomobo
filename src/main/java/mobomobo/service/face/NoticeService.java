package mobomobo.service.face;

import java.util.List;

import mobomobo.dto.Notice;
import mobomobo.util.NoticePaging;

public interface NoticeService {

	/**
	 * 공지사항 list - 페이징 계산
	 * @param noticePaging
	 * @return
	 */
	public NoticePaging noticePaging(NoticePaging noticePaging);

	/**
	 * 공지사항 list
	 * @param noticePaging 
	 * @return
	 */
	public List<Notice> NoticeList(NoticePaging noticePaging);

	/**
	 * 공지사항 상세페이지 
	 * @param notice
	 * @return
	 */
	public Notice detail(Notice notice);

	/**
	 * 공지사항 작성페이지
	 * 
	 * @param notice -  게시글 정보 객체 DTO
	 */
	public void write(Notice notice);

	/**
	 * 공지사항 상세페이지에서 삭제처리
	 * 
	 * @param notice - 삭제할 게시글의 게시글번호 객체
	 */
	public void delete(Notice notice);

	/**
	 * 공지사항 수정처리
	 * 
	 * @param notice - 게시글 정보 객체 DTO
	 */
	public void update(Notice notice);

}
