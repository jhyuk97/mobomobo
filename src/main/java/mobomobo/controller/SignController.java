package mobomobo.controller;



import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mobomobo.dto.UserInfo;
import mobomobo.service.face.SignService;



@Controller
public class SignController {
	
	//로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(SignController.class);
	
	//서비스 객체
	@Autowired private SignService signService;
	
	
	@RequestMapping(value = "/mobo/sign/signUp", method = RequestMethod.GET)
	public  String signUp () {
		
		//회원가입 form
		
		logger.info("/mobo/signup/form - [GET] 요청 ");
		
//		model.addAttribute("rd1", new ResultData( "A", 111, true) );
		
		return "sign/signUp";
	}
	
	@RequestMapping(value = "/mobo/sign/idcheck", method = RequestMethod.POST)
	public @ResponseBody int signUpIdcheck (String id) {
		
		//회원가입시 id 중복체크 
		
//		logger.info("/mobo/signup/idcheck - [POST] 요청 ");
		
//		logger.info("id를 받아오나? = {}", id);
		
		int proc = -1;
		
		proc = signService.signIdCheck(id);
		
//		logger.info("결과값은 {}",proc);
		

		
		
		return proc;

	}
	
	@RequestMapping(value = "/mobo/sign/nickcheck", method = RequestMethod.POST)
	public @ResponseBody int signUpNickcheck (String nick) {
		
		//회원가입시 nick 중복체크		
		
//		logger.info("/mobo/signup/nickcheck - [POST] 요청 ");
		
		int proc = -1;
		
		proc = signService.signNickCheck(nick);
		
//		logger.info("결과값은 {}",proc);
		

		
		return proc;

	}
	
	@RequestMapping(value = "/mobo/sign/email", method = RequestMethod.GET)
	public @ResponseBody String signUpEmail (String email) {

		//회원가입시 이메일 인증번호 발송

//		logger.info("/mobo/signup/email - [POST] 요청 ");
		
		logger.info("받아온 email 값 : {}", email);
		
		
		
		String sendatnum = signService.signEmailSend(email);
		
//		logger.info("보낸 인증번호 {}",sendatnum);
		


		return sendatnum;
	}
	

