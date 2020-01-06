package cn.edu.lingnan.pojo;

public class User {
	
	private String aName;
	private String password;
	private String aSuper;
	private String sno;
	private String email;
	
	
	public User() {
		
	}


	public User(String aName, String password, String aSuper, String sno, String email) {
		super();
		this.aName = aName;
		this.password = password;
		this.aSuper = aSuper;
		this.sno = sno;
		this.email = email;
	}


	public String getaName() {
		return aName;
	}


	public void setaNme(String aName) {
		this.aName = aName;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getaSuper() {
		return aSuper;
	}


	public void setaSuper(String aSuper) {
		this.aSuper = aSuper;
	}


	public String getSno() {
		return sno;
	}


	public void setSno(String sno) {
		this.sno = sno;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	@Override
	public String toString() {
		return "ApplicationLogin [aName=" + aName + ", password=" + password + ", aSuper=" + aSuper + ", sno=" + sno
				+ ", email=" + email + "]";
	}
	
	
	
	

}
