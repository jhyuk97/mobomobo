package mobomobo.dto;

import java.util.Date;

public class DebateComment {

	private int dcNo;
	private int dNo;
	private int userno;
	private String dcContent;
	private Date dcDate;
	private int commentDiv;
	
	@Override
	public String toString() {
		return "DebateComment [dcNo=" + dcNo + ", dNo=" + dNo + ", userno=" + userno + ", dcContent=" + dcContent
				+ ", dcDate=" + dcDate + ", commentDiv=" + commentDiv + "]";
	}

	public int getDcNo() {
		return dcNo;
	}

	public void setDcNo(int dcNo) {
		this.dcNo = dcNo;
	}

	public int getdNo() {
		return dNo;
	}

	public void setdNo(int dNo) {
		this.dNo = dNo;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getDcContent() {
		return dcContent;
	}

	public void setDcContent(String dcContent) {
		this.dcContent = dcContent;
	}

	public Date getDcDate() {
		return dcDate;
	}

	public void setDcDate(Date dcDate) {
		this.dcDate = dcDate;
	}

	public int getCommentDiv() {
		return commentDiv;
	}

	public void setCommentDiv(int commentDiv) {
		this.commentDiv = commentDiv;
	}
    
	
}
