package mobomobo.dto;

public class MovieBestCommentLike {	
	
	private int commentNo;
	private int movieBestNo;
	private String id;
	
	
	@Override
	public String toString() {
		return "MovieBestCommentLike [commentNo=" + commentNo + ", movieBestNo=" + movieBestNo + ", id=" + id + "]";
	}


	public int getCommentNo() {
		return commentNo;
	}


	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}


	public int getMovieBestNo() {
		return movieBestNo;
	}


	public void setMovieBestNo(int movieBestNo) {
		this.movieBestNo = movieBestNo;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}
	

	
	
	
	
	

}
