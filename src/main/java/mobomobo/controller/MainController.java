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
import mobomobo.dto.Market;
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
		List<Market> marketList = mainService.getMarketList();
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("bookList", bookList);
		model.addAttribute("marketList", marketList);
	}
	
	@RequestMapping(value="/footer/starRatingCount")
	public @ResponseBody int starRatingCount() {
		
		int msc = mainService.getMovieStarRatingCount();
		
		return msc;
	}
	

	@RequestMapping(value="/errorpage2")
	public String moviebesterrorpage2() {
		
		
		return "/mobo/errorpage2";
	}
	
	
}
