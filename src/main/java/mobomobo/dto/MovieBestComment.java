package mobomobo.dto;

import java.sql.Date;

public class MovieBestComment {
	
	private int commentNo;
	private int movieBestNo;
	private String id;
	private String nick;
	private String commentText;
	private Date commentDate;
	private int commentDiv;
	
	
	@Override
	public String toString() {
		return "MovieBestComment [commentNo=" + commentNo + ", movieBestNo=" + movieBestNo + ", id=" + id + ", nick="
				+ nick + ", commentText=" + commentText + ", commentDate=" + commentDate + ", commentDiv=" + commentDiv
				+ "]";
	}


	public int getCommentNo() {
		return commentNo;
	}


	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}


	public int getMovieBestNo() {
		return movieBestNo;
	}


	public void setMovieBestNo(int movieBestNo) {
		this.movieBestNo = movieBestNo;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getNick() {
		return nick;
	}


	public void setNick(String nick) {
		this.nick = nick;
	}


	public String getCommentText() {
		return commentText;
	}


	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}


	public Date getCommentDate() {
		return commentDate;
	}


	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}


	public int getCommentDiv() {
		return commentDiv;
	}


	public void setCommentDiv(int commentDiv) {
		this.commentDiv = commentDiv;
	}
	
	
	
	
	
	

}
