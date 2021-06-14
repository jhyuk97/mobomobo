package mobomobo.service.face;

import java.util.List;

import javax.servlet.http.HttpSession;

import mobomobo.dto.BookMark;
import mobomobo.dto.Debate;
import mobomobo.dto.DebateHot;
import mobomobo.util.DebatePaging;

public interface MovieDebateService {

	/**
	 * 
	 * @param paging
	 * @return
	 */
	public DebatePaging debatePaging(DebatePaging paging);

	/**
	 * 
	 * @param paging
	 * @return
	 */
	public List<Debate> getDebateList(DebatePaging paging);

	/**
	 * 
	 * @param debate
	 * @return
	 */
	public Debate detail(Debate debate);

	/**
	 * 
	 * @param debate
	 */
	public void debateWrite(Debate debate);

	/**
	 * 
	 * @param debate
	 */
	public void debateDelete(Debate debate);

	/**
	 * 
	 * @param debate
	 */
	public void debateUpdate(Debate debate);
	
	/**
	 * 북마크 객체 저장
	 * @param debateHot
	 * @param session
	 * @return
	 */
	public DebateHot getDebateHot(DebateHot debateHot, HttpSession session);

	/**
	 * 추천 유무 검사
	 * @param data
	 * @return
	 */
	public boolean isExsitDebateHot(DebateHot data);

	/**
	 * 추천 삽입
	 * @param data
	 */
	public void insertLike(DebateHot data);
	/**
	 * 추천 삭제
	 * @param data
	 */
	public void deleteLike(DebateHot data);

	/**
	 * 카운트 조회
	 * @param data
	 * @return
	 */
	public int getLikeCnt(DebateHot data);

	

	
}
