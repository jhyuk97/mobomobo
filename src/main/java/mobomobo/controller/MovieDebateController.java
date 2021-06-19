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

import mobomobo.dto.Debate;
import mobomobo.dto.DebateComment;
import mobomobo.dto.DebateHot;
import mobomobo.service.face.MovieDebateService;
import mobomobo.util.DebatePaging;

@Controller
@RequestMapping(value="/mobo")
public class MovieDebateController {

	private static final Logger logger = LoggerFactory.getLogger(MovieDebateController.class);
	
	@Autowired
	private MovieDebateService movieDebateService;
	
	@RequestMapping(value="/movie/debate")
	public void debateList( DebatePaging inData, Model model ) {
		logger.info("/mobo/movie/debate [GET]");
		logger.info("/debatelist [GET] ");
		logger.info("파라미터 : {}", inData);
		
		
		//페이징 계산
		DebatePaging paging = movieDebateService.debatePaging( inData );
			
		logger.info("paging값이 저장되서 들어왔냐 : {}",paging);
				
		paging.setSearch( inData.getSearch() );
		paging.setType(inData.getType());
		paging.setCategory(4);
		logger.info("777777");
		logger.info("페이징 : {}", paging);
				
		//페이징계산후 공지사항 게시판 list 만들기
		List<Debate> list = movieDebateService.getDebateList(paging);

		logger.info("list는 된거야 만거야 : {}", list);
				
		//모델값전달
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);	
		
	}
	
	@RequestMapping(value="/movie/debatedetail", method = RequestMethod.GET)
	public void debateDetail(Debate debate, Model model) {
		
		logger.info("/mobo/movie/debatedetail [GET] ");
		logger.info("debate 의 값은 : {}" , debate);
		
		Debate detail = movieDebateService.detail(debate);
		logger.info("test");
		
		DebateHot debateHot = new DebateHot();
		debateHot.setdNo(debate.getdNo());
		int cnt = movieDebateService.getLikeCnt(debateHot);
		
		//모델값전달
		model.addAttribute("likeCnt",cnt);
		model.addAttribute("Debate", detail);
		logger.info("detail : {}" , detail);
		
	}
	
	@RequestMapping(value = "/movie/debatewrite", method = RequestMethod.GET)
	public void debateWrite() { 
		
		logger.info("debateWrite 글쓰기 페이지로이동시켜주세요!");
	}
	
	@RequestMapping(value = "/movie/debatewrite", method = RequestMethod.POST)
	public String debateWriteProc(Debate debate, Model model, HttpSession session) {
		
		logger.info("제뫃ㄱ롷ㄹㅎ로ㅗㅎㄹ롷ㄹㅎㄹ :{}", debate);
		
		logger.info("이동됬어요!@!!@!@!@!@!@!@!@!@!@!@!");
		
		
		debate.setUserno((int)session.getAttribute("userno"));

		debate.setNick((String)session.getAttribute("nick"));
		
		logger.info("글쓰기 : {}", debate);
		
		movieDebateService.debateWrite(debate);
		
		return "redirect: /mobo/movie/debate";
	}
	
	@RequestMapping(value="/movie/debatedelete")
	public String deleteProc(Debate debate) {
		
		movieDebateService.debateDelete(debate);
		
		return "redirect: /mobo/movie/debate";
	}

	@RequestMapping(value="/movie/debateupdate", method=RequestMethod.GET)
	public String debateUpdate(Debate debate, Model model) {
		
		logger.info("nno : {}", debate.toString());
		
		// 게시글 번호가 1보다 작으면 목록으로 보내기
		if(debate.getdNo() < 1) {
			return "redirect: /mobo/movie/debate";
		}
		
		// 게시글 상세 정보 전달
		debate = movieDebateService.detail(debate);
		logger.info("상세보기 : {}", debate.toString());
		model.addAttribute("debatedetail", debate);
		
		return "/mobo/movie/debateupdate";
	}

	@RequestMapping(value="/movie/debateupdate", method=RequestMethod.POST)
	public String debateUpdateProc(Debate debate) {
		
		
		logger.info("글수정 : {}", debate);
		
		movieDebateService.debateUpdate(debate);
		
		return "redirect: /mobo/movie/debatedetail?dNo="+debate.getdNo();
		
	}
	@RequestMapping(value="/movie/debatelike", method = RequestMethod.GET)
	@ResponseBody
	public int like(DebateHot debateHot, HttpSession session, Model model) {
		logger.info("/debatelike");
		
		DebateHot data = movieDebateService.getDebateHot(debateHot,session);
		logger.debug(data.toString());
		
		if(movieDebateService.isExsitDebateHot(data)) {
			// 데이터 있음
			// 추천 삭제
			movieDebateService.deleteLike(data);
			
		} else {
			// 데이터 없음
			// 추천 삽입
			movieDebateService.insertLike(data);
		}
		
		int cnt = movieDebateService.getLikeCnt(data);
		return cnt;
		
	}
	
	@RequestMapping(value = "/movie/commentwrite")
	public @ResponseBody void writeComment(DebateComment debatecomment , HttpSession session) {
		
		debatecomment.setUserno((int)session.getAttribute("userno"));
		debatecomment.setNick((String)session.getAttribute("nick"));
		
		System.out.println("========================");
		System.out.println(debatecomment.toString());
		
		movieDebateService.commentWrite(debatecomment);
		
	}
	
	@RequestMapping(value = "/movie/commentlist")
	@ResponseBody
	public List<DebateComment> listComment(DebateComment debatecomment, HttpSession session) {
		
		debatecomment.setUserno( (int)session.getAttribute("userno") );
		
		List<DebateComment> list = movieDebateService.commentList(debatecomment);
		logger.info(list.toString());
		return list;
	}
	
	@RequestMapping(value = "/movie/commentdelete")
	@ResponseBody
	public void deleteComment(DebateComment debatecomment) {
		
		System.out.println("========================");
		System.out.println(debatecomment.toString());
		
		movieDebateService.commentDelete(debatecomment);
		
	}
	
	@RequestMapping(value = "/movie/commentlike")
	@ResponseBody
	public void likeComment(DebateComment debatecomment, HttpSession session) {
		
		System.out.println("========================");
		debatecomment.setUserno( (int)session.getAttribute("userno") );

		System.out.println(debatecomment.toString());
		
		movieDebateService.commentLike(debatecomment);
		
	}
	
	@RequestMapping(value="/movie/hot")
	public void hot(Model model) {
		
		List<HashMap<String,Object>> list = movieDebateService.getHotList(4);
		
		model.addAttribute("list",list);
	}
	
	
}