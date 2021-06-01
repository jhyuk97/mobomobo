package mobomobo.controller;


import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mobomobo.admin.util.Paging;
import mobomobo.dto.Market;
import mobomobo.service.face.MarketService;

@Controller
@RequestMapping(value="/mobo/market")
public class MarketController {
	private static final Logger logger = LoggerFactory.getLogger(MarketController.class);
	
	@Autowired
	private MarketService marketService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String MarketList(Paging inData, Model model) {
		
		
		//페이징 계산
		Paging paging = marketService.getPaging(inData);
		//검색어 저장
		paging.setSearch(inData.getSearch());
		
		
		//중고마켓 게시글 조회
		List<Market> mList = marketService.SelectAll(paging);
		
		//게시글 리스트 모델값 전달
		model.addAttribute("mList", mList);
		model.addAttribute("paging", paging);
		
		return "/mobo/market/market";
	}
	
	@RequestMapping(value="/{mNo}")
	public void MarketDetail(int mNo) {
	}
	
	
	
}
