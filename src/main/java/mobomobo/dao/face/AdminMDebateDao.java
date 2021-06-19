package mobomobo.dao.face;

import java.util.List;

import mobomobo.dto.Debate;
import mobomobo.util.DebatePaging;

public interface AdminMDebateDao {

	public int selectDebateCntAll(DebatePaging inData);

	public List<Debate> selectDebateList(DebatePaging paging);

}
