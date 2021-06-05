package mobomobo.dao.face;

<<<<<<< HEAD
import java.util.HashMap;
import java.util.List;

import mobomobo.dto.BookMark;
import mobomobo.dto.Movie;
import mobomobo.dto.MovieAward;
=======
import java.util.List;

import mobomobo.dto.MovieBest;
import mobomobo.dto.MovieBestComment;
import mobomobo.dto.MovieBestImg;
import mobomobo.dto.MovieBestLike;
>>>>>>> 54400a93ce67bf5d683262cc404979a6200b543c
import mobomobo.dto.MovieStarRating;
import mobomobo.util.MovieBestPaging;

public interface MovieDao {

	public void deleteStarRating(MovieStarRating movieStarRating);

	public void insertStarRating(MovieStarRating movieStarRating);

	public double selectMovieStarRatingByUserno(MovieStarRating movieStarRating);

	public int existMovieStarRatingByUserNo(MovieStarRating movieStarRating);
	
	/**
	 * 명장면 게시판 전체 게시글 수 조회
	 * 
	 * @return 총 게시글 수 
	 */
	public int selectCntAll();
	
	/**
	 * 명장면 페이지 전체 조회 
	 * @param paging
	 * @return
	 */
	public List<MovieBest> selectPageList(MovieBestPaging paging);

	
	/**
	 * 게시글 목록 조회 
	 * @return
	 */
	public List<MovieBest> movielist();
	
	/**
	 * 명장면 게시판 상세보기 페이지
	 * @param viewMovieBest
	 * @return
	 */
	public MovieBest selectMovieByMovieBestNo(MovieBest viewMovieBest);
	
	/**
	 * 유저의 추천 조회
	 * @param movieBestLike
	 * @return
	 */
	public int selectCntMovieBestLike(MovieBestLike movieBestLike);
	
	/**
	 * 추천 삽입
	 * @param movieBestLike
	 */
	public void insertMovieBestLike(MovieBestLike movieBestLike);
	
	/**
	 * 추천 정보 지우기 
	 * @param movieBestLike
	 */
	public void deleteMovieBestLike(MovieBestLike movieBestLike);
	
	/**
	 * 게시글 전체 추천 수 조회하기
	 * @param movieBestLike
	 * @return
	 */
	public int selectTotalCntMovieBestLike(MovieBestLike movieBestLike);
	
	/**
	 * 명장면 게시판 댓글 목록 조회 
	 * @param movieBestComment
	 * @return
	 */
	public List<MovieBestComment> selectMovieBestComment(int movieBestNo);
	
	/**
	 * 명장면 게시판 댓글 작성 
	 * @param movieBestComment
	 */
	public void insertMovieBestComment(MovieBestComment movieBestComment);
	
	
	/**
	 * 명장면 게시판 댓글 삭제
	 * @param comment
	 */
	public void deleteMovieBestComment(MovieBestComment movieBestComment);
	
	/**
	 * 명장면 게시판 댓글 수 
	 * @param comment
	 * @return
	 */
	public int movieBestCountComment(MovieBestComment movieBestComment);
	
	/**
	 * 영화 명장면 썸네일 이미지 보여주기
	 * @return
	 */
	public List<MovieBestImg> imglist();

	public List<MovieBestImg> selectViewImageList(MovieBest viewMovieBest);

	public List<MovieStarRating> selectStarAvg(String key);

	public int selectBookMarkByUserNo(BookMark bookmark);

	public void deleteBookMark(BookMark bookmark);

	public void insertBookMark(BookMark bookmark);

	public List<MovieAward> selectRecomList();

	public String selectStarAvgOfSingle(String key);


}
