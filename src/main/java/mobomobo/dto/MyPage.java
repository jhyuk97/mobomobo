package mobomobo.dto;

import java.util.Date;

public class MyPage {
	
	private int rnum;
	
	private int boardNo;
	private String title;
	private Date wdate;
	private int hit;
	private int boardDiv;
	
	private int commentNo;
	private String commentText;
	private int commentDiv;
	private int likeCnt;
	@Override
	public String toString() {
		return "MyPage [rnum=" + rnum + ", boardNo=" + boardNo + ", title=" + title + ", wdate=" + wdate + ", hit="
				+ hit + ", boardDiv=" + boardDiv + ", commentNo=" + commentNo + ", commentText=" + commentText
				+ ", commentDiv=" + commentDiv + ", likeCnt=" + likeCnt + "]";
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public int getCommentDiv() {
		return commentDiv;
	}
	public void setCommentDiv(int commentDiv) {
		this.commentDiv = commentDiv;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	



}
