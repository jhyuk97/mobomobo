package mobomobo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mobomobo.dto.BookMark;
import mobomobo.dto.BookStarRatingInsert;
import mobomobo.service.face.BookRecomService;

@Controller
@RequestMapping(value="/mobo/book")
public class BookRecomController {

	// 로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(BookRecomController.class);
	
	@Autowired BookRecomService bookRecomService;
	
	
	@RequestMapping(value="/bookrecom",method = RequestMethod.GET)
	public void main() { 
		logger.info("/mobo/book/bookrecom [GET]");
		
		
		
		
	}
	@RequestMapping(value="/bookrecom",method = RequestMethod.POST)
	public@ResponseBody List<HashMap<String,Object>> main(@RequestParam(value="isbn[]", required=false) String[] isbn, Model model) { 
		logger.info("/mobo/book/bookrecom [POST]");
		for(int i=0;i<isbn.length;i++) {
			logger.info(isbn[i]);
		}
		List<HashMap<String,Object>>list = bookRecomService.getRating(isbn);
		
		
//		for(int i = 0; i< list.size(); i++) {
//			logger.debug(list.get(i).toString());
//		}
		
		
		
		return list;
		
	}
	
	@RequestMapping(value="/awardsList",method = RequestMethod.GET)
	public void awards(){
		logger.info("/mobo/book/awardsList");
		
	}
	@RequestMapping(value="/awardsList",method = RequestMethod.POST )
	public @ResponseBody List<HashMap<String,Object>> awardsProc(){
		List<HashMap<String,Object>> list = bookRecomService.getList();

		
		logger.debug("{}",list.toString());
		return list;
	}
	@RequestMapping(value="/detail",method = RequestMethod.GET)
	public void detail(String isbn, HttpSession session, Model model) {
		logger.info("/mobo/book/detail [GET]");
		
		logger.debug(isbn.substring(0,isbn.indexOf(" ")));
		// 북마크 확인
		boolean bookMarkState = bookRecomService.getBookMarkInfo(isbn.substring(0,isbn.indexOf(" ")),session);
		
		logger.debug("{}",bookMarkState);
		// 평점 조회
		
		HashMap<String,Object> avg = bookRecomService.getDetailAvg(isbn.substring(0,isbn.indexOf(" ")));
		
		logger.debug("{}",avg);
		
		
		// 
		
		model.addAttribute("bookMark",bookMarkState);
		model.addAttribute("avg",avg);
		model.addAttribute("isbn",(String)isbn.substring(0,isbn.indexOf(" ")));
	}
	
	
	
	@RequestMapping(value="/bookMark", method = RequestMethod.POST)
	public @ResponseBody boolean bookMark(BookMark bookMark,HttpSession session) {
		logger.info("/mobo/book/bookMark [POST]");
		logger.info("{}",bookMark.toString());
		
		BookMark bookMarkInfo = bookRecomService.saveBookMarkInfo(bookMark,session);
		
		boolean isBookMark = bookRecomService.getBookMarkInfo(bookMark.getKey(),session);
		// 안에 있으면 삭제 
		if(isBookMark) {
			bookRecomService.deleteBookMark(bookMarkInfo);
		} else {	// 없으면 삽입
			bookRecomService.insertBookMark(bookMarkInfo);
		}
		
		logger.debug("{}",bookRecomService.getBookMarkInfo(bookMark.getKey(),session));
		
		return isBookMark;
		
		
	}
	
	@RequestMapping(value="/starRatingInsert")
	public void insertStarRating(BookStarRatingInsert bookStarRating,HttpSession session) {
		logger.info("/mobo/book/starRatingInsert");
		
		
		int usernum = (int) session.getAttribute("userno");
		bookStarRating.setUserno(usernum);
		bookStarRating.setAge( Integer.parseInt((String) session.getAttribute("age")) );
		logger.debug("{}",bookStarRating.toString());
		
		// bookkey테이블에 존재의 유무
		if(bookRecomService.isBookKeyExist(bookStarRating)) {
			logger.info("존재한다.");
			
			// 별점 업데이트
			bookRecomService.updateBookStarRating(bookStarRating);
		} else {
			logger.info("존재하지않는다.");
			bookRecomService.insertBookStarRating(bookStarRating);
		}
		
		
	}
	
	@RequestMapping(value="/ageDistribtion", method = RequestMethod.GET)
	public @ResponseBody List<HashMap<String, Object>> ageDistribtion(String isbn) {
		logger.info("/mobo/book/ageDistribtion [GET]");
		logger.debug(isbn);
		
		
		List<HashMap<String, Object>>list = bookRecomService.getAgeAvg(isbn);
		
		for(Map d: list) {
			logger.debug("{}",d);
		}
		
		return list;
		
	}
	
	
	
}
