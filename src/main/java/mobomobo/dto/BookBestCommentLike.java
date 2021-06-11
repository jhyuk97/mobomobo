package mobomobo.dto;

public class BookBestCommentLike {
	private int commentno;
	private int userno;
	@Override
	public String toString() {
		return "BookBestCommentLike [commentno=" + commentno + ", userno=" + userno + "]";
	}
	public int getCommentno() {
		return commentno;
	}
	public void setCommentno(int commentno) {
		this.commentno = commentno;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	
}
