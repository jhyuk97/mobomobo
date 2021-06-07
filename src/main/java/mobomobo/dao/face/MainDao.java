package mobomobo.dao.face;

import java.util.List;

import mobomobo.dto.MovieStarRating;

public interface MainDao {

	public List<MovieStarRating> selectGroupByStarRatingAvg();

	public int selectMovieStarRatingCount();

}
