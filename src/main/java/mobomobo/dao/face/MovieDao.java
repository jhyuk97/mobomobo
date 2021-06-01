package mobomobo.dao.face;

import mobomobo.dto.MovieStarRating;

public interface MovieDao {

	public void deleteStarRating(MovieStarRating movieStarRating);

	public void insertStarRating(MovieStarRating movieStarRating);

	public double selectMovieStarRatingByUserno(MovieStarRating movieStarRating);

	public int existMovieStarRatingByUserNo(MovieStarRating movieStarRating);


}
