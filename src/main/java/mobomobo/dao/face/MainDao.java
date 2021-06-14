package mobomobo.dao.face;

import java.util.HashMap;
import java.util.List;

import mobomobo.dto.BookStarRating;
import mobomobo.dto.MovieStarRating;

public interface MainDao {

	public List<MovieStarRating> selectGroupByStarRatingAvg();

	public int selectMovieStarRatingCount();

	public List<BookStarRating> selectGroupByBookStarRatingAvg();

}
