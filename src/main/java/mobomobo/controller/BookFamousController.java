package mobomobo.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mobomobo.dto.BookBest;
import mobomobo.dto.BookBestImg;
import mobomobo.dto.BookBestLike;
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
		// 리스트
		List<HashMap<String,Object>> list = bookFamousLineService.getList(paging);
		
		
		
		model.addAttribute("list",list);
		model.addAttribute("paging",paging);
		
	}
	
	
	
	@RequestMapping(value="/famousDetail")
	public void detail(String bookBestno, Model model) {
		logger.info("/mobo/book/famousDetail");
		logger.debug(bookBestno);
		
		BookBest bookBest = bookFamousLineService.getBookBestInfo(bookBestno);
		logger.debug(bookBest.toString());
		BookBestImg img = bookFamousLineService.getBookBestImgInfo(bookBestno);
//		logger.debug(img.toString());
		
		String [] str = bookBest.getBestContext().split("/");
		
		for(int i=0;i<str.length;i++) {
			logger.debug(str[i]);
		}
		
		
		int likeCnt = bookFamousLineService.viewLike(bookBestno);
		
		
		model.addAttribute("likeCnt",likeCnt);
		model.addAttribute("context",str);
		model.addAttribute("detail",bookBest);
		model.addAttribute("img",img);

	}
	
	@RequestMapping(value="/like",method = RequestMethod.GET)
	public @ResponseBody int like (int bookBestno, HttpSession session) {
		logger.info("/mobo/book/like [GET]");
		
		BookBestLike bookBestLike = new BookBestLike();
		
		bookBestLike.setBookBestno(bookBestno);
		bookBestLike.setUserno((int)session.getAttribute("userno"));
		
		
		logger.debug(bookBestLike.toString());
		
		
		int likeCnt = bookFamousLineService.viewLike(bookBestLike);
		
		return likeCnt;
		
	}
	
	
	
	
	
}
