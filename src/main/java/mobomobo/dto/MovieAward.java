package mobomobo.dto;

public class MovieAward {
	
	private int movieNo;
	private String key;
	private String title;
	private String image;
	private String division;
	@Override
	public String toString() {
		return "MovieAward [movieNo=" + movieNo + ", key=" + key + ", title=" + title + ", image=" + image
				+ ", division=" + division + "]";
	}
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	
	

}
