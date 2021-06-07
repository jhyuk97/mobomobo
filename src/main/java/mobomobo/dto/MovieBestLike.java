package mobomobo.dto;

public class MovieBestLike {
	
	private int movieBestNo;
	private String id;
	
	@Override
	public String toString() {
		return "MovieBestLike [movieBestNo=" + movieBestNo + ", id=" + id + "]";
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
