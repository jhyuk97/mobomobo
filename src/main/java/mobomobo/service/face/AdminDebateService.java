package mobomobo.service.face;

import java.util.HashMap;
import java.util.List;

import mobomobo.dto.Debate;
import mobomobo.util.DebatePaging;

public interface AdminDebateService {

	DebatePaging mdebatePaging(DebatePaging inData);

	List<Debate> getmDebateList(DebatePaging paging);
	
	/**
	 * 게시글 삭제
	 * @param dNo - 삭제할 게시글
	 * @return 삭제 결과
	 */
	public boolean dNoDelete(Debate dNo);

	List<HashMap<String, Object>> getHotList(int category);

}
