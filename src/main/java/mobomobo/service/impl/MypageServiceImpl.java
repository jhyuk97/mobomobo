package mobomobo.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mobomobo.dao.face.MypageDao;
import mobomobo.dto.BookMark;
import mobomobo.dto.MyPage;
import mobomobo.dto.UserImg;
import mobomobo.dto.UserInfo;
import mobomobo.service.face.MypageService;

@Service
public class MypageServiceImpl implements MypageService {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageServiceImpl.class);
	
	@Autowired 
	MypageDao mypageDao;
	
	@Override
	public UserInfo getUserInfo(int userno) {

		UserInfo userInfo = mypageDao.selectUserInfoByUserNo(userno);
		
		return userInfo;
		
	}
	
	@Override
	public UserImg getUserImg(int userno) {

		UserImg userImg = mypageDao.selectUserImgByUserNo(userno);
		
		return userImg;
	}
	
	@Override
	public List<MyPage> getMyWriting(int userno) {

		List<MyPage> mypage = mypageDao.selectMyWritingByUserNo(userno);
		
		return mypage;
	}
	
	@Override
	public boolean checkUserInfo(UserInfo userinfo) {

		int cnt = mypageDao.selectUserInfoCnt(userinfo);
		
		if (cnt > 0) {
			return true;
		} else {
			return false;
		}
		
	}
	
	@Override
	public List<BookMark> getMyBookMark(int userno) {
		
		return mypageDao.selectMyBookMarkByUserNo(userno);
	}
	

}
