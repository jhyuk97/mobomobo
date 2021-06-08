package mobomobo.dto;

public class MovieCrawler {
	
	private String title;
	private String summary;
	private String price;
	private String buyUrl;
	@Override
	public String toString() {
		return "MovieCrawler [title=" + title + ", summary=" + summary + ", price=" + price + ", buyUrl=" + buyUrl
				+ "]";
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getBuyUrl() {
		return buyUrl;
	}
	public void setBuyUrl(String buyUrl) {
		this.buyUrl = buyUrl;
	}
	
	

}
