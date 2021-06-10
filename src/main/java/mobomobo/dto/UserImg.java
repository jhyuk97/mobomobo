package mobomobo.dto;

public class UserImg {
	
	private int userNo;
	private String originName;
	private String storedName;
	private int filesize;
	private String contentType;
	@Override
	public String toString() {
		return "UserImg [userNo=" + userNo + ", originName=" + originName + ", storedName=" + storedName + ", filesize="
				+ filesize + ", contentType=" + contentType + "]";
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
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
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	
	


	
	

}
