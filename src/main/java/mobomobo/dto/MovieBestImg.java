package mobomobo.dto;

public class MovieBestImg {
	
	private int imgNo;
	private int movieBestNo;
	private String originName;
	private String storedName;
	
	//join
	private String title;
	private String maincontent;
	
	
	@Override
	public String toString() {
		return "MovieBestImg [imgNo=" + imgNo + ", movieBestNo=" + movieBestNo + ", originName=" + originName
				+ ", storedName=" + storedName + ", title=" + title + ", maincontent=" + maincontent + "]";
	}


	public int getImgNo() {
		return imgNo;
	}


	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}


	public int getMovieBestNo() {
		return movieBestNo;
	}


	public void setMovieBestNo(int movieBestNo) {
		this.movieBestNo = movieBestNo;
	}


	public String getOriginName() {
		return originName;
	}


	public void setOriginName(String originName) {
		this.originName = originName;
	}


	public String getStoredName() {
		return storedName;
	}


	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getMaincontent() {
		return maincontent;
	}


	public void setMaincontent(String maincontent) {
		this.maincontent = maincontent;
	}
	
	
	
	

	
	
	
}
