package mobomobo.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mobomobo.admin.service.face.AdminService;
import mobomobo.admin.util.Paging;



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
		public void usermanager(Paging userPaging) {
			
			logger.info("/usermanagement 요청 완료 ");
			
			
			logger.info("페이징 : {}", userPaging);
			
			
			//페이징 계산
//			Paging paging = adminService.getPaging( userPaging );
//			paging.setSearch( userPaging.getSearch() );
//			logger.debug("페이징 : {}", paging);
			
			
			
		}

}