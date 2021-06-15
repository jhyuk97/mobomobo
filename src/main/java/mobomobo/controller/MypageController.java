package mobomobo.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import mobomobo.dto.BookMark;
import mobomobo.dto.MyPage;
import mobomobo.dto.UserImg;
import mobomobo.dto.UserInfo;
import mobomobo.service.face.MypageService;
import mobomobo.util.Paging;

@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	MypageService mypageService;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@RequestMapping(value="/mobo/mypage/main")
	public void mypageMain() { }
	
	@RequestMapping(value="/mobo/mypage/checkPw", method=RequestMethod.POST)
	public @ResponseBody boolean checkPw(UserInfo userinfo, HttpSession session) {
		
		userinfo.setId((String)session.getAttribute("id"));
		
		UserInfo result = mypageService.checkUserInfo(userinfo);
		
		boolean flag = pwdEncoder.matches(userinfo.getPw(), result.getPw());
		
		if(flag) {
			
			session.setAttribute("mypage", true);
			
			return flag;
		} else {
			
			return flag;
		}
		
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
	public @ResponseBody HashMap<String, Object> writingView(HttpSession session, int curPage) {
		
		int userno = (int)session.getAttribute("userno");
		
		Paging paging = mypageService.getWritingPaging(curPage, userno);
		
		List<MyPage> myWriting = mypageService.getMyWriting(userno, paging);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("writing", myWriting);
		map.put("paging", paging);
		
		return map;
		
	}
	
	@RequestMapping(value="/mobo/mypage/bookmarkView")
	public @ResponseBody HashMap<String, Object> bookmarkView(HttpSession session, int curPage) {
		
		int userno = (int)session.getAttribute("userno");
		
		Paging paging = mypageService.getBookMarkPaging(curPage, userno);
		
		List<BookMark> myBookMark = mypageService.getMyBookMark(userno, paging); 
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("bookmark", myBookMark);
		map.put("paging", paging);
		
		return map;
		
	}
	
	@RequestMapping(value="/mobo/mypage/commentView")
	public @ResponseBody HashMap<String, Object> commentView(HttpSession session, int curPage) {
		
		String userid = (String)session.getAttribute("id");
		
		Paging paging = mypageService.getCommentPaging(curPage, userid);
		
		List<MyPage> myComment = mypageService.getMyComment(userid, paging); 
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("comment", myComment);
		map.put("paging", paging);
		
		return map;
	}
	
	@RequestMapping(value="/mobo/mypage/updateImg", method=RequestMethod.POST)
	public @ResponseBody void updateImg(MultipartFile imagefile, HttpSession session) {
		
		int userno = (int) session.getAttribute("userno");
		mypageService.updateUserImage(imagefile, userno);
	}
	
	@RequestMapping(value="/mobo/mypage/originimg")
	public @ResponseBody void originImg(HttpSession session) {
		int userno = (int) session.getAttribute("userno");
		
		UserImg userImg = new UserImg();
		userImg.setUserNo(userno);
		userImg.setStoredName("basig.png");
		
		mypageService.updateOriginImg(userImg);
	}
	
	@RequestMapping(value="/mobo/mypage/deleteCheckBox")
	public @ResponseBody void deleteCheckBox(@RequestParam(value="array[]") String[] array) {
		
		System.out.println(Arrays.toString(array));
		
		mypageService.checkBoxSplit(array); 
	}
	
	@RequestMapping(value="/mobo/mypage/userInfoUpdate")
	public @ResponseBody void userInfoUpdate(UserInfo userInfo, HttpSession session) {
		
		userInfo.setUserno((int)session.getAttribute("userno"));

		mypageService.checkTransUserInfo(userInfo);
		
	}
}
