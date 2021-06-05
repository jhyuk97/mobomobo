package mobomobo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mobomobo.dto.BookBest;
import mobomobo.service.face.BookFamousLineService;
import mobomobo.util.BookBestPaging;

@Controller
@RequestMapping(value="/admin/book")
public class AdminBookFamousController {

	private static final Logger logger = LoggerFactory.getLogger(AdminBookFamousController.class);

	@Autowired
	private BookFamousLineService bookFamousLineService;
	
	
	@RequestMapping("/bookFamous")
	public void list(Model model, BookBestPaging inData) {
		logger.info("/admin/book/bookFamous");
		

		BookBestPaging paging = bookFamousLineService.getPaging(inData);
		
		logger.debug(paging.toString());
		
		List<BookBest> list = bookFamousLineService.getList(paging);
		logger.debug(list.toString());
		
		model.addAttribute("list",list);
		model.addAttribute("paging",paging);
		
	}
	
	@RequestMapping(value="/famousDetail")
	public void detail(BookBest bookBest, Model model) {
		logger.info("/admin/book/famousDetail");
		

	}
	@RequestMapping(value="/famousWrite")
	public void write() {
		logger.info("/admin/book/famousWrite");
		

	}
	
	
}
