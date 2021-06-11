package mobomobo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mobomobo.dto.Market;
import mobomobo.service.face.MarketService;
import mobomobo.util.Paging;

@Controller
@RequestMapping(value="/admin/market")
public class AdminMarketController {
	
	@Autowired
	private MarketService marketService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String MarketList(Paging inData, Model model) {
		
		Paging paging = marketService.getAdminPaging(inData);
		paging.setSearch(inData.getSearch());
		paging.setCategory(inData.getCategory());
		
		List<Market> marketList = marketService.SelectAll(paging);
		
		model.addAttribute("mList", marketList);
		model.addAttribute("paging", paging);
		
		return "/admin/market/market";		
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String DeleteMarket(int mNo) {
		
		marketService.DeleteMarket(mNo);
		
		return "redirect:/admin/market";
		
	}
	
}
