package mobomobo.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import mobomobo.dto.BookMark;
import mobomobo.dto.ChatLog;
import mobomobo.dto.Market;
import mobomobo.dto.MarketImg;
import mobomobo.dto.UserImg;
import mobomobo.util.Paging;

public interface MarketService {
	
	
	//중고마켓 전체 조회
	public List<Market> SelectAll(Paging inData);
	
	
	//페이징 객체 생성
	public Paging getPaging(Paging inData);
	
	//관리자 페이징 생성
	public Paging getAdminPaging(Paging inData);
	
	
	//상세보기 조회
	public Market Select(int mNo);
	
	
	//상세보기 이미지조회
	public List<MarketImg> SelectFile(int mNo);
	
	//중고마켓 게시글 삭제
	public void DeleteMarket(int mNo);
	
	//게시글 등록
	public void WriteMarket(Market data, List<MultipartFile> file);
	
	//게시글 수정
	public void UpdateMarket(Market data, List<MultipartFile> file);
	
	//북마크 추가
	public void AddBookmark(BookMark bookmark);
	
	//북마크 제거
	public void RemoveBookmark(BookMark bookmark);
	
	//북마크 확인
	public boolean CheckBookmark(BookMark bookmark);
	
	//참여한 채팅방 리스트출력
	public List<ChatLog> SelectChatList(String userid);
	
	//채팅내역 불러오기
	public List<ChatLog> selectLog(String roomid);
	
	//유저 이미지 불러오기
	public List<UserImg> selectImg(ChatLog log);
	
	//채팅방 유저프로필불러오기
	public List<UserImg> selectChatImg(String userid);
}
