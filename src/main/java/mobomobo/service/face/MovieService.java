package mobomobo.service.face;

import java.io.IOException;
import java.util.List;

import org.json.simple.parser.ParseException;

import mobomobo.dto.Movie;

public interface MovieService {

	public List<Movie> getList(String search, int curpage) throws IOException, ParseException;

	public int getListCnt(String search) throws IOException, ParseException;

}
