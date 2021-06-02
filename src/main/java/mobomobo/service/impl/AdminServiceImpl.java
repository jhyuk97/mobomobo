package mobomobo.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import mobomobo.dao.face.AdminDao;
import mobomobo.dto.UserInfo;
import mobomobo.service.face.AdminService;
import mobomobo.util.Paging;

@Service
public class AdminServiceImpl implements AdminService{
	
	
	//로깅 객체
	private static final Logger logger
	= LoggerFactory.getLogger(AdminServiceImpl.class);

	@Autowired
	private AdminDao adminDao;
	
	@Override
	public Paging getPaging(Paging userPaging) {
		
		int totalCount = adminDao.selectCntAll( userPaging );
		
		logger.info("adminService - getPaging 요청 - adminDao.selectCntAll 까지 완료된 상태 : {}", userPaging);
		
		
		//페이징 계산 하기
		Paging paging = new Paging(totalCount, userPaging.getCurPage() );
		
		return paging;
	}

	@Override
	public List<UserInfo> list(Paging paging) {
		
		logger.info("adminService - list 불러오기 ");
		
		return adminDao.selectPageList(paging);
	}

	@Override
	public void userDelete(UserInfo userno) {
		
		logger.info("adminservice - userDelte 요청 완료 ");
		
		adminDao.userDelete(userno);
		
		
		
	}

}
