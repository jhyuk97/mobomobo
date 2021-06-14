package mobomobo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mobomobo.dto.BookStarRating;
import mobomobo.dto.MovieStarRating;
import mobomobo.service.face.MainService;

@Controller
@RequestMapping(value="/mobo")
public class MainController {
	
	//로깅객체
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	MainService mainService;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void main(Model model) {
		
		List<BookStarRating> bookList = mainService.getBookStarRatingList();
		List<MovieStarRating> movieList = mainService.getMovieStarRatingList();
		
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("bookList", bookList);
	}
	
	@RequestMapping(value="/footer/starRatingCount")
	public @ResponseBody int starRatingCount() {
		
		int msc = mainService.getMovieStarRatingCount();
		
		return msc;
	}
	
//이거는 왜한거에요?? 에러페이지 jsp 테스트염ㅋ 혹시 저거 지우고하면 에러 안나요? ㅠ....저거 지워도 이제 ㅇ돌아올수없는강을건넛어염ㅋ
	@RequestMapping(value="/errorpage2")
	public String moviebesterrorpage2() {
		
		
		return "/mobo/errorpage2";
	}
	
	
}
