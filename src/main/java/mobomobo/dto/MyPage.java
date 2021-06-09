package mobomobo.dto;

import java.util.Date;

public class MyPage {
	
	private int rnum;
	private String title;
	private Date wdate;
	private int hit;
	private int boardDiv;
	@Override
	public String toString() {
		return "MyPage [rnum=" + rnum + ", title=" + title + ", wdate=" + wdate + ", hit=" + hit + ", boardDiv="
				+ boardDiv + "]";
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
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
