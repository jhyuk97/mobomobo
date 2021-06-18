package mobomobo.dao.face;

import java.util.List;

import mobomobo.dto.BookMark;
import mobomobo.dto.ChatLog;
import mobomobo.dto.Market;
import mobomobo.dto.MarketImg;
import mobomobo.dto.UserImg;
import mobomobo.util.Paging;

public interface MarketDao {
	
	/*
	 * 게시글 전체 조회 
	 * @param paging객체
	*/
	public List<Market> SelectAll(Paging inData);
	
	
	/*
	 * 중고마켓 전체 게시글수 출력
	 */
	public int SelectCntAll(Paging inData);
	
	
	/*
	 * 중고마켓 이미지 조회
	 */
	public List<MarketImg> selectImg();
	
	
	/*
	 * 중고마켓 상세조회
	 * @param 중고마켓 게시글 번호
	 */
	public Market Select(int mNo);
	
	/*
	 * 상세조회 이미지 리스트
	 */
	public List<MarketImg> SelectFile(int mNo);
	
	
	/*
	 * 중고마켓 게시글 삭제
	 * @param 게시글번호
	 */
	public void DeleteMarket(int mNo);
	
	
	/*
	 * 중고마켓 게시글 등록
	 */
	public void InsertMarket(Market market);
	
	/*
	 * 중고마켓 게시글 이미지 등록
	 */
	public void InsertMarketImg(MarketImg img);
	
	/*
	 * 중고마켓 게시글 수정
	 */
	public void UpdateMarket(Market market);
	
	/*
	 * 기존 게시글 이미지 삭제
	 */
	public void DeleteMarketImg(Market market);
	
	
	/*
	 * 게시글 수정 이미지 등록
	 */
	public void UpdateMarketImg(MarketImg img);
	
	
	/*
	 * 중고마켓 북마크 추가
	 */
	public void InsertBookmark(BookMark bookmark);
	
	/*
	 * 중고마켓 북마크 제거
	 */
	public void DeleteBookmark(BookMark bookmark);
	
	/*
	 * 게시글 북마크 여부확인
	 */
	public int CheckBookmark(BookMark bookmark);
	
	/*
	 * 채팅내역 저장
	 */
	public void InsertChat(ChatLog chat);
	
	/*
	 * 채팅 리스트
	 */
	public List<ChatLog> ChatRoomList(String userid);
	
	/*
	 * 채팅내역 리스트
	 */
	public List<ChatLog> selectLog(String roomid);
	
	/*
	 * 조회수 증가
	 */
	public void updateViews(int mNo);
	
	/*
	 * 사용자 이미지 불러오기
	 */
	public List<UserImg> selectUserImg(ChatLog log);
	
	/*
	 * 채팅방리스트 프로필불러오기
	 */
	public List<UserImg> selectChatImg(String userid);
	
	
}
