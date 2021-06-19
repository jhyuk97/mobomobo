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

import mobomobo.dto.Debate;
import mobomobo.service.face.AdminDebateService;
import mobomobo.util.DebatePaging;
import oracle.jdbc.internal.OracleConnection.ReplayOperation;

@Controller
@RequestMapping(value="/admin")
public class AdminDebateController {
	
		private static final Logger logger = LoggerFactory.getLogger(AdminDebateController.class);
		@Autowired
		private AdminDebateService adminDebateService;

		@RequestMapping(value="/movie/adminmoviedebatelist")
		public void mdebateList( DebatePaging inData, Model model ) {
			
			logger.info("파라미터 : {}", inData);
			
			//페이징 계산
			DebatePaging paging = adminDebateService.mdebatePaging( inData );
				
			logger.info("paging값이 저장되서 들어왔냐 : {}",paging);
					
			paging.setCategory(4);
			logger.info("페이징 : {}", paging);
					
			//페이징계산후 관리자 게시판 list 만들기
			List<Debate> list = adminDebateService.getmDebateList(paging);

			logger.info("list는 된거야 만거야 : {}", list);
					
			//모델값전달
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);	
	
			
		}
		
		@RequestMapping(value="/book/adminbookdebatelist")
		public void bdebateList( DebatePaging inData, Model model ) {
			
			logger.info("파라미터 : {}", inData);
			
			//페이징 계산
			DebatePaging paging = adminDebateService.mdebatePaging( inData );
				
			logger.info("paging값이 저장되서 들어왔냐 : {}",paging);
					
			paging.setCategory(5);
			logger.info("페이징 : {}", paging);
					
			//페이징계산후 관리자 게시판 list 만들기
			List<Debate> list = adminDebateService.getmDebateList(paging);

			logger.info("list는 된거야 만거야 : {}", list);
					
			//모델값전달
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);	
			
		}
		
		
		@RequestMapping(value ="/MDebateDelete", method = RequestMethod.POST)
		public String MDebateDelete(Debate dNo, Model model) {
			
			logger.info("/admin/userDelete - [POST] 요청 완료");
			
			logger.info("삭제 되어야 하는 userno : {}", dNo);
			
			boolean success = adminDebateService.dNoDelete(dNo);
			
			logger.info("반환되어 돌아오는값 : {}", success);
			
			//jsp로 보냄
			model.addAttribute("success",success);
			
			return "jsonView";
		}
		
		@RequestMapping(value="/movie/adminmoviedebateHotlist")
		public void moviehot(Model model) {
			
			List<HashMap<String,Object>> list = adminDebateService.getHotList(4);
			
			model.addAttribute("list",list);
		}
		
		@RequestMapping(value="/book/adminbookdebateHotlist")
		public void bookhot(Model model) {
			
			List<HashMap<String,Object>> list = adminDebateService.getHotList(5);
			
			model.addAttribute("list",list);
		}
		
}
