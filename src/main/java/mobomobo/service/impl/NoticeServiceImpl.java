package mobomobo.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mobomobo.dao.face.NoticeDao;
import mobomobo.dto.Notice;
import mobomobo.service.face.NoticeService;
import mobomobo.util.NoticePaging;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	//로깅 객체
		private static final Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
		
	@Override
	public NoticePaging noticePaging(NoticePaging noticePaging) {

		int totalCount = noticeDao.selectNoticeCntAll( noticePaging );
		
		logger.info("adminService - selectNoticeCntAll 불러오기 ");
		
		//페이징 계산 하기
		NoticePaging paging = new NoticePaging(totalCount, noticePaging.getCurPage() );
				
		logger.info("adminService - paging 계산끝  ");
		return paging;
	}

	@Override
	public List<Notice> NoticeList(NoticePaging noticePaging) {
		
		logger.info("serviceImpl - NoticeList 로 들어오셨습니까?");
		
		logger.info("서비스 paging 객체 검사 합니다 : {}",noticePaging);
		
		return noticeDao.selectNoticeList(noticePaging);
	}

	@Override
	public Notice detail(Notice notice) {

		logger.info("serviceImpl - detail 로 들어오셨습니까?");
		
		// 조회수 증가 
		noticeDao.updateHit(notice);
		
		return noticeDao.selectByNoticeNo(notice);
	}

	@Override
	public void write(Notice notice) {

		logger.info("serviceImpl - write 로 들어오셨습니까?");
		
		if ( "".equals(notice.getnTitle()) )
			notice.setnTitle("(제목없음)");
		
		noticeDao.insert(notice);
		
	}

	@Override
	public void delete(Notice notice) {

		noticeDao.delete(notice);
		
	}

	@Override
	public void update(Notice notice) {

		if ( "".equals(notice.getnTitle()) )
			notice.setnTitle("(제목없음)");
		
		logger.info("update로 들어왔냐");
		
		noticeDao.update(notice);
		
	}

}
