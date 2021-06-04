package mobomobo.dao.face;

import java.util.HashMap;
import java.util.List;

import mobomobo.dto.BookMark;
import mobomobo.dto.Movie;
import mobomobo.dto.MovieAward;
import mobomobo.dto.MovieStarRating;

public interface MovieDao {

	public void deleteStarRating(MovieStarRating movieStarRating);

	public void insertStarRating(MovieStarRating movieStarRating);

	public double selectMovieStarRatingByUserno(MovieStarRating movieStarRating);

	public int existMovieStarRatingByUserNo(MovieStarRating movieStarRating);

	public List<MovieStarRating> selectStarAvg(String key);

	public int selectBookMarkByUserNo(BookMark bookmark);

	public void deleteBookMark(BookMark bookmark);

	public void insertBookMark(BookMark bookmark);

	public List<MovieAward> selectRecomList();

	public String selectStarAvgOfSingle(String key);


}
