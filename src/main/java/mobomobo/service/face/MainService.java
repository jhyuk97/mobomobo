package mobomobo.service.face;

import java.util.HashMap;
import java.util.List;

import mobomobo.dto.BookStarRating;
import mobomobo.dto.MovieStarRating;

public interface MainService {

	public List<MovieStarRating> getMovieStarRatingList();

	public int getMovieStarRatingCount();

	public List<BookStarRating> getBookStarRatingList();

}
