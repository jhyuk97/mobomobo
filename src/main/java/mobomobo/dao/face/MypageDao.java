package mobomobo.dao.face;

import java.util.HashMap;
import java.util.List;

import mobomobo.dto.BookMark;
import mobomobo.dto.MyPage;
import mobomobo.dto.UserImg;
import mobomobo.dto.UserInfo;

public interface MypageDao {

	public UserInfo selectUserInfoByUserNo(int userno);

	public UserImg selectUserImgByUserNo(int userno);

	public List<MyPage> selectMyWritingByUserNo(HashMap<String, Object> map);

	public UserInfo selectUserInfoCnt(UserInfo userinfo);

	public List<BookMark> selectMyBookMarkByUserNo(HashMap<String, Object> map);

	public List<MyPage> selectMyCommentByUserid(HashMap<String, Object> map);

	public void insertUserImage(UserImg userImg);

	public void deleteUserImg(int userno);

	public void insertOriginImage(UserImg userImg);

	public void deleteCheckBookMark(HashMap<String, Object> map);

	public void deleteMarketWriting(HashMap<String, Object> map);

	public void deleteDebateWriting(HashMap<String, Object> map);

	public void deleteMovieComment(HashMap<String, Object> map);

	public void deleteBookComment(HashMap<String, Object> map);

	public void deleteDebateComment(HashMap<String, Object> map);

	public void updateUserInfo(UserInfo userInfo);

	public void updateUserInfoIncludePw(UserInfo userInfo);

	public int selectCntAll(int userno);

	public int selectCntAllComment(String userid);

	public int selectCtnAllWriting(int userno);


}
