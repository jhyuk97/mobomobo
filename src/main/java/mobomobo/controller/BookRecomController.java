package mobomobo.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mobomobo.dto.BookKey;
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
	public void detail(String isbn,String avg, Model model) {
		logger.info("/mobo/book/detail [GET]");
		
		logger.debug(isbn.substring(0,isbn.indexOf(" ")));
		logger.debug(avg);
		model.addAttribute("avg",avg);
		model.addAttribute("isbn",isbn.substring(0,isbn.indexOf(" ")));
	}
	
	
	
}
