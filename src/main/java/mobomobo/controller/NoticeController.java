package mobomobo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mobomobo.dto.Notice;
import mobomobo.service.face.NoticeService;
import mobomobo.util.NoticePaging;

@Controller
@RequestMapping(value="/mobo")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;

	@RequestMapping(value="/notice/list")
	public void noticeList( NoticePaging noticePaging, Model model ) {
		logger.info("/admin/noticelist [GET]");
		logger.info("/notice/list [GET] @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2");
		logger.info("파라미터 : {}", noticePaging);
	
		//페이징 계산
		noticePaging = noticeService.noticePaging( noticePaging );
	
		logger.info("paging값이 저장되서 들어왔냐 : {}",noticePaging);
		
		noticePaging.setSearch( noticePaging.getSearch() );
		logger.info("234234234234");
		logger.info("페이징 : {}", noticePaging);
		
		//페이징계산후 공지사항 게시판 list 만들기
		List<Notice> list = noticeService.NoticeList(noticePaging);

		logger.info("list는 된거야 만거야 : {}", list);
		
		//모델값전달
		model.addAttribute("list", list);
		model.addAttribute("paging", noticePaging);			
		
	}
	@RequestMapping(value="/notice/detail", method = RequestMethod.GET)
	public void noticeDetail(Notice notice, Model model) {
		logger.info("/admin/notice/detail [GET] ");
		
		logger.info("notice 의 값은 : {}",notice);
		//
		
		Notice detail = noticeService.detail(notice);
		logger.info("test");
		
		//모델값전달
		model.addAttribute("detail", detail);
		logger.info("detail : {}", detail);
		
	}
}
