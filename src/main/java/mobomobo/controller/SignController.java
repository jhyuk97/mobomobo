package mobomobo.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mobomobo.dto.UserInfo;
import mobomobo.service.face.SignService;



@Controller
public class SignController {
	
	//로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(SignController.class);
	
	//서비스 객체
	@Autowired private SignService signService;
	
	
	@RequestMapping(value = "/mobo/signup/form", method = RequestMethod.GET)
	public String signUp () {
		
		//회원가입 form
		
//		logger.info("/mobo/signup/form - [GET] 요청 ");
		
		return "sign/signUp";
	}
	
	@RequestMapping(value = "/mobo/signup/idcheck", method = RequestMethod.POST)
	public @ResponseBody int signUpIdcheck (String id) {
		
		//회원가입시 id 중복체크 
		
//		logger.info("/mobo/signup/idcheck - [POST] 요청 ");
		
//		logger.info("id를 받아오나? = {}", id);
		
		int proc = -1;
		
		proc = signService.signIdCheck(id);
		
//		logger.info("결과값은 {}",proc);
		

		
		
		return proc;

	}
	
	@RequestMapping(value = "/mobo/signup/nickcheck", method = RequestMethod.POST)
	public @ResponseBody int signUpNickcheck (String nick) {
		
		//회원가입시 nick 중복체크		
		
//		logger.info("/mobo/signup/nickcheck - [POST] 요청 ");
		
		int proc = -1;
		
		proc = signService.signNickCheck(nick);
		
//		logger.info("결과값은 {}",proc);
		

		
		return proc;

	}
	
	@RequestMapping(value = "/mobo/signup/email", method = RequestMethod.GET)
	public @ResponseBody String signUpEmail (String email) {

		//회원가입시 이메일 인증번호 발송

//		logger.info("/mobo/signup/email - [POST] 요청 ");
		
//		logger.info("받아온 email 값 : {}", email);
		
		
		
		String sendatnum = signService.signEmailSend(email);
		
//		logger.info("보낸 인증번호 {}",sendatnum);
		


		return sendatnum;
	}
	

	@RequestMapping(value = "/mobo/signup/form", method = RequestMethod.POST)
	public String signUpProc (UserInfo userInfo) {
		
		//회원 가입 완료 
		
//		logger.info("/mobo/signup/form - [POST] 요청 ");
		
//		logger.info("회원가입 요청 정보 : {}", userInfo);
		
		//회원가입 결과
		boolean joinResult = signService.join(userInfo);

		if(joinResult) {
//			logger.info("회원가입 성공");
			return "mobo/main";

		} else {
//			logger.info("회원가입 실패");
			return "mobo/signin/login";

		}
	}
	
	@RequestMapping(value = "/mobo/signin/login", method = RequestMethod.GET)
	public String signIn() {
		
//		logger.info("/mobo/signin/login -[GET] 요청 ");
		
		return "sign/login";

	}
	
	@RequestMapping(value = "/mobo/signin/login", method = RequestMethod.POST)
	public String signInProc(UserInfo userInfo, HttpSession session,Model model) {
		
//		logger.info("/mobo/signin/login - [POST] 요청 ");
		
		logger.info("로그인 정보 : {}", userInfo);
		
		boolean loginResult = signService.login(userInfo);
		
		logger.info("loginResult의 값 : {}", loginResult);
		
		if(loginResult) {
//			logger.info("로그인 성공");
			
			UserInfo res = signService.getUserInfo(userInfo.getId());

			session.setAttribute("login", true);
			session.setAttribute("id", res.getId());
			
			session.setAttribute("age", res.getAge());
			session.setAttribute("userno", res.getUserno());
			session.setAttribute("grade", res.getGrade());

			logger.info("세션상태 : " + session.getAttribute("login"));
			logger.info("세션 아이디 : " + session.getAttribute("id"));
			logger.info("세션 등급 : " + session.getAttribute("grade"));

			return "mobo/main";

		} else {
			logger.info("로그인실패");
			
			
			model.addAttribute("msg", "로그인에 실패하셨습니다"); 
			model.addAttribute("url", "/mobo/signin/login"); 
			return "sign/alert";
		}

	}
	
	@RequestMapping(value="/mobo/signin/logout")
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect: /mobo/main";
	}
	
	@RequestMapping(value = "/mobo/signin/findid", method = RequestMethod.GET)
	public void findid() {
		
		logger.info("findid - GET 요청");
		
	}
	
	@RequestMapping(value = "/mobo/signin/findpw", method = RequestMethod.GET)
	public void findpw() {
		
		logger.info("findpw - GET 요청");
		
		
	}
	
	

}
