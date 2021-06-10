package mobomobo.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mobomobo.dao.face.BookRecomDao;
import mobomobo.dto.BookBest;
import mobomobo.dto.BookKey;
import mobomobo.dto.BookMark;
import mobomobo.dto.BookStarRatingInsert;
import mobomobo.service.face.BookRecomService;
import mobomobo.util.BookBestPaging;
@Service
public class BookRecomServiceImpl implements BookRecomService{
	//로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(BookRecomServiceImpl.class);
	
	@Autowired
	private BookRecomDao bookRecomDao;

	@Override
	public List<HashMap<String,Object>> getRating(String[] isbn) {
		
		logger.info("getRating()");
		
		List<HashMap<String,Object>> list = new ArrayList<>();
		
		
		for(int i = 0; i< isbn.length; i++) {
			list.add(bookRecomDao.selectBookStarRating( isbn[i].substring(0,isbn[i].indexOf(" ")) )); 
		}		
		
		
		
		
		
		
		
		
		return list;
	}

	@Override
	public List<BookBest> getList(BookBestPaging paging) {
		
		return bookRecomDao.selectAll(paging);
	}

	@Override
	public BookBestPaging getPaing(BookBestPaging inData) {
		// 총 게시글수 
		int totalCount = bookRecomDao.selectTotalCntByAwards();
		// 페이징 계산
		BookBestPaging paging = new BookBestPaging(totalCount,inData.getCurPage());
		
		return paging;
	}

	@Override
	public List<HashMap<String, Object>> getList() {
		
		
		
		return bookRecomDao.selectAll();
	}

	

	@Override
	public void deleteBookMark(BookMark bookMarkInfo) {
		
		
		bookRecomDao.deleteBookMarkByKeyUserno(bookMarkInfo);
	}

	@Override
	public void insertBookMark(BookMark bookMarkInfo) {
		
		bookRecomDao.insertBookMarkByKeyUserno(bookMarkInfo);
	}

	@Override
	public BookMark saveBookMarkInfo(BookMark bookMark, HttpSession session) {
		BookMark res = new BookMark();
		res.setKey(bookMark.getKey());
		res.setUserno((Integer)session.getAttribute("userno"));
		res.setCategory("book");
		return res;
	}

	@Override
	public boolean getBookMarkInfo(String substring, HttpSession session) {
		
		if("".equals(session.getAttribute("userno")) || session.getAttribute("userno") == null) {
			return false;
		}
		
		BookMark res = new BookMark();
		res.setKey(substring);
		res.setUserno((Integer)session.getAttribute("userno"));
		res.setCategory("book");
		if(bookRecomDao.selectBookMarkByKeyUserno(res)>0) {
			return true;
		} else {
			return false;
		}
		
	}

	@Override
	@Transactional
	public void insertBookStarRating(BookStarRatingInsert bookStarRating) {
		if(bookRecomDao.selectBookey(bookStarRating)>0) {
			logger.info("bookkey테이블에 존재");
			bookRecomDao.insertBookStarRaingByRatingKeyUsernoAge(bookStarRating);
		} else {
			logger.info("bookkey테이블에 존재하지 않음");
			bookRecomDao.insertBookKey(bookStarRating);
			bookRecomDao.insertBookStarRaingByRatingKeyUsernoAge(bookStarRating);
		}
	}

	@Override
	public HashMap<String, Object> getDetailAvg(String isbn) {
		
		return bookRecomDao.selectBookStarRatingByIsbn(isbn);
	}

	@Override
	public boolean isBookKeyExist(BookStarRatingInsert bookStarRating) {
		
		
		if(bookRecomDao.selectBookKeyByIsbn(bookStarRating)>0) {
			return true;
		} else {
			return false;
		}
		
	}

	@Override
	public void updateBookStarRating(BookStarRatingInsert bookStarRating) {
		bookRecomDao.updateBookStarRating(bookStarRating);
	}

	@Override
	public List<HashMap<String, Object>> getAgeAvg(String isbn) {
		return bookRecomDao.selectAgeAvgByisbn(isbn);
	}

	@Override
	public List<BookKey> getAdminRecomList(BookBestPaging paging) {
		
		return bookRecomDao.selelctAdminBookRecomList(paging);
	}

	@Override
	public BookBestPaging getAdminPaging(BookBestPaging inData) {
		// 총 게시글 수 조회
		int totalCount = bookRecomDao.selectAllCnt(inData);
		// 페이징 계산
		BookBestPaging paging = new BookBestPaging(totalCount,inData.getCurPage());
		return paging;
	}

	@Override
	public void deleteRecom(BookKey bookKey) {
		bookRecomDao.deleteBookKey(bookKey);
	}

	@Override
	public void insertBookKey(BookKey bookKey) {
		
		if(bookRecomDao.selectBookKeyCnt(bookKey) == 0) {
			bookRecomDao.insertBookKeyByAward(bookKey);
		}
		
	}

	
}
