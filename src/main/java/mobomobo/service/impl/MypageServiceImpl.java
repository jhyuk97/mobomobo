package mobomobo.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import mobomobo.dao.face.MypageDao;
import mobomobo.dto.BookMark;
import mobomobo.dto.MyPage;
import mobomobo.dto.UserImg;
import mobomobo.dto.UserInfo;
import mobomobo.service.face.MypageService;
import mobomobo.util.Paging;

@Service
public class MypageServiceImpl implements MypageService {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageServiceImpl.class);
	
	@Autowired 
	MypageDao mypageDao;
	
	@Autowired
	ServletContext context;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
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
	public Paging getBookMarkPaging(int curPage, int userno) {

		int totalCount = mypageDao.selectCntAll(userno);
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public Paging getCommentPaging(int curPage, String userid) {

		int totalCount = mypageDao.selectCntAllComment(userid);
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public Paging getWritingPaging(int curPage, int userno) {

		int totalCount = mypageDao.selectCtnAllWriting(userno);
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<MyPage> getMyWriting(int userno, Paging paging) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("userno", userno);
		map.put("paging", paging);

		List<MyPage> mypage = mypageDao.selectMyWritingByUserNo(map);
		
		return mypage;
	}
	
	@Override
	public UserInfo checkUserInfo(UserInfo userinfo) {

		UserInfo result = mypageDao.selectUserInfoCnt(userinfo);
		
		return result;
		
	}
	
	@Override
	public List<BookMark> getMyBookMark(int userno, Paging paging) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("userno", userno);
		map.put("paging", paging);
		
		return mypageDao.selectMyBookMarkByUserNo(map);
	}
	
	@Override
	public List<MyPage> getMyComment(String userid, Paging paging) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("paging", paging);
		
		return mypageDao.selectMyCommentByUserid(map); 
	}
	
	@Override
	public void updateUserImage(MultipartFile imagefile, int userno) {

		if(!imagefile.isEmpty()) {
			
		String storedPath = context.getRealPath("emp");
		
		File stored = new File(storedPath);
		if(!stored.exists()) {
			stored.mkdir();
		}
		
		String originName = imagefile.getOriginalFilename();
		
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		int fileSize = (int) imagefile.getSize();

		int dot = imagefile.getOriginalFilename().lastIndexOf(".");
		String contentType = imagefile.getOriginalFilename().substring(dot + 1);

		File dest = new File(stored, storedName);
		
		try {
			imagefile.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		UserImg userImg = new UserImg();
		userImg.setUserNo(userno);
		userImg.setOriginName(originName);
		userImg.setStoredName(storedName);
		userImg.setFilesize(fileSize);
		userImg.setContentType(contentType);
		
		mypageDao.deleteUserImg(userno);
		mypageDao.insertUserImage(userImg);
		
		}
	}
	
	@Override
	public void updateOriginImg(UserImg userImg) {

		mypageDao.deleteUserImg(userImg.getUserNo());
		mypageDao.insertOriginImage(userImg); 
	}
	
	@Override
	public void checkBoxSplit(String[] array) {

		for(int i=0; i<array.length; i++) {
			
			String arr = array[i];
			String[] arrSplit = arr.toString().split("-");
			
			String div = arrSplit[0]; //테이블 분류
			String category = arrSplit[1]; //div분류
			int seqNo = Integer.parseInt(arrSplit[2]); //글번호
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("category", category);
			map.put("seqNo", seqNo);
			
			if(div.equals("bookmark")) {
				mypageDao.deleteCheckBookMark(map);
				
			} else if (div.equals("writing")) {
				
				if(category.equals("3")) {
					mypageDao.deleteMarketWriting(map);
				} else {
					mypageDao.deleteDebateWriting(map);
				}
				
			} else if (div.equals("comment")) {
				
				if(category.equals("1")) {
					mypageDao.deleteMovieComment(map);
				} else if (category.equals("2")) {
					mypageDao.deleteBookComment(map);
				} else {
					mypageDao.deleteDebateComment(map);
				}
			} 
			
		}
		
	}
	
	@Override
	public void checkTransUserInfo(UserInfo userInfo) {

		if(userInfo.getPw().equals("")) {
			mypageDao.updateUserInfo(userInfo);
		} else {
			
			String param = userInfo.getPw();
			
			userInfo.setPw(pwdEncoder.encode(param));
			
			mypageDao.updateUserInfoIncludePw(userInfo);
		}
	}

}
