package mobomobo.dao.face;

import java.util.List;

import mobomobo.dto.BookMark;
import mobomobo.dto.MyPage;
import mobomobo.dto.UserImg;
import mobomobo.dto.UserInfo;

public interface MypageDao {

	public UserInfo selectUserInfoByUserNo(int userno);

	public UserImg selectUserImgByUserNo(int userno);

	public List<MyPage> selectMyWritingByUserNo(int userno);

	public int selectUserInfoCnt(UserInfo userinfo);

	public List<BookMark> selectMyBookMarkByUserNo(int userno);


}
