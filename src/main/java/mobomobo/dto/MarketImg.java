package mobomobo.dto;

public class MarketImg {
	
	private int imgNo;
	private int mNo;
	private String OriginImg;
	private String StoredImg;
	private String contentType;
	private int filesize;
	
	@Override
	public String toString() {
		return "MarketImg [imgNo=" + imgNo + ", mNo=" + mNo + ", OriginImg=" + OriginImg + ", StoredImg=" + StoredImg
				+ ", contentType=" + contentType + ", filesize=" + filesize + "]";
	}
	public int getImgNo() {
		return imgNo;
	}
	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getOriginImg() {
		return OriginImg;
	}
	public void setOriginImg(String originImg) {
		OriginImg = originImg;
	}
	public String getStoredImg() {
		return StoredImg;
	}
	public void setStoredImg(String storedImg) {
		StoredImg = storedImg;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	
}
