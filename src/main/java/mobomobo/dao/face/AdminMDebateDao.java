package mobomobo.dao.face;

import java.util.HashMap;
import java.util.List;

import mobomobo.dto.Debate;
import mobomobo.util.DebatePaging;

public interface AdminMDebateDao {

	public int selectDebateCntAll(DebatePaging inData);

	public List<Debate> selectDebateList(DebatePaging paging);
	
	/**
	 * 게시글 삭제
	 * @param dNo - 삭제할 게시글
	 */
	public void dNoDelete(Debate dNo);
	
	/**
	 * 해당 게시글이 삭제 됬는지 검사
	 * @param dNo - 검색할 게시글
	 * @return
	 */
	public int countdNo(Debate dNo);
	
	/**
	 * 관리자 페이지에서 영화 hot 게시판 출력
	 * @param category
	 * @return
	 */
	public List<HashMap<String, Object>> selectHot(int category);

}
