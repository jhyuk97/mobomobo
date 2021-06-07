package mobomobo.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import mobomobo.util.Paging;
import mobomobo.dto.BookMark;
import mobomobo.dto.Market;
import mobomobo.dto.MarketImg;
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
		//카테고리 저장
		paging.setCategory(inData.getCategory());
		
		//중고마켓 게시글 조회
		List<Market> mList = marketService.SelectAll(paging);
		
		
		//게시글 리스트 모델값 전달
		model.addAttribute("mList", mList);
		model.addAttribute("paging", paging);
		
		return "/mobo/market/market";
	}
	
	@RequestMapping(value="/{mNo}", method=RequestMethod.GET)
	public String MarketDetail(@PathVariable("mNo")int mNo, Model model) {
		
		Market market = marketService.Select(mNo);
		
		List<MarketImg> mImg = marketService.SelectFile(mNo);
		
		model.addAttribute("market", market);
		model.addAttribute("Img", mImg);
		
		return "/mobo/market/product";
	}
	
	@RequestMapping(value="/delete")
	public String DeleteMarket(int mNo) {
		
		marketService.DeleteMarket(mNo);
		
		return "redirect:/mobo/market";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void WriteMarket(@RequestParam(defaultValue="0")int mNo, Model model) {}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String WriteMarketProc(Market data, List<MultipartFile> file, HttpSession session) {
		
		logger.info("{}",file);
		
		
		data.setId(session.getAttribute("id").toString());
		logger.info("{}",data);
		marketService.WriteMarket(data, file);
		
		return "redirect:/mobo/market";
	}
	
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String UpdateMarket(Market market, Model model) {
		
		if(market.getmNo() < 1) {
			return "redirect:/mobo/market";
		}
		
		Market m = marketService.Select(market.getmNo());
		List<MarketImg> mImg = marketService.SelectFile(market.getmNo());
		
		model.addAttribute("market", m);
		model.addAttribute("Img", mImg);
		
		return "mobo/market/update";
	}

	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String UpdateMarketProc(Market data, List<MultipartFile> file, HttpSession session) {
		
		logger.info("{}",file);
				
		data.setId(session.getAttribute("id").toString());
		logger.info("{}",data);
		marketService.UpdateMarket(data, file);
		
		return "redirect:/mobo/market";
	}
	
	
	@RequestMapping(value="/bookmark", method=RequestMethod.POST)
	public void addBookmark(BookMark bookmark) {
		logger.info("{}",bookmark);
		
		marketService.AddBookmark(bookmark);
		
	}
	
}
