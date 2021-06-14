package mobomobo.dao.face;

import java.util.List;

import mobomobo.dto.Debate;
import mobomobo.dto.DebateHot;
import mobomobo.util.DebatePaging;

public interface MovieDebateDao {

	/**
	 * 
	 * 
	 * @return
	 */
	public int selectDebateCntAll();

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
	 * 추천 테이블 번호 조
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
	
	
}
