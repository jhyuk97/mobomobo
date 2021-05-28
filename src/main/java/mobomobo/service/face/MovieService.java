package mobomobo.service.face;

import java.io.IOException;
import java.util.List;

import org.json.simple.parser.ParseException;

import mobomobo.dto.Movie;

public interface MovieService {

	List<Movie> getList(String search) throws IOException, ParseException;

}
