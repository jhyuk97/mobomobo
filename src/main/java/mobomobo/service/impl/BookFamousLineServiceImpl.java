package mobomobo.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mobomobo.controller.BookFamousController;
import mobomobo.dao.face.BookFamousLineDao;
import mobomobo.dto.BookBest;
import mobomobo.service.face.BookFamousLineService;
import mobomobo.util.BookBestPaging;
@Service
public class BookFamousLineServiceImpl implements BookFamousLineService {

	private static final Logger logger = LoggerFactory.getLogger(BookFamousLineServiceImpl.class);

	@Autowired private BookFamousLineDao bookFamousLineDao;
	@Override
	public BookBestPaging getPaging(BookBestPaging inData) {
		// 총 게시글 수 조회
		int totalCount = bookFamousLineDao.selectCntAll();
		// 페이징 계산
		BookBestPaging paging = new BookBestPaging(totalCount,inData.getCurPage());
		
		return paging;
	}
	@Override
	public List<BookBest> getList(BookBestPaging paging) {
		return bookFamousLineDao.selectList(paging);
	}
	@Override
	public BookBest saveBookBest(BookBest bookbest, String bestContext1, String bestContext2, String bestContext3,HttpSession session) {
		
		bookbest.setBestContext(bestContext1+"/"+bestContext2+"/"+bestContext3);
		bookbest.setUserno((int) session.getAttribute("userno"));
		return bookbest;
	}
	@Override
	public void insertBookInfo(BookBest info) {
		bookFamousLineDao.insertBookBest(info);
	}

}
