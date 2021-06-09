package mobomobo.service.face;

import java.util.List;

import mobomobo.dto.MyPage;
import mobomobo.dto.UserImg;
import mobomobo.dto.UserInfo;

public interface MypageService {

	public UserInfo getUserInfo(int userno);

	public UserImg getUserImg(int userno);

	public List<MyPage> getMyWriting(int userno);

}
