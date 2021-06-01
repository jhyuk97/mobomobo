package mobomobo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mobomobo.dto.Movie;
import mobomobo.dto.MovieStarRating;
import mobomobo.service.face.MovieService;

@Controller
@RequestMapping(value="/mobo/movie")
public class MovieController {
	
	@Autowired
	MovieService movieService;
	
	//로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@RequestMapping(value="/moviebestboard", method=RequestMethod.GET)
	public void moviebest() {
		
		logger.info("명장면 게시판 ");
	
	}
	
	@RequestMapping(value="/movierecom", method=RequestMethod.GET)
	public void movie(Model model) throws IOException, ParseException {
	
		List<Movie> list1 = movieService.getMainList("잭 스나이더");
		List<Movie> list2 = movieService.getMainList("클린트 이스트우드");
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("list1", list1);
		map.put("list2", list2);
		
		model.addAttribute("map", map);
	}
	
	@RequestMapping(value="/movierecomList", method=RequestMethod.GET)
	public @ResponseBody List<Movie> movieProc(String search, int curpage) throws IOException, ParseException  {
		
		List<Movie> list = movieService.getList(search, curpage);
		
		return list;
	}
	
	@RequestMapping(value="/movierecomListPaging")
	public @ResponseBody int movierecomPaging(String search) throws IOException, ParseException  {
		
		int listCnt = movieService.getListCnt(search);
		
		int totalPaging = 0;
		
		if((listCnt%8) == 0 ) {
			totalPaging = listCnt/8;
		} else {
			totalPaging = (listCnt/8) + 1;
		}

		return totalPaging;
				
	}
	
	@RequestMapping(value="/movierecomDetail")
	public void movierecomDetail(Movie movie, Model model) throws IOException, ParseException {
		
		Movie result = movieService.getMovieInfo(movie);
		
		model.addAttribute("movie", result);
	}
	
	@RequestMapping(value="/starRatingInsert")
	public @ResponseBody void starRatingInsert(MovieStarRating movieStarRating, HttpSession session) {
		
		movieStarRating.setUserno((int)session.getAttribute("userno"));
		movieStarRating.setAge((String)session.getAttribute("age")); 
		
		movieService.setStarRating(movieStarRating);
	}
	
	@RequestMapping(value="/starRatingCheck")
	public @ResponseBody double starRatingCheck(MovieStarRating movieStarRating, HttpSession session) {
		
		movieStarRating.setUserno((int)session.getAttribute("userno"));
		
		double starRating = movieService.checkStarRating(movieStarRating);
		
		return starRating;
	}
	
	@RequestMapping(value="/moviedetail", method=RequestMethod.GET)
	public void moviebestdetail() {
		
		logger.info("영화 명장면 게시판 상세 페이지 ");
	
	}
	
	
}
