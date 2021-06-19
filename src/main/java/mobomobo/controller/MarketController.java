package mobomobo.controller;


import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import mobomobo.util.Paging;

import mobomobo.util.chat.Chat;
import mobomobo.util.chat.ChatRooms;
import mobomobo.dto.BookMark;
import mobomobo.dto.ChatLog;
import mobomobo.dto.Market;
import mobomobo.dto.MarketImg;
import mobomobo.dto.UserImg;
import mobomobo.service.face.MarketService;
import mobomobo.util.Paging;

@Controller
@RequestMapping(value="/mobo/market")
public class MarketController {
	private static final Logger logger = LoggerFactory.getLogger(MarketController.class);
	
	@Autowired
	private MarketService marketService;
	
	private final ChatRooms chatList = new ChatRooms();
	
	@RequestMapping(method=RequestMethod.GET)
	public String MarketList(Paging inData, Model model) {
		
		
		//�럹�씠吏� 怨꾩궛
		Paging paging = marketService.getPaging(inData);
		
		logger.info("{}", inData);
		
		//寃��깋�뼱 ���옣
		paging.setSearch(inData.getSearch());
		//移댄뀒怨좊━ ���옣
		paging.setCategory(inData.getCategory());
		
		//以묎퀬留덉폆 寃뚯떆湲� 議고쉶
		List<Market> mList = marketService.SelectAll(paging);
		
		
		//寃뚯떆湲� 由ъ뒪�듃 紐⑤뜽媛� �쟾�떖
		model.addAttribute("mList", mList);
		model.addAttribute("paging", paging);
		
		return "/mobo/market/market";
	}
	
	@RequestMapping(value="/{mNo}", method=RequestMethod.GET)
	public String MarketDetail(@PathVariable("mNo")int mNo, HttpSession session, Model model) {
		
		Market market = marketService.Select(mNo);
		
		List<MarketImg> mImg = marketService.SelectFile(mNo);
		
		BookMark bookmark = new BookMark();
		bookmark.setKey(mNo+"");
		bookmark.setUserno((int)session.getAttribute("userno"));
		
		boolean IsBookmark = marketService.CheckBookmark(bookmark);
		
		model.addAttribute("market", market);
		model.addAttribute("Img", mImg);
		model.addAttribute("bookmark", IsBookmark);
		
		
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
	public String WriteMarketProc(Market data, List<MultipartFile> imgfile, HttpSession session) {
		
		logger.info("{}",imgfile);
		
		
		data.setId(session.getAttribute("id").toString());
		logger.info("{}",data);
		marketService.WriteMarket(data, imgfile);
		
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
	public String UpdateMarketProc(Market data, List<MultipartFile> imgfile, HttpSession session) {
		
		logger.info("{}",imgfile);
				
		data.setId(session.getAttribute("id").toString());
		logger.info("{}",data);
		marketService.UpdateMarket(data, imgfile);
		
		return "redirect:/mobo/market";
	}
	
	
	@RequestMapping(value="/bookmark", method=RequestMethod.POST)
	public ModelAndView addBookmark(BookMark bookmark, ModelAndView mav) {
		logger.info("{}",bookmark);
		
		boolean isBookmark = marketService.CheckBookmark(bookmark);
		
		mav.setViewName("jsonView");
		
		if(isBookmark) {
			marketService.RemoveBookmark(bookmark);
			mav.addObject("check", isBookmark);
			
		}else {
			marketService.AddBookmark(bookmark);
			mav.addObject("check", isBookmark);
		}
		
		return mav;
	}
	
	
	@RequestMapping(value="/chat", method=RequestMethod.GET)
	public void openChat(@RequestParam(defaultValue="0")int mNo, HttpSession session, Model model) {
		
		if(mNo != 0) {
			Market market = marketService.Select(mNo);
			
			//게시글번호+판매자id + 구매희망자id로 채팅방id 생성
			String roomId = "m:" + mNo + "su:" + market.getId() + "bu:" + session.getAttribute("id");
			
			
			Chat room = chatList.findRoomById(roomId);
			
			//채팅방 유무확인 없으면 생성후 리스트에 저장
			//chatroom이 채팅방 리스트 보유 객체
			if(room == null) {
				//새로운 채팅방 생성후 채팅방 return
				room = chatList.createChat(roomId);
				
			}
			model.addAttribute("room",room);
			model.addAttribute("market", market);

		}
		List<ChatLog> roomlist = marketService.SelectChatList(session.getAttribute("id").toString());
		List<UserImg> profileList = marketService.selectChatImg(session.getAttribute("id").toString());
		
		logger.info("chat컨트롤러 프로필이미지 : {}", profileList);
		
		
		model.addAttribute("roomlist", roomlist);
		model.addAttribute("profile", profileList);
//		
	}
	
	@RequestMapping(value="/chatroom", method=RequestMethod.GET)
	public ModelAndView Chatroom(HttpSession session, ChatLog data, ModelAndView mav) {
		
		List<ChatLog> log = marketService.selectLog(data.getRoomid());
		List<UserImg> uImg = new ArrayList<>();
		uImg = marketService.selectImg(data);
		
		mav.addObject("uImg", uImg);
		mav.addObject("log", log);
		mav.addObject("roomid", data.getRoomid());
		mav.addObject("mTitle", data.getmTitle());
		mav.setViewName("/mobo/market/chatroom");
		
		return mav; 
	}
	
}
