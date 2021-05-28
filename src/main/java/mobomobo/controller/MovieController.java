package mobomobo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/mobo/movie")
public class MovieController {
	
	//로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@RequestMapping(value="/moviebestboard", method=RequestMethod.GET)
	public void moviebest() {
		
		logger.info("명장면 게시판 ");
	
	}
	
	@RequestMapping(value="/movierecom", method=RequestMethod.GET)
	public void movie() {
		
		logger.info("영화 추천 게시판 ");
	
	}
	
	@RequestMapping(value="/moviedetail", method=RequestMethod.GET)
	public void moviebestdetail() {
		
		logger.info("영화 명장면 게시판 상세 페이지 ");
	
	}
	
	
}
