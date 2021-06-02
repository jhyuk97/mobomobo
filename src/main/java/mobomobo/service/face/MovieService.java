package mobomobo.service.face;

import java.io.IOException;
import java.util.List;

import org.json.simple.parser.ParseException;

import mobomobo.dto.Movie;
import mobomobo.dto.MovieStarRating;

public interface MovieService {

	public List<Movie> getList(String search, int curpage) throws IOException, ParseException;

	public int getListCnt(String search) throws IOException, ParseException;

	public List<Movie> getMainList(String directorName) throws IOException, ParseException;

	public Movie getMovieInfo(Movie movie) throws IOException, ParseException;

	public void setStarRating(MovieStarRating movieStarRating);

	public double checkStarRating(MovieStarRating movieStarRating);

	public List<Movie> adminMovieSearchList(String search) throws IOException, ParseException;


}
