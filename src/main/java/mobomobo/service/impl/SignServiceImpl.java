package mobomobo.service.impl;


import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mobomobo.dao.face.SignDao;
import mobomobo.dto.UserInfo;
import mobomobo.service.face.SignService;

@Service
public class SignServiceImpl implements SignService{

	@Autowired
	private SignDao signDao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(SignServiceImpl.class);
	

	
	@Override
	public int signIdCheck(String id) {
		
		int res = -1;
		
//		logger.info("SignService - signIdCheck ");
		
		res = signDao.selectId(id);
		
//		logger.info("SignService - signIdCheck의 id조회하면 나오는 값 {} ",res);
		
		return res;

	}


	@Override
	public int signNickCheck(String nick) {
		
		int res = -1;
		
//		logger.info("SignService - signNickCheck");
		
		res = signDao.selectNick(nick);
		
//		logger.info("signNickCheck 의 nick 결과 값 {}", res);
		
		return res;
	}

	

	
	@Override
	public String signEmailSend(String email) {
		
		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
//		logger.info("인증번호 " + checkNum);
		
//		logger.info("여기서 사용자의 email을 받아올 수 있나 : {}", email);
		
		/* 이메일 보내기 */
		String setFrom = "skrktlsektns@naver.com"; //본인 이메일로 변경해주세요!
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = 
				"mobomobo 홈페이지를 방문해주셔서 감사합니다." +
				"<br><br>" + 
				"인증 번호는 " + checkNum + "입니다." + 
				"<br>" + 
				"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";		
		
		try {
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		
		String num = Integer.toString(checkNum);
		
		logger.info("완성된 인증번호 : {}", num);
		
		return num;

	}


	@Override
	@Transactional
	public boolean join(UserInfo userInfo) {
		
//		logger.info("SignService - join 요청 완료");
		
		
		signDao.join(userInfo);
		
		signDao.joinUserImg();
		
//		logger.info("SignService - signDao.join 성공 후 ");
		

		return true;
		
		
	}


	@Override
	public boolean login(UserInfo userInfo) {
		
		int loginChk = signDao.login(userInfo);
		
		
//		logger.info("loginChk의 값은 : {}", loginChk);
		
		if(loginChk > 0)	return true;
		else return false;
		
	}
	
	@Override
	public UserInfo getUserInfo(String id) {
		return signDao.selectUserInfo(id);
	}


	@Override
	public boolean kakaologin(HashMap<String, Object> map) {
		
//		logger.info("서비스의 kakaologin 으로 접속");
		
//		logger.info("kakaologin service 에서 받아온 map의 정보 : {}",map);
		
		int kakaologinChk = signDao.kakaologin(map);
		
//		logger.info("kakaologinChk의 결과 값 : {}", kakaologinChk);
		
		if(kakaologinChk > 0)	return true;
		else return false;
	}



	@Override
	public UserInfo getKakaoUserInfo(Object object) {
//		logger.info("service의 getKakaoUserInfo 의 kakaoid 값 : {}", object);
		
		return signDao.selectKakaoUserInfo(object);

	}


	@Override
	public String findUserId(UserInfo userInfo) {
		
//		logger.info("service의 findUserId 접속 완료");
		
		UserInfo id = signDao.selectFindUserId(userInfo);
		
//		logger.info("DAO 처리한 id의 값 : {}",id);
		
		if(id == null) {
			
//			logger.info("id값이 공백이면");
			
			return null;
//			return id;
		} else {
//			logger.info("DAO 처리한 id의 값중 id만 추출 : {}",id.getId());
			
			return id.getId();
			
		}
			
	}


	@Override
	public int findUserPw(UserInfo userInfo) {
		
//		logger.info("service의 findUserPw 접속 완료");
		
		int result = signDao.selectFindUserPw(userInfo);
		
		
		return result;
	}


	@Override
	public String rePwEmailSend(String email) {
		
		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(88888888) + 11111111;

		
		/* 이메일 보내기 */
		String setFrom = "skrktlsektns@naver.com"; //본인 이메일로 변경해주세요!
		String toMail = email;
		String title = "새로운 비밀번호 발급 이메일 입니다.";
		String content = 
				"mobomobo 홈페이지를 방문해주셔서 감사합니다." +
				"<br><br>" + 
				"새로운 비밀번호는  " + checkNum + "입니다." + 
				"<br>" + 
				"해당 비밀번호를 작성후 로그인 해주세요.";		
		
		try {
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		
		String num = Integer.toString(checkNum);
		
		logger.info("새로보낸 비밀번호? : {}", num);
		
		return num;
	}


	@Override
	public void updatepw(UserInfo userInfo) {
		
	
				signDao.updatePw(userInfo);

	}







}
