package mobomobo.service.impl;

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
		
		//페이징 계산하기
		DebatePaging dabatePaging = new DebatePaging(totalCount, inData.getCurPage() );
		
		return dabatePaging;
	}

	@Override
	public List<Debate> getmDebateList(DebatePaging paging) {

		return adminMDebateDao.selectDebateList(paging);
	}

	
}

