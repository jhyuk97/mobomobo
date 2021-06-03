package mobomobo.dao.face;

import java.util.List;

import mobomobo.dto.Market;
import mobomobo.dto.MarketImg;
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
}
