package mobomobo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mobomobo.dto.BookBest;
import mobomobo.service.face.BookFamousLineService;
import mobomobo.util.BookBestPaging;
@Controller
@RequestMapping(value="/mobo/book")
public class BookFamousController {
	// 로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(BookFamousController.class);
		
	@Autowired private BookFamousLineService bookFamousLineService;
	
	@RequestMapping(value="/bookFamous",method = RequestMethod.GET)
	public void bookFamousLine(Model model, BookBestPaging inData) {
		
		
		logger.info("/mobo/book/bookFamous [GET]");
		
		
		BookBestPaging paging = bookFamousLineService.getPaging(inData);
		
		logger.debug(paging.toString());
		
		List<BookBest> list = bookFamousLineService.getList(paging);
		logger.debug(list.toString());
		
		model.addAttribute("list",list);
		model.addAttribute("paging",paging);
		
	}
	
	
	
	
	
	
}
