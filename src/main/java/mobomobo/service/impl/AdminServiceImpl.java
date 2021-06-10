package mobomobo.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import mobomobo.dao.face.AdminDao;
import mobomobo.dto.MovieAward;
import mobomobo.dto.MovieBest;
import mobomobo.dto.MovieBestImg;
import mobomobo.dto.UserInfo;
import mobomobo.service.face.AdminService;
import mobomobo.util.AdminMovieRecomPaging;
import mobomobo.util.MovieBestPaging;
import mobomobo.util.Paging;

@Service
public class AdminServiceImpl implements AdminService{
	
	//로깅 객체
	private static final Logger logger
	= LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Autowired ServletContext context;
	
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
		
		logger.info("검사 완료한 값 = {}" ,(adminDao.countUser(userno)));
		
		//삭제 진행후 그 userno 의 값이 있는 지 없는지 검사 후 return값 설정
		if (adminDao.countUser(userno) <= 0) {
			
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

	@Override
	public boolean userUpdate(UserInfo userInfo) {
		
		logger.info("adminservice - userUpdate 요청 완료 ");
		
		adminDao.userUpdate(userInfo);
		

		
		//변경 진행 후 변경 검사
		if (adminDao.countUser(userInfo) <= 0) {
			
			logger.info("adminservice 의 countUser의 결과 - true");
			
			return true;
			
		} else 	{	
			logger.info("adminservice 의 countUser의 결과 - false");
			return false;
		}
		
	}
	
	@Override
	public void removeMovierecom(MovieAward movieAward) {

		adminDao.deleteMovierecom(movieAward);
	}

	
	@Override
	public MovieBestPaging getPaging(MovieBestPaging inData) {
		
		int totalCount = adminDao.movieBestSelectCntAll();
		
		logger.info(totalCount + "");
		
		MovieBestPaging moviebestpaging = new MovieBestPaging(totalCount, inData.getCurPage());

		return moviebestpaging;
	}

	@Override
	public List<MovieBest> movieBestlist(MovieBestPaging paging) {
		
		return adminDao.selectPageMovieBest(paging);
	}

	@Override
	@Transactional
	public void movieBestWrite(MovieBest movieBest, MultipartFile file) {
		
		adminDao.movieBestInsert(movieBest);

		
		
		//-------------------------------------------------------------------
		
		
		//파일이 저장될 경로(real path)
		String storedPath = context.getRealPath("emp");
		
		//폴더가 존재하지 않으면 생성하기
		File stored = new File(storedPath);
		if( !stored.exists() ) {
			stored.mkdir();
		}
		
		
		//저장될 파일의 이름 생성하기
		String originName = file.getOriginalFilename(); //원본파일명
		
		//원본파일이름에 UUID추가하기 (파일명이 중복되지않도록 설정)
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장될 파일 정보 객체
		File saveFile = new File( stored, storedName );
		
		try {
			//업로드된 파일을 저장하기
			file.transferTo(saveFile);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//----------------------------------------
		
		MovieBestImg movieBestImg = new MovieBestImg();
		
		movieBestImg.setMovieBestNo(movieBest.getMovieBestNo());
		movieBestImg.setOriginName(originName);
		movieBestImg.setStoredName(storedName);
		
		adminDao.movieBestInsertFile(movieBestImg);
		
		
	}

	@Override
	public MovieBestImg getMovieBestImg(int imgNo) {
		
		return adminDao.selectByMovieBestFileNo(imgNo);
	}

	@Override
	public MovieBestImg getMovieBestFile(MovieBest viewMovieBest) {
		// TODO Auto-generated method stub
		return adminDao.selectByMovieBestNo(viewMovieBest);
	}

	@Override
	@Transactional
	public void moiveBestDelete(MovieBest movieBest) {
		
		adminDao.deleteMovieBestImg(movieBest);
		adminDao.deleteMovieBest(movieBest);
		
		
	}

	
}
