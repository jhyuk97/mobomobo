package mobomobo.dto;

import java.util.Date;

public class ChatLog {
	private String msg;//채팅내용
	private String roomid;//채팅방 번호
	private String suid;//판매자 유저id
	private int lNo;//채팅내역 번호
	private String mTitle;//채팅방제목
	private String sendid;//메시지 보낸유저 id
	private String suNick;//보낸사람 닉네임
	private String buid;//구매희망유저 id
	private Date writeDate;

	@Override
	public String toString() {
		return "ChatLog [msg=" + msg + ", roomid=" + roomid + ", suid=" + suid + ", lNo=" + lNo + ", mTitle=" + mTitle
				+ ", sendid=" + sendid + ", suNick=" + suNick + ", buid=" + buid + ", writeDate=" + writeDate + "]";
	}
	
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getBuid() {
		return buid;
	}
	public void setBuid(String buid) {
		this.buid = buid;
	}

	public String getSuNick() {
		return suNick;
	}

	public void setSuNick(String suNick) {
		this.suNick = suNick;
	}

	public String getSendid() {
		return sendid;
	}

	public void setSendid(String sendid) {
		this.sendid = sendid;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getRoomid() {
		return roomid;
	}

	public void setRoomid(String roomid) {
		this.roomid = roomid;
	}

	public String getSuid() {
		return suid;
	}

	public void setSuid(String suid) {
		this.suid = suid;
	}

	public int getlNo() {
		return lNo;
	}

	public void setlNo(int lNo) {
		this.lNo = lNo;
	}

	public String getmTitle() {
		return mTitle;
	}

	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}
	
	
}
