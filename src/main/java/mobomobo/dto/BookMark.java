package mobomobo.dto;

public class BookMark {

	private int userno;
	private String category;
	private String key;
	private String bookMarkState;
	@Override
	public String toString() {
		return "BookMark [userno=" + userno + ", category=" + category + ", key=" + key + ", bookMarkState="
				+ bookMarkState + "]";
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
	public String getBookMarkState() {
		return bookMarkState;
	}
	public void setBookMarkState(String bookMarkState) {
		this.bookMarkState = bookMarkState;
	}
	
	
}
