package mobomobo.dao.face;

import java.util.HashMap;
import java.util.List;

import mobomobo.dto.Debate;
import mobomobo.dto.DebateComment;
import mobomobo.dto.DebateHot;
import mobomobo.util.DebatePaging;

public interface MovieDebateDao {

	/**
	 * 
	 * 
	 * @return
	 */
	public int selectDebateCntAll(DebatePaging paging);

	/**
	 * 
	 * @param paging
	 * @return
	 */
	public List<Debate> selectDebateList(DebatePaging paging);

	/**
	 * 
	 * @param debate
	 * @return
	 */
	public Debate selectByDebateNo(Debate debate);

	/**
	 * 
	 * @param debate
	 */
	public void updateHit(Debate debate);

	/**
	 * 
	 * @param debate
	 */
	public void insertDebate(Debate debate);

	/**
	 * 추천 테이블 번호 조회
	 * @return
	 */
	public int selectDebateHotNo();

	/**
	 * 추천 테이블에 있는지 없는지 조회
	 * @param data
	 * @return
	 */
	public int selectDebateHotBydNouserNo(DebateHot data);

	/**
	 * 추천 삽입
	 * @param data
	 */
	public void insertDebateHot(DebateHot data);

	/**
	 * 추천 삭제
	 * @param data
	 */
	public void deleteDebateHot(DebateHot data);

	/**
	 * 전체 추천수 조회
	 * @return
	 */
	public int selectAllDebateHot(DebateHot data);

	/**
	 * 댓글 삽입 
	 * @param debatecomment - 댓글정보 
	 */
	public void insertComment(DebateComment debatecomment);

	/**
	 * 댓글 목록 조회 
	 * @param debatecomment - 게시글번호 
	 * @return 댓글 목록 
	 */
	public List<DebateComment> selectCommentList(DebateComment debatecomment);
	
	/**
	 * 댓글 삭제 
	 * @param debatecomment - 댓글번호 
	 */
	public void deleteCommentBydcNo(DebateComment debatecomment);

	public int commentLikeState(DebateComment debatecomment);
	public void insertCommentLike(DebateComment debatecomment);
	public void deleteCommentLike(DebateComment debatecomment);

	/**
	 * Hot 리스트 목록 조회 
	 * @param category 
	 * @return
	 */
	public List<HashMap<String, Object>> selectHot(int category);

	/**
	 * 게시글 삭제 
	 * @param debate
	 */
	public void deleteDebate(Debate debate);

	/**
	 * 게시글 수정 
	 * @param debate
	 */
	public void updateDebate(Debate debate);
	
	
}
