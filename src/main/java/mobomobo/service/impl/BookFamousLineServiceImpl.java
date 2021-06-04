package mobomobo.service.impl;

import java.util.List;

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

	@Autowired BookFamousLineDao bookFamousLineDao;
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

}
