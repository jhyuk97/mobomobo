package mobomobo.dto;

import java.util.Date;
import java.util.List;

public class Market {
	private int mNo;
	private String mCate;
	private String mContent;
	private String mTitle;
	private int mPrice;
	private Date mDate;
	private int mViews;
	private String nick;
	private String id;
	private List<String> OriginImg;
	private List<String> StoredImg;

	
	@Override
	public String toString() {
		return "Market [mNo=" + mNo + ", mCate=" + mCate + ", mContent=" + mContent + ", mTitle=" + mTitle + ", mPrice="
				+ mPrice + ", mDate=" + mDate + ", mViews=" + mViews + ", nick=" + nick + ", id=" + id + ", OriginImg="
				+ OriginImg + ", StoredImg=" + StoredImg + "]";
	}
	public String getmTitle() {
		return mTitle;
	}
	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getmCate() {
		return mCate;
	}
	public void setmCate(String mCate) {
		this.mCate = mCate;
	}
	public String getmContent() {
		return mContent;
	}
	public void setmContent(String mContent) {
		this.mContent = mContent;
	}
	public int getmPrice() {
		return mPrice;
	}
	public void setmPrice(int mPrice) {
		this.mPrice = mPrice;
	}
	public Date getmDate() {
		return mDate;
	}
	public void setmDate(Date mDate) {
		this.mDate = mDate;
	}
	public int getmViews() {
		return mViews;
	}
	public void setmViews(int mViews) {
		this.mViews = mViews;
	}
	public List<String> getOriginImg() {
		return OriginImg;
	}
	public void setOriginImg(List<String> originImg) {
		OriginImg = originImg;
	}
	public List<String> getStoredImg() {
		return StoredImg;
	}
	public void setStoredImg(List<String> storedImg) {
		StoredImg = storedImg;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
