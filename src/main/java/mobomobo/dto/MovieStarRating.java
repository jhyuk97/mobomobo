package mobomobo.dto;

public class MovieStarRating {
	
	private String key;
	private int userno;
	private String age;
	private double starRating;
	private String title;
	private String image;
	
	public double avg;

	@Override
	public String toString() {
		return "MovieStarRating [key=" + key + ", userno=" + userno + ", age=" + age + ", starRating=" + starRating
				+ ", title=" + title + ", image=" + image + ", avg=" + avg + "]";
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public double getStarRating() {
		return starRating;
	}

	public void setStarRating(double starRating) {
		this.starRating = starRating;
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

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	

}
