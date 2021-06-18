package mobomobo.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import mobomobo.dto.Debate;
import mobomobo.dto.DebateComment;
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

	/**
	 * 댓글 작성 
	 * @param debatecomment 댓글정보
	 */
	public void commentWrite(DebateComment debatecomment);

	/**
	 * 댓글 목록 조회 
	 * @param debatecomment 게시글번호
	 * @return 댓글목록 
	 */
	public List<DebateComment> commentList(DebateComment debatecomment);

	/**
	 * 댓글 삭제 
	 * @param debatecomment 댓글번호
	 */
	public void commentDelete(DebateComment debatecomment);
	
	
	public void commentLike(DebateComment debatecomment);

	/**
	 * hot 목록 가져오기 
	 * @param category 
	 * @return
	 */
	public List<HashMap<String, Object>> getHotList(int category);
	

	
}
