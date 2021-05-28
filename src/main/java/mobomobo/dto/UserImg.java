package mobomobo.dto;

public class UserImg {
	
	private int userNo;
	private String originName;
	private String stroedName;
	private int filesize;
	private String contentType;
	
	
	@Override
	public String toString() {
		return "UserImg [userNo=" + userNo + ", originName=" + originName + ", stroedName=" + stroedName + ", filesize="
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


	public String getStroedName() {
		return stroedName;
	}


	public void setStroedName(String stroedName) {
		this.stroedName = stroedName;
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
