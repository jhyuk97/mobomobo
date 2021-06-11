package mobomobo.service.face;

import java.util.List;

import mobomobo.dto.Debate;
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

	
}
