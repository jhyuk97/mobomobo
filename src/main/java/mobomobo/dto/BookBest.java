package mobomobo.dto;

import java.util.Date;

public class BookBest {

	private int bookBestno;
	private int userno;
	private String bestTitle;
	private String bestContext;
	private String bookTitle;
	private String bookAuthor;
	private String publicationDate;
	private Date writeDate;
	private int views;
	private int boardDiv;
	@Override
	public String toString() {
		return "BookBest [bookBestno=" + bookBestno + ", userno=" + userno + ", bestTitle=" + bestTitle
				+ ", bestContext=" + bestContext + ", bookTitle=" + bookTitle + ", bookAuthor=" + bookAuthor
				+ ", publicationDate=" + publicationDate + ", writeDate=" + writeDate + ", views=" + views + ", boardDiv="
				+ boardDiv + "]";
	}
	public int getBookBestno() {
		return bookBestno;
	}
	public void setBookBestno(int bookBestno) {
		this.bookBestno = bookBestno;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getBestTitle() {
		return bestTitle;
	}
	public void setBestTitle(String bestTitle) {
		this.bestTitle = bestTitle;
	}
	public String getBestContext() {
		return bestContext;
	}
	public void setBestContext(String bestContext) {
		this.bestContext = bestContext;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public String getBookAuthor() {
		return bookAuthor;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}

	public String getPublicationDate() {
		return publicationDate;
	}
	public void setPublicationDate(String publicationDate) {
		this.publicationDate = publicationDate;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getBoardDiv() {
		return boardDiv;
	}
	public void setBoardDiv(int boardDiv) {
		this.boardDiv = boardDiv;
	}
	
	
	
	
	
}
