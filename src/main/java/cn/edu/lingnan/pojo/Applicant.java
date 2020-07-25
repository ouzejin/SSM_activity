package cn.edu.lingnan.pojo;

public class Applicant {
	private String sNo;
	private String sName;
	private String grade;
	private String cName;
	private String phone;
	private String password;
	private String aSuper;
	public Applicant() {
		
	}
	
	public Applicant(String sNo, String sName, String grade, String cName, String phone, String password,
			String aSuper) {
		this.sNo = sNo;
		this.sName = sName;
		this.grade = grade;
		this.cName = cName;
		this.phone = phone;
		this.password = password;
		this.aSuper = aSuper;
	}

	public String getsNo() {
		return sNo;
	}

	public void setsNo(String sNo) {
		this.sNo = sNo;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	@Override
	public String toString() {
		return "Applicant [sNo=" + sNo + ", sName=" + sName + ", grade=" + grade + ", cName=" + cName + ", phone="
				+ phone + ", password=" + password + ", aSuper=" + aSuper + "]";
	}
	
	
}
