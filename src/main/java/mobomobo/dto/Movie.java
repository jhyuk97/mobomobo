package mobomobo.dto;

public class Movie {
	
	private String key;
	private String title;
	private String image;
	
	private String showTm;
	private String openDt;
	private String nationNm;
	private String genres;
	private String directors;
	private String actors;
	private String grades;
	@Override
	public String toString() {
		return "Mobo [key=" + key + ", title=" + title + ", image=" + image + ", showTm=" + showTm + ", openDt="
				+ openDt + ", nationNm=" + nationNm + ", genres=" + genres + ", directors=" + directors + ", actors="
				+ actors + ", grades=" + grades + "]";
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
	public String getShowTm() {
		return showTm;
	}
	public void setShowTm(String showTm) {
		this.showTm = showTm;
	}
	public String getOpenDt() {
		return openDt;
	}
	public void setOpenDt(String openDt) {
		this.openDt = openDt;
	}
	public String getNationNm() {
		return nationNm;
	}
	public void setNationNm(String nationNm) {
		this.nationNm = nationNm;
	}
	public String getGenres() {
		return genres;
	}
	public void setGenres(String genres) {
		this.genres = genres;
	}
	public String getDirectors() {
		return directors;
	}
	public void setDirectors(String directors) {
		this.directors = directors;
	}
	public String getActors() {
		return actors;
	}
	public void setActors(String actors) {
		this.actors = actors;
	}
	public String getGrades() {
		return grades;
	}
	public void setGrades(String grades) {
		this.grades = grades;
	}


}
