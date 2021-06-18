package mobomobo.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mobomobo.dao.face.MovieDao;
import mobomobo.dto.BookMark;
import mobomobo.dto.Movie;
import mobomobo.dto.MovieAward;
import mobomobo.dto.MovieBest;
import mobomobo.dto.MovieBestComment;
import mobomobo.dto.MovieBestCommentLike;
import mobomobo.dto.MovieBestImg;
import mobomobo.dto.MovieBestLike;
import mobomobo.dto.MovieCrawler;
import mobomobo.dto.MovieStarRating;
import mobomobo.dto.UserImg;
import mobomobo.service.face.MovieService;
import mobomobo.util.MovieBestPaging;

@Service
public class MovieServiceImpl implements MovieService{
	
	private static final Logger logger = LoggerFactory.getLogger(MovieServiceImpl.class);
	
	@Autowired
	MovieDao movieDao;
	
	//영화진흥위원회 서비스키
	private String serviceKey = "e4d9b0090b2fe76c700e81e3ffd96704";
	
	//감독명에 맞는 영화 조회 (4개)
	@Override
	public List<Movie> getMainList(String directorName) throws IOException, ParseException {
		
		List<Movie> list = new ArrayList<>();
		
		if(directorName != null) {
		
		StringBuilder urlBuilder = new StringBuilder("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json");
		
        urlBuilder.append("?" + URLEncoder.encode("key","UTF-8") + "="+serviceKey);
        urlBuilder.append("&" + URLEncoder.encode("directorNm","UTF-8") + "=" + URLEncoder.encode(directorName, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("itemPerPage","UTF-8") + "=" + 4);
		
        
        URL url = new URL(urlBuilder.toString());
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        conn.setRequestMethod("GET");
        
        conn.setRequestProperty("Content-type", "application/json");
        
        BufferedReader rd;
        
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) { // API 정상 호출
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else { //에러 발생
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        
        String line;
        
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        rd.close();
        
        conn.disconnect();
        
        String result = sb.toString();
        
        JSONParser parser = new JSONParser();
        
        JSONObject obj = (JSONObject) parser.parse(result);
        
        JSONObject parseMovieListResult = (JSONObject) obj.get("movieListResult");

        JSONArray parseMovieList = (JSONArray) parseMovieListResult.get("movieList");
        
	        JSONObject movieList;    
	        JSONObject director;
	        
	        for(int i=0; i<parseMovieList.size(); i++) {
	        	movieList = (JSONObject) parseMovieList.get(i);
	        	
	        	Movie movie = new Movie();
	
	        	movie.setKey((String) movieList.get("movieCd"));
	        	movie.setTitle((String) movieList.get("movieNm"));
	        	movie.setGenres((String) movieList.get("repGenreNm"));
	        	
	        	JSONArray dir = (JSONArray) movieList.get("directors");
	        	
	        	for(int j=0; j<dir.size(); j++) {
	        		director = (JSONObject) dir.get(j);
	        		
	        		movie.setDirectors((String) director.get("peopleNm"));
	        	}
	
	        	movie = getMovieImage(movie);
	        	
	        	list.add(movie);
	        	
	        }
	
		}
		return list;
	}
	
	//검색한 영화의 수 조회
	@Override
	public int getListCnt(String search) throws IOException, ParseException {
		
		StringBuilder urlBuilder = new StringBuilder("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json");
		
        urlBuilder.append("?" + URLEncoder.encode("key","UTF-8") + "="+serviceKey);
        urlBuilder.append("&" + URLEncoder.encode("movieNm","UTF-8") + "=" + URLEncoder.encode(search, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("itemPerPage","UTF-8") + "=" + 30);
		
        
        URL url = new URL(urlBuilder.toString());
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        conn.setRequestMethod("GET");
        
        conn.setRequestProperty("Content-type", "application/json");
        
        BufferedReader rd;
        
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) { // API 정상 호출
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else { //에러 발생
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        
        String line;
        
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        rd.close();
        
        conn.disconnect();
        
        String result = sb.toString();
        
        JSONParser parser = new JSONParser();
        
        JSONObject obj = (JSONObject) parser.parse(result);
        
        JSONObject parseMovieListResult = (JSONObject) obj.get("movieListResult");

        JSONArray parseMovieList = (JSONArray) parseMovieListResult.get("movieList");
		
		return parseMovieList.size();
	}
	
	//검색한 영화 리스트 조회 + 페이징
	@Override
	public List<Movie> getList(String search, int curpage) throws IOException, ParseException {

		
		StringBuilder urlBuilder = new StringBuilder("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json");
		
        urlBuilder.append("?" + URLEncoder.encode("key","UTF-8") + "="+serviceKey);
        urlBuilder.append("&" + URLEncoder.encode("movieNm","UTF-8") + "=" + URLEncoder.encode(search, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("itemPerPage","UTF-8") + "=" + 8);
        urlBuilder.append("&" + URLEncoder.encode("curPage","UTF-8") + "=" + curpage);
		
        
        URL url = new URL(urlBuilder.toString());
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        conn.setRequestMethod("GET");
        
        conn.setRequestProperty("Content-type", "application/json");
        
        BufferedReader rd;
        
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) { // API 정상 호출
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else { //에러 발생
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        
        String line;
        
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        rd.close();
        
        conn.disconnect();
        
        String result = sb.toString();
        
        JSONParser parser = new JSONParser();
        
        JSONObject obj = (JSONObject) parser.parse(result);
        
        JSONObject parseMovieListResult = (JSONObject) obj.get("movieListResult");

        JSONArray parseMovieList = (JSONArray) parseMovieListResult.get("movieList");
        
        JSONObject movieList;    
        JSONObject director;
        
        List<Movie> list = new ArrayList<>();
        
        for(int i=0; i<parseMovieList.size(); i++) {
        	movieList = (JSONObject) parseMovieList.get(i);
        	
        	Movie movie = new Movie();

        	movie.setKey((String) movieList.get("movieCd"));
        	movie.setTitle((String) movieList.get("movieNm"));
        	movie.setGenres((String) movieList.get("repGenreNm"));
        	
        	JSONArray dir = (JSONArray) movieList.get("directors");
        	
        	for(int j=0; j<dir.size(); j++) {
        		director = (JSONObject) dir.get(j);
        		
        		movie.setDirectors((String) director.get("peopleNm"));
        	}

        	if(movie.getTitle() != null) {
        	movie = getMovieImage(movie);
        	}
        	
        	list.add(movie);
        	
        }
		
		return list;
	}
	
	//영화의 이미지 조회
	public Movie getMovieImage(Movie movie) throws IOException, ParseException {
		
        String clientId = "wla82tmYgxtmxGQuvyrO";
        String clientSecret = "ZTMk48WHjf";
        
        String text = URLEncoder.encode(movie.getTitle(), "UTF-8");
        
        String apiURL = "https://openapi.naver.com/v1/search/movie.json?query="+ text;
        
        URL url = new URL(apiURL);
        
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("X-Naver-Client-Id", clientId);
        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
        int responseCode = con.getResponseCode();
        
        BufferedReader br;
        if(responseCode==200) { // API 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        
        String inputLine;
        StringBuffer response = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
            response.append(inputLine);
        }
        
        br.close();
        
        String result = response.toString();
        
        JSONParser parser = new JSONParser();

        JSONObject obj = (JSONObject) parser.parse(result);
        
        JSONArray parseItems = (JSONArray) obj.get("items");
        
        JSONObject movieList;
        
        
        if(parseItems != null) {
	        for(int i=0; i<parseItems.size(); i++) {
	        	movieList = (JSONObject) parseItems.get(i);

	        	if(Integer.parseInt(String.valueOf(obj.get("total"))) > 1) {
	        		if(movieList.get("director").toString().split("\\|")[0].equals(movie.getDirectors())) {
	        			
	        			movie.setImage((String)movieList.get("image"));
	        		}
	        	} else {
	        		movie.setImage((String)movieList.get("image"));
	        	}
	        }
        }
		
		return movie;
	}
	
	//영화의 상세정보 조회
	@Override
	public Movie getMovieInfo(Movie movie) throws IOException, ParseException {

		StringBuilder urlBuilder = new StringBuilder("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json");
		
        urlBuilder.append("?" + URLEncoder.encode("key","UTF-8") + "="+serviceKey);
        urlBuilder.append("&" + URLEncoder.encode("movieCd","UTF-8") + "=" + URLEncoder.encode(movie.getKey(), "UTF-8"));
		
        URL url = new URL(urlBuilder.toString());
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        conn.setRequestMethod("GET");
        
        conn.setRequestProperty("Content-type", "application/json");
        
        BufferedReader rd;
        
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        
        String line;
        
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        rd.close();
        
        conn.disconnect();
        
        String result = sb.toString();
        
        JSONParser parser = new JSONParser();
        
        JSONObject obj = (JSONObject) parser.parse(result);
        
        JSONObject parseMovieInfoResult = (JSONObject) obj.get("movieInfoResult");
        
        JSONObject parseMovieInfo = (JSONObject) parseMovieInfoResult.get("movieInfo");
        
        movie.setTitle((String)parseMovieInfo.get("movieNm"));
        movie.setShowTm((String)parseMovieInfo.get("showTm"));
        
//        if((String)parseMovieInfo.get("openDt") != null) {
//        String year = ((String)parseMovieInfo.get("openDt")).substring(0, 4);
//        String month = ((String)parseMovieInfo.get("openDt")).substring(4, 6);
//        String day = ((String)parseMovieInfo.get("openDt")).substring(6, 8);
//        
//        movie.setOpenDt(year + "년 " + month + "월 " + day + "일");
//        } else {
        	movie.setOpenDt((String)parseMovieInfo.get("openDt"));
//        }
        
        JSONArray dir = (JSONArray) parseMovieInfo.get("directors");
        JSONArray nat = (JSONArray) parseMovieInfo.get("nations");
        JSONArray genre = (JSONArray) parseMovieInfo.get("genres");
        JSONArray actor = (JSONArray) parseMovieInfo.get("actors");
        JSONArray audit = (JSONArray) parseMovieInfo.get("audits");
        
        
        JSONObject movieInfo;
        
        for(int i=0; i<dir.size(); i++) {
        	movieInfo = (JSONObject) dir.get(i);
        	
        	movie.setDirectors((String)movieInfo.get("peopleNm"));
        }
        
        for(int i=0; i<nat.size(); i++) {
        	movieInfo = (JSONObject) nat.get(i);
        	
        	movie.setNationNm((String)movieInfo.get("nationNm"));
        }
        
        String genrename = "";
        for(int i=0; i<genre.size(); i++) {
        	movieInfo = (JSONObject) genre.get(i);
        	
        	if(i == genre.size()-1) {
        		genrename += movieInfo.get("genreNm");
        	} else {
        		genrename += movieInfo.get("genreNm") + ", ";
        	}
        }
        movie.setGenres(genrename);
        
        String actors = "";
        if(actor.size() > 5) {
        	for(int i=0; i<5; i++) {
        		movieInfo = (JSONObject) actor.get(i);
        		
        		if(i == 4) {
        			actors += movieInfo.get("peopleNm");
        		} else {
        			actors += movieInfo.get("peopleNm") + ", ";
        		}
        	}
        } else {
        	for(int i=0; i<actor.size(); i++) {
        		movieInfo = (JSONObject) actor.get(i);
        		
        		if(i == actor.size() -1) {
        			actors += movieInfo.get("peopleNm");
        		} else {
        			actors += movieInfo.get("peopleNm") + ", ";
        		}
        	}
        }
        movie.setActors(actors);
        
        for(int i=0; i<audit.size(); i++) {
        	movieInfo = (JSONObject) audit.get(i);
        	
        	movie.setGrades((String)movieInfo.get("watchGradeNm"));
        }
		
		return movie;
	}
	
	//관리자 페이지 영화 리스트 조회
	@Override
	public List<Movie> adminMovieSearchList(String search) throws IOException, ParseException {

		
		StringBuilder urlBuilder = new StringBuilder("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json");
		
        urlBuilder.append("?" + URLEncoder.encode("key","UTF-8") + "="+serviceKey);
        urlBuilder.append("&" + URLEncoder.encode("movieNm","UTF-8") + "=" + URLEncoder.encode(search, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("itemPerPage","UTF-8") + "=" + 30);
		
        
        URL url = new URL(urlBuilder.toString());
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        conn.setRequestMethod("GET");
        
        conn.setRequestProperty("Content-type", "application/json");
        
        BufferedReader rd;
        
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) { // API 정상 호출
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else { //에러 발생
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        
        String line;
        
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        rd.close();
        
        conn.disconnect();
        
        String result = sb.toString();
        
        JSONParser parser = new JSONParser();
        
        JSONObject obj = (JSONObject) parser.parse(result);
        
        JSONObject parseMovieListResult = (JSONObject) obj.get("movieListResult");

        JSONArray parseMovieList = (JSONArray) parseMovieListResult.get("movieList");
        
        JSONObject movieList;    
        JSONObject director;
        
        List<Movie> list = new ArrayList<>();
        
        for(int i=0; i<parseMovieList.size(); i++) {
        	movieList = (JSONObject) parseMovieList.get(i);
        	
        	Movie movie = new Movie();

        	movie.setKey((String) movieList.get("movieCd"));
        	movie.setTitle((String) movieList.get("movieNm"));
        	
        	JSONArray dir = (JSONArray) movieList.get("directors");
        	
        	for(int j=0; j<dir.size(); j++) {
        		director = (JSONObject) dir.get(j);
        		
        		movie.setDirectors((String) director.get("peopleNm"));
        	}

        	if(movie.getTitle() != null) {
        	movie = getMovieImage(movie);
        	}
        	
        	list.add(movie);
        	
        }
		
		return list;
	}
	
	//영화 1개 검색 메소드
	@Override
	public Movie getMovieSearchOne(String string) throws IOException, ParseException {

		StringBuilder urlBuilder = new StringBuilder("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json");
		
        urlBuilder.append("?" + URLEncoder.encode("key","UTF-8") + "="+serviceKey);
        urlBuilder.append("&" + URLEncoder.encode("movieNm","UTF-8") + "=" + URLEncoder.encode(string, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("itemPerPage","UTF-8") + "=" + 30);
		
        
        URL url = new URL(urlBuilder.toString());
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        conn.setRequestMethod("GET");
        
        conn.setRequestProperty("Content-type", "application/json");
        
        BufferedReader rd;
        
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) { // API 정상 호출
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else { //에러 발생
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        
        String line;
        
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        rd.close();
        
        conn.disconnect();
        
        String result = sb.toString();
        
        JSONParser parser = new JSONParser();
        
        JSONObject obj = (JSONObject) parser.parse(result);
        
        JSONObject parseMovieListResult = (JSONObject) obj.get("movieListResult");

        JSONArray parseMovieList = (JSONArray) parseMovieListResult.get("movieList");
        
        JSONObject movieList;    
        JSONObject director;
        
        Movie movie = new Movie();
        
        for(int i=0; i<parseMovieList.size(); i++) {
        	movieList = (JSONObject) parseMovieList.get(i);

        	movie.setKey((String) movieList.get("movieCd"));
        	movie.setTitle((String) movieList.get("movieNm"));
        	
        	JSONArray dir = (JSONArray) movieList.get("directors");
        	
        	for(int j=0; j<dir.size(); j++) {
        		director = (JSONObject) dir.get(j);
        		
        		movie.setDirectors((String) director.get("peopleNm"));
        	}

        	if(movie.getTitle() != null) {
        	movie = getMovieImage(movie);
        	}
        	
        }
		
		return movie;
		
	}
	
	//영화 구매 정보 크롤링 
	@Override
	public List<MovieCrawler> getMovieCrawler(String title, String directors) {

		List<MovieCrawler> list = new ArrayList<>();
		
		String URL = "https://serieson.naver.com/search/search.nhn?t=movie&fs=default&q=" + title;
		
		Connection conn = Jsoup.connect(URL);
		
		try {
			Document html = conn.get();
			
			Elements ulTag = html.getElementsByClass("lst_list");
			
			if(ulTag.toString().split("<li>").length > 2) {
				
				for(int i=0; i < (ulTag.toString().split("<li>").length) -1; i++ ) {
				
					if((html.getElementsByClass("info").get(i).getElementsByClass("cast")
							.get(0).text()).equals("감독 " + directors)) {
					
					MovieCrawler movie = new MovieCrawler();
					
					movie.setTitle(html.getElementsByClass("N=a:mov.title").get(i).getElementsByTag("a").text());
					
					movie.setSummary(html.getElementsByClass("dsc").get(i).text());
					
					movie.setPrice(html.getElementsByClass("cont").get(i).getElementsByClass("price2 v2")
							.get(0).getElementsByClass("by_tit").text()
							+ " : " + html.getElementsByClass("cont").get(i).getElementsByClass("price2 v2")
							.get(0).getElementsByTag("strong").text() + "원");
					
					movie.setBuyUrl("https://serieson.naver.com" + html.getElementsByClass("N=a:mov.title").get(i).attr("href"));
					
					list.add(movie);
					
					}
				}
			} else if(ulTag.toString().split("<li>").length > 1) {
				
				MovieCrawler movie = new MovieCrawler();
				
				movie.setTitle(html.getElementsByClass("N=a:mov.title").get(0).getElementsByTag("a").text());
				
				movie.setSummary(html.getElementsByClass("dsc").get(0).text());
				
				movie.setPrice(html.getElementsByClass("cont").get(0).getElementsByClass("price2 v2").get(0).getElementsByClass("by_tit").text() + " : " + html.getElementsByClass("cont").get(0).getElementsByClass("price2 v2").get(0).getElementsByTag("strong").text() + "원");
				
				movie.setBuyUrl("https://serieson.naver.com" + html.getElementsByClass("N=a:mov.title").get(0).attr("href"));
				
				list.add(movie);
				
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//별점 저장하기
	@Override
	public void setStarRating(MovieStarRating movieStarRating) {
		
		movieDao.deleteStarRating(movieStarRating);

		movieDao.insertStarRating(movieStarRating);
		
	}
	
	//상세보기 페이지 조회시 별점 등록했는지 검사
	@Override
	public double checkStarRating(MovieStarRating movieStarRating) {
		
		int check = movieDao.existMovieStarRatingByUserNo(movieStarRating);
		
		double starRating;
		
		if(check > 0) {
			starRating = movieDao.selectMovieStarRatingByUserno(movieStarRating);
		} else {
			starRating = 404;
		}
		
		return starRating;
	}
	
	//연령별 별점 평균 구하기
	@Override
	public List<MovieStarRating> getStarAvg(String key) {

		return movieDao.selectStarAvg(key);
	}
	
	//영화 추천 게시판 북마크 상태 조회
	@Override
	public boolean checkBookMark(BookMark bookmark) {

		int res = movieDao.selectBookMarkByUserNo(bookmark);
		
		if(res > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public MovieBestPaging getPaging(MovieBestPaging inData) {
		
		int totalCount = movieDao.selectCntAll();
		
		logger.info(totalCount + "");
		
		MovieBestPaging paging = new MovieBestPaging(totalCount, inData.getCurPage());
	
		
		return paging;
	}

	@Override
	public List<MovieBest> list(MovieBestPaging paging) {
		
		return movieDao.selectPageList(paging);
	}

	@Override
	public List<MovieBest> movielist() {
		
		return movieDao.movielist();
	}

	@Override
	public MovieBest view(MovieBest viewMovieBest) {
		
		return movieDao.selectMovieByMovieBestNo(viewMovieBest);
	}

	public boolean isMovieBestLike(MovieBestLike movieBestLike) {
		
		int cnt = movieDao.selectCntMovieBestLike(movieBestLike);
		
		if(cnt > 0) {
			return true;
		} else {
			return false;
		}
		
	}
	
	//영화 추천 게시판 북마크 등록/해제
	@Override
	public boolean manageBookMark(BookMark bookmark) {

		if(checkBookMark(bookmark)) {
			movieDao.deleteBookMark(bookmark);
			return false;
		} else {
			bookmark.setCategory("movie");
			movieDao.insertBookMark(bookmark);
			return true;
		}
	}
	

	@Override
	public int getTotalCntMovieBestLike(MovieBestLike movieBestLike) {
		
		return movieDao.selectTotalCntMovieBestLike(movieBestLike);
		

	}

	@Override
	public boolean movielike(MovieBestLike movieBestLike) {
		
		if(isMovieBestLike(movieBestLike)) {
			movieDao.deleteMovieBestLike(movieBestLike);
			
			return false;
			
		} else {
			
			movieDao.insertMovieBestLike(movieBestLike);
			
			return true;
		}
		
	}
	
	//무부 추천영화 리스트 가져오기
	@Override
	public List<MovieAward> getRecomList() {
		return movieDao.selectRecomList();
	}
	
	//영화 추천 상세보기페이지 해당영화 평균 별점
	@Override
	public String getStarAvgOfSingle(String key) {
		return movieDao.selectStarAvgOfSingle(key);
	}
	

	@Override
	public void insertMovieBestComment(MovieBestComment movieBestComment) {
		
		movieDao.insertMovieBestComment(movieBestComment);
		
	}

	@Override
	public List<MovieBestComment> getMovieBestCommentList(int movieBestNo) {
		// TODO Auto-generated method stub
		return movieDao.selectMovieBestComment(movieBestNo);
	}

	@Override
	public boolean deleteComment(MovieBestComment movieBestComment) {
		
		movieDao.deleteMovieBestComment(movieBestComment);
		
		if( movieDao.movieBestCountComment(movieBestComment) > 0 ) {
			return false;
		} else {
			return true;
		}
	}
	
	//없어도 댐
	@Override
	public List<MovieBestImg> imglist() {
		
		return movieDao.imglist();
	}
	
	@Override
	public List<MovieBestImg> viewImage(MovieBest viewMovieBest) {
		return movieDao.selectViewImageList(viewMovieBest);
	}

	@Override
	public boolean isMovieBestCommentLike(MovieBestCommentLike movieBestCommentLike) {
		int cnt = movieDao.selectCntMovieBestCommentLike(movieBestCommentLike);
		
		if(cnt > 0) {
			return true;
		} else {
			return false;
		}
		
	}

	@Override
	public boolean movieCommentlike(MovieBestCommentLike movieBestCommentLike) {
		if(isMovieBestCommentLike(movieBestCommentLike)) {
			movieDao.deleteMovieBestCommentLike(movieBestCommentLike);
			
			return false;
			
		} else {
			
			movieDao.insertMovieBestCommentLike(movieBestCommentLike);
			
			return true;
		}
	}

	@Override
	public int getTotalCntMovieBestCommentLike(MovieBestCommentLike movieBestCommentLike) {
		return movieDao.selectCntAllMovieBestCommentLike(movieBestCommentLike);
		
	}

	@Override
	public List<MovieBestCommentLike> getMovieBestCommentLikeList(int movieBestNo) {
		return movieDao.selectMovieBestCommentLike(movieBestNo);
	}
	
	@Override
	public List<MovieAward> getAwardList() {
		return movieDao.selectAwardList(); 
	}
	
	
	@Override
	public void AddMovieBestBookmark(BookMark bookmark) {
		
		
		movieDao.InsertMovieBestBookmark(bookmark);
		
	}

	@Override
	public void RemoveMovieBestBookmark(BookMark bookmark) {
		
		movieDao.DeleteMovieBestBookmark(bookmark);
		
	}

	@Override
	public boolean CheckMovieBestBookmark(BookMark bookmark) {
		
		int count = movieDao.CheckMovieBestBookmark(bookmark);
		
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public List<UserImg> viewUserImg(List<MovieBestComment> movieBestCommentList) {
		// TODO Auto-generated method stub
		
		List<UserImg> list = new ArrayList<>();
		
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@12312313123123123123123@@@@@ {}", movieBestCommentList);
		
		for(int i=0; i<movieBestCommentList.size(); i++) {
			list.add(movieDao.selectViewUserImageList(movieBestCommentList.get(i)));
		}
		
		return list;
		
	}

	
	
}
