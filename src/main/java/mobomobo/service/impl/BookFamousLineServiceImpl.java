package mobomobo.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import mobomobo.dao.face.BookFamousLineDao;
import mobomobo.dto.BookBest;
import mobomobo.dto.BookBestImg;
import mobomobo.dto.BookBestLike;
import mobomobo.service.face.BookFamousLineService;
import mobomobo.util.BookBestPaging;
@Service
public class BookFamousLineServiceImpl implements BookFamousLineService {

	private static final Logger logger = LoggerFactory.getLogger(BookFamousLineServiceImpl.class);

	@Autowired private BookFamousLineDao bookFamousLineDao;
	@Autowired ServletContext context;
	
	
	@Override
	public BookBestPaging getPaging(BookBestPaging inData) {
		// 총 게시글 수 조회
		int totalCount = bookFamousLineDao.selectCntAll();
		// 페이징 계산
		BookBestPaging paging = new BookBestPaging(totalCount,inData.getCurPage());
		
		return paging;
	}
	@Override
	public List<HashMap<String,Object>> getList(BookBestPaging paging) {
		
		return bookFamousLineDao.selectList(paging);
	}
	@Override
	public BookBest saveBookBest(BookBest bookbest, String bestContext1, String bestContext2, String bestContext3,HttpSession session) {
		
		int cnt = bookFamousLineDao.selectCntBookBestNo();
		
		bookbest.setBookBestno(cnt);
		bookbest.setBestContext(bestContext1+"/"+bestContext2+"/"+bestContext3);
		bookbest.setUserno((int) session.getAttribute("userno"));
		return bookbest;
	}
	@Override
	public void insertBookInfo(BookBest info, BookBestImg img) {
		
//		logger.debug("{}",img);
		
		bookFamousLineDao.insertBookBest(info);
		
		if(img != null) {
			bookFamousLineDao.insertBookBestImg(img);
		}
		
		
		
	}
	@Override
	public BookBestImg saveImg(MultipartFile file, BookBest bookbest) {
		
			logger.info("saveImg()");
		
		
		if(file.getSize() <= 0) {
			logger.info("파일의 크기 0, 처리중단");
			return null;
		}
		
		logger.debug("{}",file.getOriginalFilename());
		
		
		
		
		
		//파일 확장자
		String filename_ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
				//확장자를 소문자로 변경
		filename_ext = filename_ext.toLowerCase();
							
		//이미지 검증 배열
		String[] allow_file = {"jpg","png","bmp","gif"};

		//확장자가 이미지 인지 확인
		int cnt = 0;
		for(int i=0; i<allow_file.length; i++) {
			if(filename_ext.equals(allow_file[i])){
				cnt++;
			}
		}
		// 이미지가 아닐경우 null 
		if(cnt == 0) {
			return null;
		}
				
				
		
		
		
		
		
		// 파일이 저장될 경로( real path )
		String storedPath = context.getRealPath("upload");
		logger.info("realPath upload : {}", storedPath);
		
		// 폴더가 존재하지 않으면 생성하기
		File stored = new File(storedPath);
		if(!stored.exists()) {
			stored.mkdir();
		}
		
		// 저장될 파일의 이름 생성하기
		
		String filename = file.getOriginalFilename();	// 원본 파일명
		
		// UUID값 생성
		String uid = UUID.randomUUID().toString().split("-")[4];
		logger.info(uid);
		
		// 원본파일이름에 UUID추가하기 ( 파일명이 중복되지 않도록 설정 )
		
		filename += uid;
		logger.info(filename);
		
		// 저장될 파일 정보 객체
		File dest = new File(stored, filename);
		
		
		try {
			
			
			// 업로드된 파일을 저장하기
			file.transferTo(dest);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		BookBestImg bookBestImg = new BookBestImg();
		
		int res = bookFamousLineDao.selectBookBestImgFileNo();
		
		
		bookBestImg.setFileno(res);
		bookBestImg.setBookBestno(bookbest.getBookBestno());
		bookBestImg.setFileSize((int) file.getSize());
		bookBestImg.setOriginImg(file.getOriginalFilename());
		bookBestImg.setStoredImg(filename);
		bookBestImg.setContentType(filename_ext);
		
		return bookBestImg;
	}
	@Override
	public BookBest getBookBestInfo(String bookBestno) {
		return bookFamousLineDao.selectBookBest(bookBestno);
	}
	@Override
	public BookBestImg getBookBestImgInfo(String bookBestno) {
		
		return bookFamousLineDao.selectBookBestImg(bookBestno);
	}
	@Override
	public List<BookBestImg> getImgList() {
		return bookFamousLineDao.selectImgList();
	}
	@Override
	public void delete(String bookBestno) {
//		bookFamousLineDao.deleteBookBestImg(bookBestno);
		bookFamousLineDao.deleteBookBest(bookBestno);
	}
	
	
	@Override
	public int viewLike(BookBestLike bookBestLike) {
		
		if(bookFamousLineDao.selectBookBestLikeCnt(bookBestLike)>0) {
			bookFamousLineDao.deleteBookBestLike(bookBestLike);
		}else {
			bookFamousLineDao.insertBookBestLike(bookBestLike);
		}
		
		
		int view = bookFamousLineDao.selectBookBestLike(bookBestLike);
		
		
		return view;
	}
	@Override
	public int viewLike(String bookBestno) {
		
		int view = bookFamousLineDao.selectBookBestLikeByFirstView(bookBestno);
		
		return view;
	}

}

