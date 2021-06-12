package mobomobo.dto;

import java.util.Date;

public class Debate {

	private int dNo;
	private String dTitle;
	private String dContent;
	private int userno;
	private String nick;
	private Date dDate;
	private int hit;
	private int boardDiv;
	
	@Override
	public String toString() {
		return "Debate [dNo=" + dNo + ", dTitle=" + dTitle + ", dContent=" + dContent + ", userno=" + userno + ", nick="
				+ nick + ", dDate=" + dDate + ", hit=" + hit + ", boardDiv=" + boardDiv + "]";
	}

	public int getdNo() {
		return dNo;
	}

	public void setdNo(int dNo) {
		this.dNo = dNo;
	}

	public String getdTitle() {
		return dTitle;
	}

	public void setdTitle(String dTitle) {
		this.dTitle = dTitle;
	}

	public String getdContent() {
		return dContent;
	}

	public void setdContent(String dContent) {
		this.dContent = dContent;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public Date getdDate() {
		return dDate;
	}

	public void setdDate(Date dDate) {
		this.dDate = dDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getBoardDiv() {
		return boardDiv;
	}

	public void setBoardDiv(int boardDiv) {
		this.boardDiv = boardDiv;
	}

	
}