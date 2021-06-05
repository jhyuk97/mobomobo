package mobomobo.controller;

import java.io.IOException;
import java.io.Writer;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mobomobo.dto.Movie;
import mobomobo.dto.MovieBest;
import mobomobo.dto.MovieBestComment;
import mobomobo.dto.MovieBestImg;
import mobomobo.dto.MovieBestLike;
import mobomobo.dto.MovieStarRating;
import mobomobo.service.face.MovieService;
import mobomobo.util.MovieBestPaging;

@Controller
@RequestMapping(value="/mobo/movie")
public class MovieController {
	
	@Autowired
	MovieService movieService;
	
	//로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@RequestMapping(value="/moviebestboard", method=RequestMethod.GET)
	public void moviebest(MovieBestPaging inData, Model model, MovieBestImg movieBestImg, MovieBest movieBest) {
		
		logger.info("명장면 게시판 ");
		
MovieBestPaging paging = movieService.getPaging(inData); 
		
		logger.info(paging.toString()); 
		
		List<MovieBest> list = movieService.list(paging);
		
		List<MovieBestImg> imglist = movieService.imglist();
		
		for( int i=0; i<list.size(); i++ ) {
			logger.info( list.get(i).toString() );
		}
		
		for( int i=0; i<imglist.size(); i++ ) {
			logger.info( imglist.get(i).toString() );
		}
		
		//모델값 전달
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("imglist", imglist);
	
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
	public String moviebestdetail(MovieBest viewMovieBest, MovieBestComment movieBestComment, MovieBestImg movieBestImg, Model model, HttpSession session,@RequestParam(value="movieBestNo", required=false) int movieBestNo) {
		
		logger.info("영화 명장면 게시판 상세 페이지 ");
		
		if(viewMovieBest.getMovieBestNo() <1 ) {
			return "redirect:/mobo/movie/moviebestboard";
		}
		
		//명장면 게시판 상세 정보 
		viewMovieBest = movieService.view(viewMovieBest);
		
		//명장면 게시판 상세 정보 이미지
		List<MovieBestImg> list = movieService.viewImage(viewMovieBest);
		
		logger.debug("상세보기: {}" , viewMovieBest.toString() );
		
		model.addAttribute("view", viewMovieBest);
		model.addAttribute("list", list);
	
		//추천 상태 조회 
		MovieBestLike movieBestLike = new MovieBestLike();
		movieBestLike.setMovieBestNo(viewMovieBest.getMovieBestNo()); //명장면 게시판 게시글 번호
		movieBestLike.setId((String)session.getAttribute("id")); //로그인 아이디 
		
		//추천 전달
		boolean isMovieBestLike = movieService.isMovieBestLike(movieBestLike);
		model.addAttribute("isMovieBestLike", isMovieBestLike);
		model.addAttribute("cntMovieBestLike", movieService.getTotalCntMovieBestLike(movieBestLike));
		
		
		//댓글 목록 전달
		
		List<MovieBestComment> movieBestCommentList = movieService.getMovieBestCommentList(movieBestNo);
		
		model.addAttribute("movieBestCommentList", movieBestCommentList);
		
		return "/mobo/movie/moviedetail";
	
	}
	
	@RequestMapping(value = "/like")
	public ModelAndView recommend(MovieBestLike movieBestLike, ModelAndView mav, HttpSession session) {
		
		//추천 정보 토글
		movieBestLike.setId((String) session.getAttribute("id"));
		boolean result = movieService.movielike(movieBestLike);
		
		//추천 수 조회
		int cnt = movieService.getTotalCntMovieBestLike(movieBestLike);
		
		mav.addObject("result", result);
		mav.addObject("cnt", cnt);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="/comment/insert", method=RequestMethod.POST)
	public String insert(MovieBestComment movieBestComment, Model model, HttpSession session ) {

		movieBestComment.setId((String) session.getAttribute("id"));
		movieBestComment.setNick((String) session.getAttribute("nick"));
		
		movieService.insertMovieBestComment(movieBestComment);
		
		return "redirect:/mobo/movie/moviedetail?movieBestNo="+movieBestComment.getMovieBestNo();
		
	}
	
	@RequestMapping(value="/comment/delete",method=RequestMethod.POST)
	public void delete(MovieBestComment movieBestComment, Writer writer, Model model) {
		
		boolean success = movieService.deleteComment(movieBestComment);
		
		try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		

	}
	
	
	
	
}
