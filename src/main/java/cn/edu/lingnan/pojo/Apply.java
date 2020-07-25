package cn.edu.lingnan.pojo;

public class Apply {
	private String sNo;
	private String sName;
	private String aName;
	private String aContent;
	private String aTime;
	private String aPlace;
	private String phone;
	private String applyTime;
	private String state;
	
	public Apply() {
		
	}

	public Apply(String sNo, String sName, String aName, String aContent, String aTime, String aPlace, String phone,
			String applyTime,String state) {
		this.sNo = sNo;
		this.sName = sName;
		this.aName = aName;
		this.aContent = aContent;
		this.aTime = aTime;
		this.aPlace = aPlace;
		this.phone = phone;
		this.applyTime = applyTime;
		this.state = state;
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

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public String getaTime() {
		return aTime;
	}

	public void setaTime(String aTime) {
		this.aTime = aTime;
	}

	public String getaPlace() {
		return aPlace;
	}

	public void setaPlace(String aPlace) {
		this.aPlace = aPlace;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(String applyTime) {
		this.applyTime = applyTime;
	}

	/**
	 * @return the state
	 */
	public String getState() {
		return state;
	}

	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Apply [sNo=" + sNo + ", sName=" + sName + ", aName=" + aName + ", aContent=" + aContent + ", aTime="
				+ aTime + ", aPlace=" + aPlace + ", phone=" + phone + ", applyTime=" + applyTime + ", state=" + state
				+ "]";
	}
	
	
}
