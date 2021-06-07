package mobomobo.dto;

import java.util.Date;

public class UserInfo {
	
	private int userno;
	private String id;
	private String pw;
	private String nick;
	private String name;
	private String email;
	private int postnum;
	private String addr;
	private String addrdetail;
	private Date joindate;
	private String age;
	private String grade;
	
	
	@Override
	public String toString() {
		return "UserInfo [userno=" + userno + ", id=" + id + ", userpw=" + pw + ", nick=" + nick + ", name="
				+ name + ", email=" + email + ", postnum=" + postnum + ", addr=" + addr + ", addrdetail=" + addrdetail
				+ ", joindate=" + joindate + ", age=" + age + ", grade=" + grade + "]";
	}


	public int getUserno() {
		return userno;
	}


	public void setUserno(int userno) {
		this.userno = userno;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getNick() {
		return nick;
	}


	public void setNick(String nick) {
		this.nick = nick;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getPostnum() {
		return postnum;
	}


	public void setPostnum(int postnum) {
		this.postnum = postnum;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public String getAddrdetail() {
		return addrdetail;
	}


	public void setAddrdetail(String addrdetail) {
		this.addrdetail = addrdetail;
	}


	public Date getJoindate() {
		return joindate;
	}


	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public String getGrade() {
		return grade;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}


	
	
	
	
	
	
	
}