package mobomobo.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mobomobo.dao.face.AdminMDebateDao;
import mobomobo.dto.Debate;
import mobomobo.service.face.AdminDebateService;
import mobomobo.util.DebatePaging;

@Service
public class AdminDebateServiceImpl implements AdminDebateService{

	@Autowired
	private AdminMDebateDao adminMDebateDao;

	//로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(AdminDebateServiceImpl.class);
	
	@Override
	public DebatePaging mdebatePaging(DebatePaging inData) {
		
		int totalCount = adminMDebateDao.selectDebateCntAll(inData);
		
		logger.info("@@@@@@@@@@@@@@@@ {}", totalCount);
		
		//페이징 계산하기
		DebatePaging dabatePaging = new DebatePaging(totalCount, inData.getCurPage() );
		
		logger.info("@@@@@@@@@@@@@@@@@#@#@#@#@#@# {}", dabatePaging);
		
		return dabatePaging;
	}

	@Override
	public List<Debate> getmDebateList(DebatePaging paging) {

		return adminMDebateDao.selectDebateList(paging);
	}

	@Override
	public boolean dNoDelete(Debate dNo) {
		
		logger.info("dNoDelete 요청 완료 ");
		logger.info("dNoDelete dNo {} ", dNo);
		
		adminMDebateDao.dNoDelete(dNo);
		

		
		//삭제 진행후 그 userno 의 값이 있는 지 없는지 검사 후 return값 설정
		if (adminMDebateDao.countdNo(dNo) <= 0) {
			
			logger.info(" true");
			
			return true;
			
		} else 	{	
			logger.info("false");
			return false;
		}

	}

	@Override
	public List<HashMap<String, Object>> getHotList(int category) {

		return adminMDebateDao.selectHot(category);
	}

	
}

