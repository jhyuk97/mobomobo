package mobomobo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mobomobo.dto.UserInfo;
import mobomobo.service.face.AdminService;
import mobomobo.util.Paging;



@Controller
public class AdminController {
	
	//로깅 객체
		private static final Logger logger
		= LoggerFactory.getLogger(AdminController.class);
		
		@Autowired
		private AdminService adminService;


		@RequestMapping(value="/admin/main")
		public void main() {
	
			logger.info("관리자페이지");
	
			}

		@RequestMapping(value="/admin/login")
		public void login() {
			
			logger.info("관리자 로그인 페이지");
			
		}
		
		
		@RequestMapping(value="/admin/tables")
		public void tables() {
			
			logger.info("게시판 테이블 예시");
			
		}
		
		@RequestMapping(value="/admin/movierecom")

		public void movierecom() {
		
		}
		
		@RequestMapping(value = "/admin/usermanagement", method = RequestMethod.GET)
		public void usermanager(Paging userPaging, Model model) {
			
			logger.info("/usermanagement 요청 완료 ");
				
			
//			페이징 계산
			Paging paging = adminService.getPaging( userPaging );
			paging.setSearch( userPaging.getSearch() );
			logger.debug("페이징 : {}", paging);
			
			
			//페이징계산후 회원관리 게시판 list 만들기(?)
			List<UserInfo> list = adminService.list( paging ); 
			
//			for ( int i=0; i< list.size(); i++ ) {
//				//테스트
//				logger.info( list.get(i).toString() );
//			}


			//모델값전달
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);			
			
			
		}
		
		@RequestMapping(value = "/admin/userDelete", method = RequestMethod.POST)
		public void userDelete(UserInfo userno, Model model) {
			
			logger.info("/admin/userDelete - [POST] 요청 완료");
			
			logger.info("삭제 되어야 하는 userno : {}", userno);
			
			boolean result = adminService.userDelete(userno);
			
			model.addAttribute("result",result);
			
			
		}

}