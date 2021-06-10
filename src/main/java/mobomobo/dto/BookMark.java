package mobomobo.dto;

public class BookMark {

	private int bookmarkno;
	private int userno;
	private String category;
	private String key;
	private String title;
	private String image;
	
	private int rnum;

	@Override
	public String toString() {
		return "BookMark [bookmarkno=" + bookmarkno + ", userno=" + userno + ", category=" + category + ", key=" + key
				+ ", title=" + title + ", image=" + image + ", rnum=" + rnum + "]";
	}

	public int getBookmarkno() {
		return bookmarkno;
	}

	public void setBookmarkno(int bookmarkno) {
		this.bookmarkno = bookmarkno;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}




	
}
