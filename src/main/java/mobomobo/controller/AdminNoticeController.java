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
@RequestMapping(value="/admin")
public class AdminNoticeController {

	private static final Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);
	
	@Autowired
	private NoticeService noticeService;

	@RequestMapping(value="/notice/list")
	public void noticeList( NoticePaging noticePaging, Model model ) {
		logger.info("/admin/noticelist [GET]");
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
	public void noticDetail(Notice notice, Model model) {
		logger.info("/admin/notice/detail [GET] ");
		
		logger.info("notice 의 값은 : {}",notice);
		
		Notice detail = noticeService.detail(notice);
		logger.info("test");
		
		//모델값전달
		model.addAttribute("detail", detail);
		logger.info("detail : {}",detail);
		
	}
	
	@RequestMapping(value = "/notice/write", method = RequestMethod.GET)
	public void write() { 
		
		logger.info("write글쓰기 페이지로이동시켜주세요!@!@!@!@!@!@!@!@!@!@!@!@");
	}
	
	@RequestMapping(value = "/notice/write", method = RequestMethod.POST)
	public String writeProc(Notice notice, Model model) {
		
		logger.info("제뫃ㄱ롷ㄹㅎ로ㅗㅎㄹ롷ㄹㅎㄹ :{}",notice);
		
		logger.info("이동됬어요!@!!@!@!@!@!@!@!@!@!@!@!");
		
		logger.info("글쓰기 : {}", notice);
		
		noticeService.write(notice);
		
		return "redirect: /admin/notice/list";
	}
	
	@RequestMapping(value="/notice/delete")
	public String deleteProc(Notice notice) {
		
		noticeService.delete(notice);
		
		return "redirect: /admin/notice/list";
	}
	

	@RequestMapping(value="/notice/update", method=RequestMethod.GET)
	public String update(Notice notice, Model model) {
		
		logger.info("nno : {}", notice.toString());
		
		// 게시글 번호가 1보다 작으면 목록으로 보내기
		if(notice.getnNo() < 1) {
			return "redirect: /admin/notice/list";
		}
		
		// 게시글 상세 정보 전달
		notice = noticeService.detail(notice);
		logger.info("상세보기 : {}", notice.toString());
		model.addAttribute("detail", notice);
		
		return "/admin/notice/update";
	}

	@RequestMapping(value="/notice/update", method=RequestMethod.POST)
	public String updateProcess(Notice notice) {
		
		
		logger.info("글수정 : {}", notice);
		
		noticeService.update(notice);
		
		return "redirect: /admin/notice/detail?nNo="+notice.getnNo();
		
	}
	
}
