package mobomobo.dao.face;

import java.util.List;

import mobomobo.dto.Debate;
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
	
	
}
