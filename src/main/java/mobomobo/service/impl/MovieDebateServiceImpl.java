package mobomobo.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mobomobo.dao.face.MovieDebateDao;
import mobomobo.dto.Debate;
import mobomobo.service.face.MovieDebateService;
import mobomobo.util.DebatePaging;

@Service
public class MovieDebateServiceImpl implements MovieDebateService{

	@Autowired
	private MovieDebateDao movieDebateDao;
	
	//로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(MovieDebateServiceImpl.class);

	@Override
	public DebatePaging debatePaging(DebatePaging paging) {

		int totalCount = movieDebateDao.selectDebateCntAll( );
		
		logger.info("moboService - selectDebateCntAll 불러오기 ");
		
		//페이징 계산하기
		DebatePaging dabatePaging = new DebatePaging(totalCount, paging.getCurPage() );
				
		logger.info("adminService - paging 계산끝 ");
		
			return dabatePaging;
	}

	@Override
	public List<Debate> getDebateList(DebatePaging paging) {
			
		logger.info("serviceImpl - DebateList 로 들어오셨습니까?");
			
		logger.info("서비스 paging 객체 검사 합니다 : {}", paging);
			
			return movieDebateDao.selectDebateList(paging);
			
	}

	@Override
	public Debate detail(Debate debate) {

		logger.info("serviceImpl - detail 로 들어오셨습니까?");
		
		// 조회수 증가
		movieDebateDao.updateHit(debate);
		
		return movieDebateDao.selectByDebateNo(debate);
		
	}

	@Override
	public void debateWrite(Debate debate) {
		
		
		// TODO Auto-generated method stub
		
	}

	@Override
	public void debateDelete(Debate debate) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void debateUpdate(Debate debate) {
		// TODO Auto-generated method stub
		
	}

	
}
