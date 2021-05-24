package mobomobo.main.controller;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Controller
@RequestMapping(value="/mobo")
public class MainController {
	
	//로깅객체
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void main() {
		
		logger.info("mobo 메인 페이지 [get]");
		
		
	}
	
	
	

}
