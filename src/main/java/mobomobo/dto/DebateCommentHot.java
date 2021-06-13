package mobomobo.dto;

public class DebateCommentHot {

	private int dchNo;
	private int dcNo;
	private int userno;
	
	@Override
	public String toString() {
		return "DebateCommentHot [dchNo=" + dchNo + ", dcNo=" + dcNo + ", userno=" + userno + "]";
	}

	public int getDchNo() {
		return dchNo;
	}

	public void setDchNo(int dchNo) {
		this.dchNo = dchNo;
	}

	public int getDcNo() {
		return dcNo;
	}

	public void setDcNo(int dcNo) {
		this.dcNo = dcNo;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}
	
	
}
