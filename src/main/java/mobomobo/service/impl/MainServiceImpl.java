package mobomobo.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mobomobo.dao.face.MainDao;
import mobomobo.dto.BookStarRating;
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
	
	

}
