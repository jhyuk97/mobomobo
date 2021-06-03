package mobomobo.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mobomobo.dao.face.MarketDao;
import mobomobo.dto.Market;
import mobomobo.dto.MarketImg;
import mobomobo.service.face.MarketService;
import mobomobo.util.Paging;

@Service
public class MarketServiceImpl implements MarketService {

	private static final Logger logger = LoggerFactory.getLogger(MarketServiceImpl.class);
	
	@Autowired
	MarketDao marketDao;
	
	@Override
	public List<Market> SelectAll(Paging inData) {
		
		//중고마켓 게시글 조회
		List<Market> mList = marketDao.SelectAll(inData);

		//중고마켓 이미지 조회
		List<MarketImg> imgList = marketDao.selectImg();
		
		
		//이미지리스트 게시글리스트로 추가
		for(int i=0; i<mList.size(); i++) {
			List<String> ogImg = new ArrayList<>();
			List<String> stImg = new ArrayList<>();
			for(MarketImg img : imgList) {
				if(mList.get(i).getmNo() == img.getmNo()) {
					ogImg.add(img.getOriginImg());
					stImg.add(img.getStoredImg());
				}
			}
			
			mList.get(i).setOriginImg(ogImg);
			mList.get(i).setStoredImg(stImg);
		}
		
		
		
		return mList;
	}

	@Override
	public Paging getPaging(Paging inData) {
		
		
		//총 게시글 수 조회
		int totalCount = marketDao.SelectCntAll(inData);
		
		
		//페이징 계산
		Paging paging = new Paging(totalCount, inData.getCurPage(), 9);
				
		return paging;
	}

	@Override
	public Market Select(int mNo) {
		
		return marketDao.Select(mNo);
	}

	@Override
	public List<MarketImg> SelectFile(int mNo) {

		return marketDao.SelectFile(mNo);
	}
	
}
