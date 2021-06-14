package mobomobo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mobomobo.dto.BookKey;
import mobomobo.service.face.BookFamousLineService;
import mobomobo.service.face.BookRecomService;
import mobomobo.util.BookBestPaging;

@Controller
@RequestMapping(value="/admin/book")
public class AdminBookRecomController {
	private static final Logger logger = LoggerFactory.getLogger(AdminBookRecomController.class);

	@Autowired BookRecomService bookRecomService;
	
	@RequestMapping(value="/bookRecom")
	public void Recom(Model model, BookBestPaging inData) {	
		logger.info("/bookRecom");
		BookBestPaging paging = bookRecomService.getAdminPaging(inData);
		
		List<BookKey> list = bookRecomService.getAdminRecomList(paging);
		
		model.addAttribute("list",list);
		
	}
	
	
	@RequestMapping(value="/recomDelete")
	public String delete(BookKey bookKey) {
		logger.info("/recomDelete");
		bookRecomService.deleteRecom(bookKey);
		return "redirect:/admin/book/bookRecom";
	}
	@RequestMapping(value="/recomWrite")
	public void write() {
		logger.info("/recomWrite [GET]");
		
	}
	@RequestMapping(value="/recomWrite",method = RequestMethod.POST)
	public String writeProc(BookKey bookKey) {
		logger.info("/recomDelete [POST]");
		logger.info(bookKey.toString());
		bookRecomService.insertBookKey(bookKey);
		return "redirect:/admin/book/bookRecom";
	}
	
}
