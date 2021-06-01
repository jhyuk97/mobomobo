package mobomobo.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mobomobo.dao.face.MarketDao;
import mobomobo.dto.Market;
import mobomobo.service.face.MarketService;
import mobomobo.util.Paging;

@Service
public class MarketServiceImpl implements MarketService {

	private static final Logger logger = LoggerFactory.getLogger(MarketServiceImpl.class);
	
	@Autowired
	MarketDao marketDao;
	
	@Override
	public List<Market> SelectAll(Paging inData) {
		
		return marketDao.SelectAll(inData);
	}

	@Override
	public Paging getPaging(Paging inData) {
		
		
		//총 게시글 수 조회
		int totalCount = marketDao.SelectCntAll(inData);
		
		
		//페이징 계산
		Paging paging = new Paging(totalCount, inData.getCurPage(), 9);
				
		return paging;
	}
	
}
