package cn.edu.lingnan.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class ActStatus {
    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date aTime;
    private Integer aNum;
    private Integer uNum;
    private Integer pNum;

    public ActStatus() {
    }

    public ActStatus(Date aTime, Integer aNum, Integer uNum, Integer pNum) {
        this.aTime = aTime;
        this.aNum = aNum;
        this.uNum = uNum;
        this.pNum = pNum;
    }

    public Date getaTime() {
        return aTime;
    }

    public void setaTime(Date aTime) {
        this.aTime = aTime;
    }

    public Integer getaNum() {
        return aNum;
    }

    public void setaNum(Integer aNum) {
        this.aNum = aNum;
    }

    public Integer getuNum() {
        return uNum;
    }

    public void setuNum(Integer uNum) {
        this.uNum = uNum;
    }

    public Integer getpNum() {
        return pNum;
    }

    public void setpNum(Integer pNum) {
        this.pNum = pNum;
    }

    @Override
    public String toString() {
        return "ActStatus{" +
                "aTime=" + aTime +
                ", aNum=" + aNum +
                ", uNum=" + uNum +
                ", pNum=" + pNum +
                '}';
    }
}
