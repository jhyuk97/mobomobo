package mobomobo.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mobomobo.dto.BookMark;
import mobomobo.dto.MyPage;
import mobomobo.dto.UserImg;
import mobomobo.dto.UserInfo;
import mobomobo.service.face.MypageService;

@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	MypageService mypageService;
	
	@RequestMapping(value="/mobo/mypage/main")
	public void mypageMain() { }
	
	@RequestMapping(value="/mobo/mypage/checkPw", method=RequestMethod.POST)
	public @ResponseBody boolean checkPw(UserInfo userinfo, HttpSession session) {
		
		userinfo.setId((String)session.getAttribute("id"));
		
		boolean flag = mypageService.checkUserInfo(userinfo);
		
		return flag;
	}
	
	@RequestMapping(value="/mobo/mypage/infoView")
	public @ResponseBody HashMap<String, Object> infoView(HttpSession session) {
		
		int userno = (int)session.getAttribute("userno");
		
		UserInfo userInfo = mypageService.getUserInfo(userno); 
		UserImg userImg = mypageService.getUserImg(userno);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("userInfo", userInfo);
		map.put("userImg", userImg);
		
		return map;
		
	}
	
	@RequestMapping(value="/mobo/mypage/writingView")
	public @ResponseBody List<MyPage> writingView(HttpSession session) {
		
		int userno = (int)session.getAttribute("userno");
		
		List<MyPage> myWriting = mypageService.getMyWriting(userno);
		
		return myWriting;
		
	}
	
	@RequestMapping(value="/mobo/mypage/bookmarkView")
	public @ResponseBody List<BookMark> bookmarkView(HttpSession session) {
		
		int userno = (int)session.getAttribute("userno");
		
		List<BookMark> myBookMark = mypageService.getMyBookMark(userno); 
		
		return myBookMark;
		
	}
	
	@RequestMapping(value="/mobo/mypage/commentView")
	public @ResponseBody List<MyPage> commentView(HttpSession session) {
		
		return null;
	}
}
