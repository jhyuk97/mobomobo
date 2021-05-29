package mobomobo.controller;

import java.io.IOException;
import java.util.List;

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
	public void movie() {
		
		logger.info("영화 추천 게시판 ");
	
	}
	
	@RequestMapping(value="/movierecomList", method=RequestMethod.GET)
	public @ResponseBody List<Movie> movieProc(String search, int curpage) throws IOException, ParseException  {
		
		logger.info("검색어 : {}", search);
		
		System.out.println("curpage " + curpage);
		
		List<Movie> list = movieService.getList(search, curpage);
		
		return list;
	}
	
	@RequestMapping(value="/movierecomListPaging")
	public @ResponseBody int movierecomPaging(String search) throws IOException, ParseException  {
		
		int listCnt = movieService.getListCnt(search);
		
		int totalPaging = 0;
		
		if((listCnt%6) == 0 ) {
			totalPaging = listCnt/6;
		} else {
			totalPaging = (listCnt/6) + 1;
		}

		return totalPaging;
				
	}
	
	@RequestMapping(value="/moviedetail", method=RequestMethod.GET)
	public void moviebestdetail() {
		
		logger.info("영화 명장면 게시판 상세 페이지 ");
	
	}
	
	
}
