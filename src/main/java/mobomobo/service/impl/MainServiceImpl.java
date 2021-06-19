package mobomobo.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mobomobo.dao.face.MainDao;
import mobomobo.dto.BookStarRating;
import mobomobo.dto.Market;
import mobomobo.dto.MarketImg;
import mobomobo.dto.MovieStarRating;
import mobomobo.service.face.MainService;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	MainDao mainDao;
	
	@Override
	public List<MovieStarRating> getMovieStarRatingList() {
		return mainDao.selectGroupByStarRatingAvg();
	}
	
	@Override
	public int getMovieStarRatingCount() {
		return mainDao.selectMovieStarRatingCount();
	}

	@Override
	public List<BookStarRating> getBookStarRatingList() {
		return mainDao.selectGroupByBookStarRatingAvg();
	}

	@Override
	public List<Market> getMarketList() {
		// TODO Auto-generated method stub
	
		
		List<Market> mList = mainDao.selectMarketList();

		//중고마켓 이미지 조회
		List<MarketImg> imgList = mainDao.selectmImgList();
		
		
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

	
	

}
