package mobomobo.service.face;

import java.io.IOException;
import java.util.List;

import org.json.simple.parser.ParseException;

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
import mobomobo.util.MovieBestPaging;

public interface MovieService {

	public List<Movie> getList(String search, int curpage) throws IOException, ParseException;

	public int getListCnt(String search) throws IOException, ParseException;

	public List<Movie> getMainList(String directorName) throws IOException, ParseException;

	public Movie getMovieInfo(Movie movie) throws IOException, ParseException;

	public void setStarRating(MovieStarRating movieStarRating);

	public double checkStarRating(MovieStarRating movieStarRating);
	
	/**
	 * 게시글 목록 위한 페이징 객체 생성 
	 * @param inData
	 * @return
	 */
	public MovieBestPaging getPaging(MovieBestPaging inData);
	
	/**
	 * 페이징 적용한 명장면 게시판 게시글 목록 조회 
	 * @param paging
	 * @return
	 */
	public List<MovieBest> list(MovieBestPaging paging);
	
	/**
	 * 명장면 게시판 리스트 목록 조회 
	 * @return
	 */
	public List<MovieBest> movielist();
	
	/**
	 * 명장면 게시판 상세페이지 조회
	 * @param viewMovieBest
	 * @return
	 */
	public MovieBest view(MovieBest viewMovieBest);
	
	/**
	 * 추천 상태 확인 
	 * @param movieBestLike
	 * @return
	 */
	public boolean isMovieBestLike(MovieBestLike movieBestLike);
	
	/**
	 * 확인 및 취소 
	 * @param movieBestLike
	 * @return
	 */
	public boolean movielike(MovieBestLike movieBestLike);
	
	/**
	 * 총 추천 수 
	 * @param movieBestLike
	 * @return
	 */
	public int getTotalCntMovieBestLike(MovieBestLike movieBestLike);
	
	/**
	 * 명장면 게시판 코멘트 작성 
	 * @param movieBestComment
	 */
	public void insertMovieBestComment(MovieBestComment movieBestComment);
	
	/**
	 * 명장면 게시판 댓글 리스트 보여주기 
	 * @param movieBest
	 * @return
	 */
	public List<MovieBestComment> getMovieBestCommentList(int movieBestNo);
	
	/**
	 * 명장면 게시판 댓글 삭제
	 * @param comment
	 * @return
	 */
	public boolean deleteComment(MovieBestComment movieBestComment);
	
	/**
	 * 명장면 게시판 썸네일 포스터 
	 * @return
	 */
	public List<MovieBestImg> imglist();

	public List<MovieBestImg> viewImage(MovieBest viewMovieBest);


	public List<Movie> adminMovieSearchList(String search) throws IOException, ParseException;

	public List<MovieStarRating> getStarAvg(String key);

	public boolean checkBookMark(BookMark bookmark);

	public boolean manageBookMark(BookMark bookmark);

	public List<MovieAward> getRecomList();

	public Movie getMovieSearchOne(String string) throws IOException, ParseException;

	public String getStarAvgOfSingle(String key);

	public List<MovieCrawler> getMovieCrawler(String title, String directors);
	
	
	/**
	 * 추천 상태 확인 
	 * @param movieBestLike
	 * @return
	 */
	public boolean isMovieBestCommentLike(MovieBestCommentLike movieBestCommentLike);
	
	/**
	 * 확인 및 취소 
	 * @param movieBestLike
	 * @return
	 */
	public boolean movieCommentlike(MovieBestCommentLike movieBestCommentLike);
	
	/**
	 * 총 추천 수 
	 * @param movieBestLike
	 * @return
	 */
	public int getTotalCntMovieBestCommentLike(MovieBestCommentLike movieBestCommentLike);
	
	
	
	/**
	 * 댓글 좋아요 리스트
	 * @param movieBestNo
	 * @return
	 */

	public List<MovieBestCommentLike> getMovieBestCommentLikeList(int movieBestNo);

	public List<MovieAward> getAwardList();
	
	
	
	/**
	 * 명장면 게시판 북마크 추가 
	 * @param bookmark
	 */
	public void AddMovieBestBookmark(BookMark bookmark);
	
	/**
	 * 명장면 게시판 북마크 제거
	 * @param bookmark
	 */
	public void RemoveMovieBestBookmark(BookMark bookmark);
	
	/**
	 * 명장면 게시판 북마크 확인
	 * @param bookmark
	 */
	public boolean CheckMovieBestBookmark(BookMark bookmark);

	/**
	 * 명장면 게시판 유저 이미지 
	 * @param movieBestCommentList
	 * @return
	 */
	public List<UserImg> viewUserImg(List<MovieBestComment> movieBestCommentList);

}
