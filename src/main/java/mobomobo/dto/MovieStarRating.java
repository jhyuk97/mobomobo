package mobomobo.dto;

public class MovieStarRating {
	
	public String key;
	public int userno;
	public String age;
	public double starRating;
	public String title;
	public String image;
	@Override
	public String toString() {
		return "MovieStarRating [key=" + key + ", userno=" + userno + ", age=" + age + ", starRating=" + starRating
				+ ", title=" + title + ", image=" + image + "]";
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

}
