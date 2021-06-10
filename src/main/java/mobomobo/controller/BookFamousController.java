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
import mobomobo.dto.BookBestComment;
import mobomobo.dto.BookBestCommentLike;
import mobomobo.dto.BookBestImg;
import mobomobo.dto.BookBestLike;
import mobomobo.dto.BookMark;
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
	public void detail(String bookBestno, Model model, HttpSession session) {
		logger.info("/mobo/book/famousDetail");
		logger.debug(bookBestno);
		
		// 상세보기 정보
		BookBest bookBest = bookFamousLineService.getBookBestInfo(bookBestno);
		logger.debug(bookBest.toString());
		BookBestImg img = bookFamousLineService.getBookBestImgInfo(bookBestno);
//		logger.debug(img.toString());
		// 명대사 3가지
		String [] str = bookBest.getBestContext().split("/");
		
		for(int i=0;i<str.length;i++) {
			logger.debug(str[i]);
		}
		
		// 추천
		int likeCnt = bookFamousLineService.viewLike(bookBestno);
		// 북마크
		boolean bookMarkState = bookFamousLineService.viewBookMark(bookBestno,session);
		// 댓글, 댓글 추천 개수
		List<HashMap<String,Object>> commentList = bookFamousLineService.getCommentList(bookBestno);
		
		
		
		
		model.addAttribute("commentList",commentList);
		model.addAttribute("isBookMarkState",bookMarkState);
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
		
		
		return bookFamousLineService.viewLike(bookBestLike);
		
	}
	
	@RequestMapping(value="/bookMark")
	public @ResponseBody int bookMark(String bookBestno, String title, HttpSession session) {
		logger.info("/bookMark ");
		
		BookMark bookMark = new BookMark();
		bookMark.setKey(bookBestno);
		bookMark.setUserno((int)session.getAttribute("userno"));
		bookMark.setTitle(title);
		
		return bookFamousLineService.viewBookMark(bookMark);
		
	}
	
	@RequestMapping(value="/comment")
	public @ResponseBody BookBestComment commentWrite(BookBestComment bookBestComment, HttpSession session) {
		logger.info("/comment ");
		
		logger.debug(bookBestComment.toString());
		
		BookBestComment info = bookFamousLineService.getBookBestComment(bookBestComment,session);
		
		logger.debug(info.toString());
		
		bookFamousLineService.insert(info);
		
		return bookFamousLineService.getComment(info);
		
		
	}
	@RequestMapping(value="/commentDelete")
	public @ResponseBody int commentDelete(BookBestComment bookBestComment) {
		logger.info("/commentDelete ");
		logger.debug(bookBestComment.toString());
		
		bookFamousLineService.delete(bookBestComment);
		
		return bookBestComment.getCommentno();
	}
	@RequestMapping(value="/commentRecom")
	public @ResponseBody HashMap<String,Object> commentRecom(BookBestCommentLike bookBestCommentlike, HttpSession session) {
		logger.info("/commentRecom ");
		logger.debug(bookBestCommentlike.toString());
		
		bookBestCommentlike.setUserno((int)session.getAttribute("userno"));
		
		boolean isRecom = bookFamousLineService.viewCommentLike(bookBestCommentlike);
		int commentCnt = bookFamousLineService.getCommentCnt(bookBestCommentlike);
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("isRecom", isRecom);
		map.put("commentno", bookBestCommentlike.getCommentno());
		map.put("commentCnt",commentCnt);
		
		return map;
		
	}
	
	
	
	
	
}
