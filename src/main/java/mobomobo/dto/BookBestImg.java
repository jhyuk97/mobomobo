package mobomobo.dto;

public class BookBestImg {

	private int fileno;
	private int bookBestno;
	private String originImg;
	private String storedImg;
	private int fileSize;
	private String contentType;
	@Override
	public String toString() {
		return "BookBestImg [fileno=" + fileno + ", bookBestno=" + bookBestno + ", originImg=" + originImg
				+ ", storedImg=" + storedImg + ", fileSize=" + fileSize + ", contentType=" + contentType + "]";
	}
	public int getFileno() {
		return fileno;
	}
	public void setFileno(int fileno) {
		this.fileno = fileno;
	}
	public int getBookBestno() {
		return bookBestno;
	}
	public void setBookBestno(int bookBestno) {
		this.bookBestno = bookBestno;
	}
	public String getOriginImg() {
		return originImg;
	}
	public void setOriginImg(String originImg) {
		this.originImg = originImg;
	}
	public String getStoredImg() {
		return storedImg;
	}
	public void setStoredImg(String storedImg) {
		this.storedImg = storedImg;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	
	
}
