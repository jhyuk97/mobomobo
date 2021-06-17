package mobomobo.dao.face;

import java.util.List;

import mobomobo.dto.BookMark;
import mobomobo.dto.MovieAward;
import mobomobo.dto.MovieBest;
import mobomobo.dto.MovieBestComment;
import mobomobo.dto.MovieBestCommentLike;
import mobomobo.dto.MovieBestImg;
import mobomobo.dto.MovieBestLike;
import mobomobo.dto.MovieStarRating;
import mobomobo.dto.UserImg;
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
	
	
	/**
	 * 유저의 댓글 추천 조회
	 * @param movieBestLike
	 * @return
	 */
	public int selectCntMovieBestCommentLike(MovieBestCommentLike movieBestCommentLike);
	
	/**
	 * 댓글 추천 삽입
	 * @param movieBestLike
	 */
	public void insertMovieBestCommentLike(MovieBestCommentLike movieBestCommentLike);
	
	/**
	 * 댓글 추천 정보 지우기 
	 * @param movieBestLike
	 */
	public void deleteMovieBestCommentLike(MovieBestCommentLike movieBestCommentLike);
	
	/**
	 * 게시글 전체 추천 수 조회하기
	 * @param movieBestLike
	 * @return
	 */
	public int selectTotalCntMovieBestCommentLike(MovieBestLike movieBestLike);

	public List<MovieBestCommentLike> selectMovieBestCommentLike(int movieBestNo);
	
	public int selectCntAllMovieBestCommentLike(MovieBestCommentLike movieBestCommentLike);
	
	public List<MovieAward> selectAwardList();
	
	/**
	 * 명장면 게시판 북마크 넣기
	 * @param bookmark
	 */
	public void InsertMovieBestBookmark(BookMark bookmark);
	
	/**
	 * 명장면 게시판 북마크 삭제
	 * @param bookmark
	 */
	public void DeleteMovieBestBookmark(BookMark bookmark);

	/**
	 * 명장면 게시판 북마크 확인 
	 * @param bookmark
	 * @return
	 */
	public int CheckMovieBestBookmark(BookMark bookmark);

	
	/**
	 * 유저 이미지 보여주기
	 * @param viewUserImg
	 * @return
	 */
//	public List<UserImg> selectViewUserImageList(List<MovieBestComment> movieBestCommentList);
	public UserImg selectViewUserImageList(MovieBestComment movieBestComment);
	


}
