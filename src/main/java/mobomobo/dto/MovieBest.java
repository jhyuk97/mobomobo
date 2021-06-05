package mobomobo.dto;

public class MovieBest {
	
	private int movieBestNo;
	private String title;
	private String maincontent;
	private String subtitle1;
	private String content1;
	private String subtitle2;
	private String content2;
	private String subtitle3;
	private String content3;
	
	//join
	private int imgNo;
	private String originName;
	private String storedName;
	
	
	@Override
	public String toString() {
		return "MovieBest [movieBestNo=" + movieBestNo + ", title=" + title + ", maincontent=" + maincontent
				+ ", subtitle1=" + subtitle1 + ", content1=" + content1 + ", subtitle2=" + subtitle2 + ", content2="
				+ content2 + ", subtitle3=" + subtitle3 + ", content3=" + content3 + ", imgNo=" + imgNo
				+ ", originName=" + originName + ", storedName=" + storedName + "]";
	}


	public int getMovieBestNo() {
		return movieBestNo;
	}


	public void setMovieBestNo(int movieBestNo) {
		this.movieBestNo = movieBestNo;
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


	public String getSubtitle1() {
		return subtitle1;
	}


	public void setSubtitle1(String subtitle1) {
		this.subtitle1 = subtitle1;
	}


	public String getContent1() {
		return content1;
	}


	public void setContent1(String content1) {
		this.content1 = content1;
	}


	public String getSubtitle2() {
		return subtitle2;
	}


	public void setSubtitle2(String subtitle2) {
		this.subtitle2 = subtitle2;
	}


	public String getContent2() {
		return content2;
	}


	public void setContent2(String content2) {
		this.content2 = content2;
	}


	public String getSubtitle3() {
		return subtitle3;
	}


	public void setSubtitle3(String subtitle3) {
		this.subtitle3 = subtitle3;
	}


	public String getContent3() {
		return content3;
	}


	public void setContent3(String content3) {
		this.content3 = content3;
	}


	public int getImgNo() {
		return imgNo;
	}


	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
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
	
	
	


}
