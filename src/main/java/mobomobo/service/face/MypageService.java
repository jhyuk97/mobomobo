package mobomobo.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import mobomobo.dto.BookMark;
import mobomobo.dto.MyPage;
import mobomobo.dto.UserImg;
import mobomobo.dto.UserInfo;
import mobomobo.util.Paging;

public interface MypageService {

	public UserInfo getUserInfo(int userno);

	public UserImg getUserImg(int userno);

	public List<MyPage> getMyWriting(int userno, Paging paging);

	public UserInfo checkUserInfo(UserInfo userinfo);

	public List<BookMark> getMyBookMark(int userno, Paging paging);

	public List<MyPage> getMyComment(String userid, Paging paging);

	public void updateUserImage(MultipartFile imagefile, int userno);

	public void updateOriginImg(UserImg userImg);

	public void checkBoxSplit(String[] array);

	public void checkTransUserInfo(UserInfo userInfo);

	public Paging getBookMarkPaging(int curPage, int userno);

	public Paging getWritingPaging(int curPage, int userno);

	public Paging getCommentPaging(int curPage, String userid);

}
