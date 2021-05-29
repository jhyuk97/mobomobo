package mobomobo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mobomobo.dto.BookKey;
import mobomobo.service.face.BookRecomService;

@Controller
@RequestMapping(value="/mobo/book")
public class BookRecomController {

	// 로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(BookRecomController.class);
	
	@Autowired BookRecomService bookRecomService;
	
	
	@RequestMapping(value="/bookrecom",method = RequestMethod.GET)
	public void main(String[] isbn) { 
		logger.info("/mobo/book/bookrecom");
		
		
//		for(int i = 0;i<isbn.length;i++) {
//			
//			logger.info(isbn[i]);
//		}
		
		
		
	}
	
	
	
}
