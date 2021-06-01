package mobomobo.service.face;

import java.util.List;


import mobomobo.admin.util.Paging;
import mobomobo.dto.Market;

public interface MarketService {
	public List<Market> SelectAll(Paging inData);
	public Paging getPaging(Paging inData);
}
