package mobomobo.dao.face;

import java.util.List;

import mobomobo.dto.MyPage;
import mobomobo.dto.UserImg;
import mobomobo.dto.UserInfo;

public interface MypageDao {

	public UserInfo selectUserInfoByUserNo(int userno);

	public UserImg selectUserImgByUserNo(int userno);

	public List<MyPage> selectMyWritingByUserNo(int userno);


}
