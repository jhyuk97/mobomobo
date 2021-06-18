package mobomobo.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import mobomobo.dao.face.MarketDao;
import mobomobo.dto.BookMark;
import mobomobo.dto.ChatLog;
import mobomobo.dto.Market;
import mobomobo.dto.MarketImg;
import mobomobo.dto.UserImg;
import mobomobo.service.face.MarketService;
import mobomobo.util.Paging;

@Service
public class MarketServiceImpl implements MarketService {

	private static final Logger logger = LoggerFactory.getLogger(MarketServiceImpl.class);
	
	@Autowired
	MarketDao marketDao;
	@Autowired 
	ServletContext context;
	
	@Override
	public List<Market> SelectAll(Paging inData) {
		
		//중고마켓 게시글 조회
		List<Market> mList = marketDao.SelectAll(inData);

		//중고마켓 이미지 조회
		List<MarketImg> imgList = marketDao.selectImg();
		
		
		//이미지리스트 게시글리스트로 추가
		for(int i=0; i<mList.size(); i++) {
			List<String> ogImg = new ArrayList<>();
			List<String> stImg = new ArrayList<>();
			for(MarketImg img : imgList) {
				if(mList.get(i).getmNo() == img.getmNo()) {
					ogImg.add(img.getOriginImg());
					stImg.add(img.getStoredImg());
				}
			}
			
			mList.get(i).setOriginImg(ogImg);
			mList.get(i).setStoredImg(stImg);
		}
		
		
		
		return mList;
	}

	@Override
	public Paging getPaging(Paging inData) {
		
		
		//총 게시글 수 조회
		int totalCount = marketDao.SelectCntAll(inData);
		
		
		//페이징 계산
		Paging paging = new Paging(totalCount, inData.getCurPage(), 9);
				
		return paging;
	}
	
	

	@Override
	public Paging getAdminPaging(Paging inData) {
		
		int totalCount = marketDao.SelectCntAll(inData);
		
		Paging paging = new Paging(totalCount, inData.getCurPage());
		
		return paging;
	}

	@Override
	public Market Select(int mNo) {
		marketDao.updateViews(mNo);
		
		return marketDao.Select(mNo);
	}

	@Override
	public List<MarketImg> SelectFile(int mNo) {

		return marketDao.SelectFile(mNo);
	}

	@Override
	public void DeleteMarket(int mNo) {
		
		marketDao.DeleteMarket(mNo);
		
	}

	@Override
	@Transactional
	public void WriteMarket(Market data, List<MultipartFile> file) {
		
		marketDao.InsertMarket(data);
		
		for(MultipartFile f : file) {
			if( f.getSize() <= 0 ) {
				return;
			}
		}
		
		//파일이 저장될 경로(real path)
		String storedPath = context.getRealPath("emp");
		
		//폴더가 존재하지 않으면 생성하기
		File stored = new File(storedPath);
		if( !stored.exists() ) {
			stored.mkdir();
		}
		
		for(MultipartFile f : file) {
			//저장될 파일의 이름 생성하기
			String originName = f.getOriginalFilename(); //원본파일명
			
			//원본파일이름에 UUID추가하기 (파일명이 중복되지않도록 설정)
			String storedName = originName + UUID.randomUUID().toString().split("-")[4];
			
			//저장될 파일 정보 객체
			File dest = new File( stored, storedName );
			
			try {
				//업로드된 파일을 저장하기
				f.transferTo(dest);
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			//이미지 정보 객체에 저장
			MarketImg img = new MarketImg();
			img.setOriginImg(originName);
			img.setStoredImg(storedName);
			img.setFilesize((int)f.getSize());
			img.setContentType(originName.substring(originName.lastIndexOf(".")+1));

			
			marketDao.InsertMarketImg(img);
			
		}
		
	}
	
	
	@Override
	@Transactional
	public void UpdateMarket(Market data, List<MultipartFile> file) {
		
		marketDao.UpdateMarket(data);
		marketDao.DeleteMarketImg(data);
		
		
		for(MultipartFile f : file) {
			if( f.getSize() <= 0 ) {
				return;
			}
		}
	
		//파일이 저장될 경로(real path)
		String storedPath = context.getRealPath("emp");
		
		//폴더가 존재하지 않으면 생성하기
		File stored = new File(storedPath);
		if( !stored.exists() ) {
			stored.mkdir();
		}
		
		for(MultipartFile f : file) {
			//저장될 파일의 이름 생성하기
			String originName = f.getOriginalFilename(); //원본파일명
			
			//원본파일이름에 UUID추가하기 (파일명이 중복되지않도록 설정)
			String storedName = originName + UUID.randomUUID().toString().split("-")[4];
			
			//저장될 파일 정보 객체
			File dest = new File( stored, storedName );
			
			try {
				//업로드된 파일을 저장하기
				f.transferTo(dest);
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			//이미지 정보 객체에 저장
			MarketImg img = new MarketImg();
			img.setOriginImg(originName);
			img.setStoredImg(storedName);
			img.setFilesize((int)f.getSize());
			img.setContentType(originName.substring(originName.lastIndexOf(".")+1));
			img.setmNo(data.getmNo());

			
			marketDao.UpdateMarketImg(img);
			
		}
	}
	
	
	@Override
	public void AddBookmark(BookMark bookmark) {
		// TODO Auto-generated method stub
		
		marketDao.InsertBookmark(bookmark);
		
	}

	@Override
	public boolean CheckBookmark(BookMark bookmark) {
		int count = marketDao.CheckBookmark(bookmark);
		
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public void RemoveBookmark(BookMark bookmark) {
		
		marketDao.DeleteBookmark(bookmark);
		
	}

	@Override
	public List<ChatLog> SelectChatList(String userid) {
		return marketDao.ChatRoomList(userid);
	}

	@Override
	public List<ChatLog> selectLog(String roomid) {
		
		return marketDao.selectLog(roomid);
	}

	@Override
	public List<UserImg> selectImg(ChatLog log) {
		// TODO Auto-generated method stub
		return marketDao.selectUserImg(log);
	}

	@Override
	public List<UserImg> selectChatImg(String userid){
		// TODO Auto-generated method stub
		return marketDao.selectChatImg(userid);
	}

	
	
	
}
