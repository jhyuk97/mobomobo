package mobomobo.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mobomobo.dao.face.AdminDao;
import mobomobo.dto.Movie;
import mobomobo.dto.MovieAward;
import mobomobo.dto.MovieBest;
import mobomobo.dto.MovieBestImg;
import mobomobo.dto.UserInfo;
import mobomobo.service.face.AdminService;
import mobomobo.service.face.MovieService;
import mobomobo.util.AdminMovieRecomPaging;
import mobomobo.util.MovieBestPaging;
import mobomobo.util.Paging;

@Controller
public class AdminController {
	
	//로깅 객체
		private static final Logger logger
		= LoggerFactory.getLogger(AdminController.class);
		
		@Autowired
		private AdminService adminService;
		
		@Autowired
		private MovieService movieService;
		@Autowired ServletContext context;
		
		@Autowired
		private AdminDao adminDao;


		@RequestMapping(value="/admin/main")
		public void main() {
	
			logger.info("관리자페이지");
	
			}


		
		
		@RequestMapping(value="/admin/tables")
		public void tables() {
			
			logger.info("게시판 테이블 예시");
			
		}
		
		@RequestMapping(value="/admin/movierecom")
		public void movierecom(Model model, @RequestParam(defaultValue="1") int curPage) {
		
			AdminMovieRecomPaging moviepaging = adminService.getAdminMovieListPaging(curPage);
			
			List<MovieAward> list = adminService.getAwardMovieList(moviepaging);
			
			model.addAttribute("list", list);
			model.addAttribute("paging", moviepaging);
		}

		
		@RequestMapping(value = "/admin/usermanagement", method = RequestMethod.GET)
		public void usermanager(Paging userPaging, Model model) {
			
			logger.info("/usermanagement 요청 완료 ");
				
			
//			페이징 계산
			Paging paging = adminService.getPaging( userPaging );
			paging.setSearch( userPaging.getSearch() );
			logger.info("페이징 : {}", paging);
			
			
			//페이징계산후 회원관리 게시판 list 만들기(?)
			List<UserInfo> list = adminService.list( paging ); 
			
//			for ( int i=0; i< list.size(); i++ ) {
//				//테스트
//				logger.info( list.get(i).toString() );
//			}


			//모델값전달
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);			
			
			
		}
		
		@RequestMapping(value = "/admin/userDelete", method = RequestMethod.POST)
		public String userDelete(UserInfo userno, Model model) {
			
			logger.info("/admin/userDelete - [POST] 요청 완료");
			
			logger.info("삭제 되어야 하는 userno : {}", userno);
			
			boolean success = adminService.userDelete(userno);
			
			logger.info("반환되어 돌아오는값 : {}", success);
			
			//jsp로 보냄
			model.addAttribute("success",success);
			
			return "jsonView";
		}
		
		@RequestMapping(value = "/admin/userUpdate", method = RequestMethod.POST)
		public String userUpdate(UserInfo userInfo, Model model) {
			
			logger.info("/admin/userUpdate - [POST] 요청 완료");
			
			logger.info("변경 되어야 하는 userInfo : {}", userInfo);
			
			boolean success = adminService.userUpdate(userInfo);
			
			logger.info("반환되어 돌아오는값 : {}", success);
			
			model.addAttribute("success",success);

			return "redirect:/admin/usermanagement";
		}
		
		@RequestMapping(value="/admin/movierecomSearch")
		public @ResponseBody List<Movie> movierecomSearch(String search) throws IOException, ParseException {
			
			List<Movie> list = movieService.adminMovieSearchList(search);
			
			return list;
		}
		
		@RequestMapping(value="/admin/movierecomWrite", method=RequestMethod.POST)
		public String movierecomWrite(String division, String title, String key, String image) {
			
			HashMap<String, String> map = new HashMap<>();
			map.put("division", division);
			map.put("title", title);
			map.put("key", key);
			map.put("image", image);
			
			adminService.writeMovierecom(map);
			
			return "redirect:/admin/movierecom";
		}
		
		@RequestMapping(value="/admin/movierecomDelete")
		public @ResponseBody void movierecomDelete(MovieAward movieAward) {
			
			adminService.removeMovierecom(movieAward);
		}
		
		@RequestMapping(value="/admin/movie/adminmoviebestlist")
		public void moviebest(MovieBestPaging inData, Model model) {
			
			logger.info("관리자 명장면 게시판 페이지");
			
			MovieBestPaging paging = adminService.getPaging(inData);
			
			List<MovieBest> list = adminService.movieBestlist(paging);
			
			for( int i=0; i<list.size(); i++ ) {
				logger.info( list.get(i).toString() );
			}
			
			//모델값 전달
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			
		}
		
		
		@RequestMapping(value="/admin/movie/adminmoviebestwrite", method = RequestMethod.GET)
		public void moviebestwrite() {
			
			
		}
		
		@RequestMapping(value="/admin/movie/adminmoviebestwrite", method = RequestMethod.POST)
		public String moviebestwriteProc(MovieBest movieBest, MultipartFile[] file, HttpSession session, MultipartHttpServletRequest multi) {
			
			adminDao.movieBestInsert(movieBest);
			
			
		//	logger.debug("글쓰기 : {}", file);
			
		//	logger.debug("글쓰기 : {}", movieBest);
			
		//	
		//	adminService.movieBestWrite(movieBest,file);
			
			
			String storedPath = context.getRealPath("emp");
			
			//폴더가 존재하지 않으면 생성하기
			File stored = new File(storedPath);
			if( !stored.exists() ) {
				stored.mkdir();
			}
			
			for(MultipartFile multipartFile : file) {
				logger.info("--------------------------------------");
				logger.info("Upload File Name : " + multipartFile.getOriginalFilename());
				logger.info("Upload File Size : " + multipartFile.getSize());
			
	
				String originName = multipartFile.getOriginalFilename(); //원본파일명
				
				//원본파일이름에 UUID추가하기 (파일명이 중복되지않도록 설정)
				String storedName = originName + UUID.randomUUID().toString().split("-")[4];
				
				File saveFile = new File(storedPath, storedName);
				
				try {
					multipartFile.transferTo(saveFile);
				}catch (Exception e) {
					logger.error(e.getMessage());
				}
				
				
				MovieBestImg movieBestImg = new MovieBestImg();
				
				movieBestImg.setMovieBestNo(movieBest.getMovieBestNo());
				movieBestImg.setOriginName(originName);
				movieBestImg.setStoredName(storedName);
				
				adminDao.movieBestInsertFile(movieBestImg);
			}
			
			return "redirect:/admin/movie/adminmoviebestlist";
		}
		
	
		@RequestMapping(value="/admin/movie/moviebestdelete")
		public String moviebestdelete(MovieBest movieBest, MovieBestImg moiveBestImg) {
			
			
			adminService.moiveBestDelete(movieBest);

			return "redirect:/admin/movie/adminmoviebestlist";
		}
	
		
}