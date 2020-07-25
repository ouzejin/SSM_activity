package cn.edu.lingnan.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Activity {
	
	private Integer aNo;
	private String aName;
	private String aMan;
	private String aContent;
	private String aTime;
	private String aPlace;
	private String aState;
	private String aManPhone;


	public Activity() {
	}

	public Activity(Integer aNo, String aName, String aMan, String aContent, String aTime, String aPlace, String aState, String aManPhone) {
		this.aNo = aNo;
		this.aName = aName;
		this.aMan = aMan;
		this.aContent = aContent;
		this.aTime = aTime;
		this.aPlace = aPlace;
		this.aState = aState;
		this.aManPhone = aManPhone;
	}

	public Integer getaNo() {
		return aNo;
	}

	public void setaNo(Integer aNo) {
		this.aNo = aNo;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public String getaMan() {
		return aMan;
	}

	public void setaMan(String aMan) {
		this.aMan = aMan;
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

	public String getaState() {
		return aState;
	}

	public void setaState(String aState) {
		this.aState = aState;
	}

	public String getaManPhone() {
		return aManPhone;
	}

	public void setaManPhone(String aManPhone) {
		this.aManPhone = aManPhone;
	}

	@Override
	public String toString() {
		return "Activity{" +
				"aNo=" + aNo +
				", aName='" + aName + '\'' +
				", aMan='" + aMan + '\'' +
				", aContent='" + aContent + '\'' +
				", aTime='" + aTime + '\'' +
				", aPlace='" + aPlace + '\'' +
				", aState='" + aState + '\'' +
				", aManPhone='" + aManPhone + '\'' +
				'}';
	}
}
