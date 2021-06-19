package mobomobo.service.face;

import java.util.List;

import mobomobo.dto.Debate;
import mobomobo.util.DebatePaging;

public interface AdminDebateService {

	DebatePaging mdebatePaging(DebatePaging inData);

	List<Debate> getmDebateList(DebatePaging paging);

}
