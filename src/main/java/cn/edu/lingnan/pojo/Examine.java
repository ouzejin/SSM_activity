package cn.edu.lingnan.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Examine {
	private String sNo;
	private String sName;
	private String aName;
	private String aContent;
	private String aTime;
	private String aPlace;
	private String phone;
	private String checktime;
	private String checkman;
	private String state;
	private String applyTime;
	
	
	public Examine() {
		
	}

	public Examine(String sNo, String sName, String aName, String aContent, String aTime, String aPlace, String phone,
			String checktime, String checkman, String state,String applyTime) {
		this.sNo = sNo;
		this.sName = sName;
		this.aName = aName;
		this.aContent = aContent;
		this.aTime = aTime;
		this.aPlace = aPlace;
		this.phone = phone;
		this.checktime = checktime;
		this.checkman = checkman;
		this.state = state;
		this.setApplyTime(applyTime);
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

	public String getChecktime() {
		return checktime;
	}

	public void setChecktime(String checktime) {
		this.checktime = checktime;
	}

	public String getCheckman() {
		return checkman;
	}

	public void setCheckman(String checkman) {
		this.checkman = checkman;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Examine [sNo=" + sNo + ", sName=" + sName + ", aName=" + aName + ", aContent=" + aContent + ", aTime="
				+ aTime + ", aPlace=" + aPlace + ", phone=" + phone + ", checktime=" + checktime + ", checkman="
				+ checkman + ", state=" + state + ", applyTime=" + applyTime +"]";
	}



	/**
	 * @return the applyTime
	 */
	public String getApplyTime() {
		return applyTime;
	}



	/**
	 * @param applyTime the applyTime to set
	 */
	public void setApplyTime(String applyTime) {
		this.applyTime = applyTime;
	}

}
