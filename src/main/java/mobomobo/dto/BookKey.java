package mobomobo.dto;

public class BookKey {

	private String isbn;
	private String bookTitle;
	private String award;
	@Override
	public String toString() {
		return "BookKey [isbn=" + isbn + ", bookTitle=" + bookTitle + ", award=" + award + "]";
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public String getAward() {
		return award;
	}
	public void setAward(String award) {
		this.award = award;
	}
	
}
