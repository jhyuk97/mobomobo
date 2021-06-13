package mobomobo.dto;

public class DebateHot {

	private int dhNo;
	private int dNo;
	private int userno;
	
	@Override
	public String toString() {
		return "DebateHot [dhNo=" + dhNo + ", dNo=" + dNo + ", userno=" + userno + "]";
	}

	public int getDhNo() {
		return dhNo;
	}

	public void setDhNo(int dhNo) {
		this.dhNo = dhNo;
	}

	public int getdNo() {
		return dNo;
	}

	public void setdNo(int dNo) {
		this.dNo = dNo;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}
	
	
}
