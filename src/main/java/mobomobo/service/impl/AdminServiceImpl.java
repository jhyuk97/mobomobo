package mobomobo.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import mobomobo.dao.face.AdminDao;
import mobomobo.dto.MovieAward;
import mobomobo.dto.UserInfo;
import mobomobo.service.face.AdminService;
import mobomobo.util.AdminMovieRecomPaging;
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
	public boolean userDelete(UserInfo userno) {
		
		logger.info("adminservice - userDelte 요청 완료 ");
		
		adminDao.userDelete(userno);
		
		//삭제 진행후 그 userno 의 값이 있는 지 없는지 검사 후 return값 설정
		if (adminDao.countUser(userno) > 0) {
			
			logger.info("adminservice 의 countUser의 결과 - true");
			
			return true;
			
		} else 	{	
			logger.info("adminservice 의 countUser의 결과 - false");
			return false;
		}
		
	}

	@Override
	public void writeMovierecom(HashMap<String, String> map) {

		adminDao.insertMovierecom(map);
	}
	
	@Override
	public AdminMovieRecomPaging getAdminMovieListPaging(int curPage) {

		int totalCount = adminDao.selectMoiveCnt();
		
		AdminMovieRecomPaging moviePaging = new AdminMovieRecomPaging(totalCount, curPage);
		
		return moviePaging;
	}
	
	@Override
	public List<MovieAward> getAwardMovieList(AdminMovieRecomPaging moviepaging) {
		
		return adminDao.selectMovieAwardList(moviepaging);
	}
	
}
