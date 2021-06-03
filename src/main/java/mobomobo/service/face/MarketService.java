package mobomobo.service.face;

import java.util.List;


import mobomobo.dto.Market;
import mobomobo.dto.MarketImg;
import mobomobo.util.Paging;

public interface MarketService {
	
	
	//중고마켓 전체 조회
	public List<Market> SelectAll(Paging inData);
	
	
	//페이징 객체 생성
	public Paging getPaging(Paging inData);
	
	
	//상세보기 조회
	public Market Select(int mNo);
	
	
	//상세보기 이미지조회
	public List<MarketImg> SelectFile(int mNo);
}
