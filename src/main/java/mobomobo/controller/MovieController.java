package mobomobo.controller;

import java.io.IOException;
import java.util.ArrayList;
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

import mobomobo.dto.BookMark;
import mobomobo.dto.Movie;
import mobomobo.dto.MovieAward;
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
	
	//영화 추천게시판 메인 리스트 조회
	@RequestMapping(value="/movierecom", method=RequestMethod.GET)
	public void movie(Model model) throws IOException, ParseException {
	
		List<Movie> list1 = movieService.getMainList("잭 스나이더");
		List<Movie> list2 = movieService.getMainList("클린트 이스트우드");
		List<MovieAward> list3 = movieService.getRecomList();
		
		Movie movie1 = movieService.getMovieSearchOne("하울의 움직이는 성");
		Movie movie2 = movieService.getMovieSearchOne("센과 치히로의 행방불명");
		Movie movie3 = movieService.getMovieSearchOne("모노노케 히메");
		Movie movie4 = movieService.getMovieSearchOne("천공의 성 라퓨타");
		
		List<Movie> list4 = new ArrayList<>();
		list4.add(movie1);
		list4.add(movie2);
		list4.add(movie3);
		list4.add(movie4); 
		
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("list1", list1); //잭 스나이더 감독 작품
		map.put("list2", list2); //클린트 이스트우드 감독 작품
		map.put("list3", list3); //무부 추천영화
		map.put("list4", list4); //지브리 스튜디오 영화
		
		model.addAttribute("map", map);
	}
	
	//영화 추천게시판 검색 결과 조회
	@RequestMapping(value="/movierecomList", method=RequestMethod.GET)
	public @ResponseBody List<Movie> movieProc(String search, int curpage) throws IOException, ParseException  {
		
		List<Movie> list = movieService.getList(search, curpage);
		
		return list; //검색 결과
	}
	
	//영화 추천게시판 검색결과 페이징
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
	
	//영화 추천게시판 영화 상세보기
	@RequestMapping(value="/movierecomDetail")
	public void movierecomDetail(Movie movie, Model model, HttpSession session) throws IOException, ParseException {
		
		Movie result = movieService.getMovieInfo(movie);
		
		BookMark bookmark = new BookMark();
		
		bookmark.setKey(movie.getKey());
		bookmark.setUserno((int)session.getAttribute("userno"));
		
		boolean flag = movieService.checkBookMark(bookmark);
		List<Movie> list = movieService.getMainList(result.getDirectors());
		
		model.addAttribute("movie", result); //영화 정보
		model.addAttribute("bookmarkflag", flag); //북마크 정보
		model.addAttribute("list", list); //이 감독의 다른작품
	}
	
	//영화 추천게시판 별점 입력
	@RequestMapping(value="/starRatingInsert")
	public @ResponseBody void starRatingInsert(MovieStarRating movieStarRating, HttpSession session) {
		
		movieStarRating.setUserno((int)session.getAttribute("userno"));
		movieStarRating.setAge((String)session.getAttribute("age")); 
		
		movieService.setStarRating(movieStarRating);
	}
	
	//영화 추천게시판 별점 등록 여부
	@RequestMapping(value="/starRatingCheck")
	public @ResponseBody double starRatingCheck(MovieStarRating movieStarRating, HttpSession session) {
		
		movieStarRating.setUserno((int)session.getAttribute("userno"));
		
		double starRating = movieService.checkStarRating(movieStarRating);
		
		return starRating; //별점 등록 정보
	}
	
	//영화 추천게시판 연령별 별점 평균
	@RequestMapping(value="/starRatingAvg")
	public @ResponseBody List<MovieStarRating> starRatingAvg(String key) {
		
		List<MovieStarRating> list = movieService.getStarAvg(key); 

		return list; //연령별 별점 평균
	}
	
	//영화 추천게시판 북마크 등록/해제
	@RequestMapping(value="/bookmark")
	public @ResponseBody boolean bookmark(BookMark bookmark) {
		
		boolean flag = movieService.manageBookMark(bookmark);
		
		return flag; //북마크 상태
	}
	
	//영화 추천게시판 해당 영화 평균 별점 조회
	@RequestMapping(value="/starAvgOfSingle")
	public @ResponseBody String starAvgOfSingle(String key) {
		
		String res = movieService.getStarAvgOfSingle(key);
		
		return res;
	}
	
	@RequestMapping(value="/moviedetail", method=RequestMethod.GET)
	public void moviebestdetail() {
		
		logger.info("영화 명장면 게시판 상세 페이지 ");
	
	}
	
	
}
