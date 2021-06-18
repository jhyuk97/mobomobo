package mobomobo.controller;

import java.io.IOException;
import java.io.Writer;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mobomobo.dto.BookMark;
import mobomobo.dto.Movie;
import mobomobo.dto.MovieAward;
import mobomobo.dto.MovieBest;
import mobomobo.dto.MovieBestComment;
import mobomobo.dto.MovieBestCommentLike;
import mobomobo.dto.MovieBestImg;
import mobomobo.dto.MovieBestLike;
import mobomobo.dto.MovieCrawler;
import mobomobo.dto.MovieStarRating;
import mobomobo.dto.UserImg;
import mobomobo.dto.UserInfo;
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
		
		List<MovieCrawler> crawler = movieService.getMovieCrawler(result.getTitle(), result.getDirectors());
		
		
		model.addAttribute("movie", result); //영화 정보
		model.addAttribute("bookmarkflag", flag); //북마크 정보
		model.addAttribute("list", list); //이 감독의 다른작품
		model.addAttribute("crawler", crawler);
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
	public String moviebestdetail(MovieBest viewMovieBest, UserImg userImg, UserInfo userInfo, MovieBestCommentLike movieBestCommentLike, MovieBestComment movieBestComment, MovieBestImg movieBestImg, Model model, HttpSession session,@RequestParam(value="movieBestNo", required=false) int movieBestNo) {
		
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
		
		//댓글 추천 조회
		MovieBestCommentLike movieBestCommentLike1 = new MovieBestCommentLike();
		movieBestCommentLike1.setMovieBestNo(viewMovieBest.getMovieBestNo());
		movieBestCommentLike1.setCommentNo(movieBestComment.getCommentNo()); //명장면 게시판 게시글 번호
			//	movieBestCommentLike1.setId((String)session.getAttribute("id")); //로그인 아이디
				
				
				//댓글 추천 상태 전달
			List <MovieBestCommentLike> movieBestCommentLikeList = movieService.getMovieBestCommentLikeList(movieBestNo); //댓글 좋아요 리스트
			boolean isMovieBestCommentLike = movieService.isMovieBestCommentLike(movieBestCommentLike);
			model.addAttribute("isMovieBestCommentLike", isMovieBestCommentLike);
			model.addAttribute("cntMovieBestCommentLike", movieService.getTotalCntMovieBestCommentLike(movieBestCommentLike));
			model.addAttribute("movieBestCommentLikeList", movieBestCommentLikeList);
			
			
			
			//명장면 게시판 북마크 
			BookMark bookmark = new BookMark();
			bookmark.setKey(movieBestNo+"");
			bookmark.setTitle((String) session.getAttribute("title"));
			bookmark.setUserno((int)session.getAttribute("userno"));	
			
			boolean isMovieBestBookmark = movieService.checkBookMark(bookmark);
			
			model.addAttribute("bookmark", isMovieBestBookmark);
				

	
		//댓글 목록 전달
		
		List<MovieBestComment> movieBestCommentList = movieService.getMovieBestCommentList(movieBestNo);
		
		//유저 이미지 보여주기 
		List<UserImg> imglist = movieService.viewUserImg(movieBestCommentList);
		
		
		model.addAttribute("movieBestCommentList", movieBestCommentList);
		model.addAttribute("imglist", imglist);
		
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

	@RequestMapping(value="/awardList")
	public void awardList(Model model) {
		
		List<MovieAward> list = movieService.getAwardList();
		
		model.addAttribute("list", list);
	}
	
	
	@RequestMapping(value = "/like/comment")
	public ModelAndView moviebestlikecommentlike(MovieBestComment movieBestComment, MovieBestCommentLike movieBestCommentLike, ModelAndView mav, HttpSession session, @RequestParam(value="commentNo", required=false) int commentNo) {
	
		
	
		
		//추천 정보 토글
		movieBestCommentLike.setId((String) session.getAttribute("id"));
		movieBestCommentLike.setCommentNo(commentNo); 
		movieBestComment.setCommentNo(commentNo);
		
		
		
		
		boolean result = movieService.movieCommentlike(movieBestCommentLike);
		
		
		//-------------DB 저장 
		
		//추천 수 조회
		int cnt = movieService.getTotalCntMovieBestCommentLike(movieBestCommentLike);
		
		logger.info("@@@@@@@@@@@@@@@@@@ 현재 추천수 - : {}",cnt );
		
		mav.addObject("result", result);
		mav.addObject("cnt", cnt);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="/moviebest/bookmark", method=RequestMethod.POST)
	public ModelAndView moviebestbookmark(BookMark bookmark, ModelAndView mav) {
		
		logger.info("{}",bookmark);
		
		boolean isMovieBestBookmark = movieService.CheckMovieBestBookmark(bookmark);
		
		mav.setViewName("jsonView");
		
		if(isMovieBestBookmark) {
			movieService.RemoveMovieBestBookmark(bookmark);
			mav.addObject("check", isMovieBestBookmark);
			
		}else {
			movieService.AddMovieBestBookmark(bookmark);
			mav.addObject("check", isMovieBestBookmark);
		}
		
		return mav;
	}
	
	
	
	
}
