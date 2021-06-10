package mobomobo.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BookBestComment {

	private int commentno;
	private int bookBestno;
	private String id;
	private String nick;
	private String commentText;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
	private Date commentDate;
	private int commentDiv;
	@Override
	public String toString() {
		return "BookBestComment [commentno=" + commentno + ", bookBestno=" + bookBestno + ", id=" + id + ", nick="
				+ nick + ", commentText=" + commentText + ", commentDate=" + commentDate + ", commentDiv=" + commentDiv
				+ "]";
	}
	public int getCommentno() {
		return commentno;
	}
	public void setCommentno(int commentno) {
		this.commentno = commentno;
	}
	public int getBookBestno() {
		return bookBestno;
	}
	public void setBookBestno(int bookBestno) {
		this.bookBestno = bookBestno;
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
