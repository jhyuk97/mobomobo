package mobomobo.dto;

public class BookBestLike {

	private int bookBestno;
	private int userno;
	@Override
	public String toString() {
		return "BookBestLike [bookBestno=" + bookBestno + ", userno=" + userno + "]";
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
	
	
	
}
