package mobomobo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public void mypageMain(HttpSession session, Model model) {
		
		int userno = (int)session.getAttribute("userno");
		
		UserInfo userInfo = mypageService.getUserInfo(userno); 
		UserImg userImg = mypageService.getUserImg(userno);
		List<MyPage> myWriting = mypageService.getMyWriting(userno);
		
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("userImg", userImg);
		model.addAttribute("myWriting", myWriting);
		
	}
}
