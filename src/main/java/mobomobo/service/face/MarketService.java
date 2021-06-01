package mobomobo.service.face;

import java.util.List;


import mobomobo.dto.Market;
import mobomobo.util.Paging;

public interface MarketService {
	public List<Market> SelectAll(Paging inData);
	public Paging getPaging(Paging inData);
}