	@RequestMapping(value = "/mobo/sign/signUp", method = RequestMethod.POST)
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
			return "mobo/sign/login";

		}
	}
	
	@RequestMapping(value = "/mobo/sign/login", method = RequestMethod.GET)
	public String signIn() {
		
//		logger.info("/mobo/signin/login -[GET] 요청 ");
		
		return "sign/login";

	}
	
	@RequestMapping(value = "/mobo/sign/login", method = RequestMethod.POST)
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
			session.setAttribute("nick", res.getNick());
			
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
			model.addAttribute("url", "/mobo/sign/login"); 
			return "sign/alert";
		}

	}
	
	@RequestMapping(value="/mobo/sign/logout")
	public String logout(HttpSession session) {

		session.invalidate();
		
		logger.info("logout?");

		return "redirect: /mobo/main";
	}
	
	@RequestMapping(value = "/mobo/sign/findid", method = RequestMethod.GET)
	public String findid() {
		
		logger.info("findid - GET 요청");
		
//		logger.info("아이디찾기 ");
		
		return "sign/findId";
		
	}
	
	@RequestMapping(value = "/mobo/sign/findid", method = RequestMethod.POST)
	public String findidProc(UserInfo userInfo, Model model) {
		
		logger.info("findid - Post 요청");
		
		logger.info("아이디찾기 - userInfo의 값 : {} ", userInfo);
		
		String id = signService.findUserId(userInfo);
		
		logger.info("찾은 id의 값은 : {} ", id);
		
		model.addAttribute("id", id);
		
		return "sign/findIdView";
		
	}
	
	@RequestMapping(value = "/mobo/sign/findpw", method = RequestMethod.GET)
	public String findpw() {
		
		logger.info("findpw - GET 요청");
		
		return "sign/findPw";
		
	}
	
	@RequestMapping(value = "/mobo/sign/findpw", method = RequestMethod.POST)
	public String findpwProc(UserInfo userInfo, Model model) {
		
		logger.info("findpw - POST 요청");
		
		logger.info("findPw - 입력한 값 : {}", userInfo);
		
		UserInfo userPw = signService.findUserPw(userInfo);
		
		logger.info("검사한 user의 정보들 : {}",userPw);
		
		model.addAttribute("id",userPw.getId());
		model.addAttribute("pw",userPw.getPw());


		
		return "sign/findPwView";
		
	}
	
	@RequestMapping(value = "/mobo/sign/kakaocheck", method = RequestMethod.GET)
	public String kakaocheck(@RequestParam String res,HttpSession session,Model model) {
		
		logger.info("kakaocheck ");
		logger.info("kakaocheck의 res의 값은 : {}", res );
				
		JSONParser parser = new JSONParser(); 
		
		try {
			JSONObject obj = (JSONObject) parser.parse(res);
			
			logger.info("sjelfjsejfselfesf : {}", obj.get("id") );
			
			logger.info("----------------------------");
			
			JSONObject oobj = (JSONObject) obj.get("kakao_account");
			
			JSONObject ooobj = (JSONObject) oobj.get("profile");
			
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ : {}", ooobj.get("nickname") );
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ : {}", oobj.get("email") );
			
			
			logger.info("----------------------------");
			
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("id",obj.get("id").toString());
			map.put("nick",ooobj.get("nickname"));
			map.put("email",oobj.get("email"));
			
			logger.info("map 상태 보기 : {}", map);
						
			boolean loginResult = signService.kakaologin(map);
			
			logger.info("loginResult 의 처리 결과 : {}", loginResult);
			
			if(loginResult) {
				logger.info("로그인 성공");
				
				logger.info("로그인 성공 후 map.get('id')값 검사 : {}", map.get("id"));
				
//				UserInfo kakaoid = (UserInfo) map.get("id");
				
//				logger.info("로그인 성공 후 map값 저장한 kakaoid의 값은 : {}", kakaoid);
				
				UserInfo result = signService.getKakaoUserInfo(map.get("id"));
				
				logger.info("로그인 성공 후 id값으로 유저 정보 조회 : {}", result);
	
				session.setAttribute("login", true);
				session.setAttribute("id", result.getId());
				
				session.setAttribute("age", result.getAge());
				session.setAttribute("userno", result.getUserno());
				session.setAttribute("grade", result.getGrade());
	
				logger.info("세션상태 : " + session.getAttribute("login"));
				logger.info("세션 아이디 : " + session.getAttribute("id"));
				logger.info("세션 등급 : " + session.getAttribute("grade"));
				
				model.addAttribute("loginResult",loginResult);
	
				return "jsonView";
	
			} else {
				logger.info("로그인실패");
				
//				return "redirect:/mobo/sign/signUp?id=" + map.get("id");
				
				
				
				
				
//			 map 담아서 바로 보내라
				
				model.addAttribute("kakaoUserInfo",map); 
				
//				Writer out  / out.write("{\"result\": true}");
				
//				@ResponseBody
//				<script> var con_test = confirm("회원가입을 진행하시겠습니까?")</script>
//				if(con_test){
//					return "sign/signUp";
//				}else{
//					return "mobo/main";
//				}
				
				
				return "jsonView";
			}
			
			
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		
		return null;
		
		
	}//kakao login 
	
	@RequestMapping(value = "/mobo/sign/kakaoSignUp", method = RequestMethod.GET)
	public  String kakaoSignUp (Model model, String kakaoUserInfo) {
		
		//회원가입 form
		
		logger.info("/mobo/signup/kakaoSignUp - [GET] 요청 ");
		
		
//		logger.info(" model 값은 ? : {} ", model);
		logger.info("kakaoSignUp에서 받은 kakaoUserInfo 값은 ? : {} ", kakaoUserInfo);
		
		JSONParser parser = new JSONParser(); 
		
		try {
			JSONObject oneOut = (JSONObject) parser.parse(kakaoUserInfo);
			
			logger.info("1차 벗겨냄 : {}", oneOut);
			
			JSONObject twoOut = (JSONObject) oneOut.get("kakaoUserInfo");
			
			logger.info("2차 벗겨냄 : {}", twoOut);
			
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ : {}", twoOut.get("nick") );
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("id",twoOut.get("id").toString());
			map.put("nick",twoOut.get("nick"));
			map.put("email",twoOut.get("email"));
			
			logger.info("map 상태 보기 : {}", map);
			
			
			model.addAttribute("id",twoOut.get("id").toString() );
			model.addAttribute("nick",twoOut.get("nick") );
			model.addAttribute("email",twoOut.get("email") );

			logger.info("model 상태 보기 : {}", model);
			
			return "sign/signUp";
			
			
		} catch (ParseException e) {

			e.printStackTrace();
		}
		
		
//		logger.info("sjelfjsejfselfesf : {}", obj.get("id") );
		
		logger.info("----------------------------");
		
//		model.addAttribute("rd1", new ResultData( "A", 111, true) );
		
		return "jsonView";
	}
	
	

}
