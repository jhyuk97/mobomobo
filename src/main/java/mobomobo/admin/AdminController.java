package mobomobo.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class AdminController {
	
	//로깅 객체
		private static final Logger logger
		= LoggerFactory.getLogger(AdminController.class);


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
		
		@RequestMapping(value = "/admin/usermanagement")
		public void usermanager() {
			
			logger.info("/usermanagement 요청 완료");
			
		}

}