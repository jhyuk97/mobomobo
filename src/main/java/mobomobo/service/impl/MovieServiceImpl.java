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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mobomobo.dao.face.MovieDao;
import mobomobo.dto.Movie;
import mobomobo.dto.MovieStarRating;
import mobomobo.service.face.MovieService;

@Service
public class MovieServiceImpl implements MovieService{
	
	@Autowired
	MovieDao movieDao;
	
	//영화진흥위원회 서비스키
	private String serviceKey = "e4d9b0090b2fe76c700e81e3ffd96704";
	
	@Override
	public List<Movie> getMainList(String directorName) throws IOException, ParseException {
		
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

        	movie = getMovieImage(movie);
        	
        	list.add(movie);
        	
        }
		
		return list;
	
	}
	
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
        movie.setOpenDt((String)parseMovieInfo.get("openDt"));
        
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
        for(int i=0; i<actor.size(); i++) {
        	movieInfo = (JSONObject) actor.get(i);
        	
        	if(i == actor.size()-1) {
        		actors += movieInfo.get("peopleNm");
        	} else {
        		actors += movieInfo.get("peopleNm") + ", ";
        	}
        }
        movie.setActors(actors);
        
        for(int i=0; i<audit.size(); i++) {
        	movieInfo = (JSONObject) audit.get(i);
        	
        	movie.setGrades((String)movieInfo.get("watchGradeNm"));
        }
		
		return movie;
	}

	@Override
	public void setStarRating(MovieStarRating movieStarRating) {
		
		movieDao.deleteStarRating(movieStarRating);

		movieDao.insertStarRating(movieStarRating);
		
	}
	
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
	
}
