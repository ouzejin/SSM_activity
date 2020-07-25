package cn.edu.lingnan.service;

import java.util.List;
import java.util.Map;

import cn.edu.lingnan.pojo.Applicant;

public interface ApplicantService {
	List<Applicant> getAllApplicant();
	int deleteBySno(String sno);
	Applicant getBySno(String sno);
	int updateBySno(Applicant applicant);
	int insertApplicant(Applicant applicant);
	List<Applicant> searchApplicant(String search,String searchType);
	
	//根据学号密码登录
	Applicant login(String sno,String password);
	//根据手机号获取Applicant
	Applicant getByPhone(String phone);
	//获取用户名
	String getApplicantName(String sno);
	//根据学号查找权限
	String getApplicantSuper(String sno);
	//根据学号修改用户信息
	int updateUserInfo(String sNo,String grade,String cName,String phone);
	//根据学号和电话查找用户
	Applicant findBySnoPhone(String sNo,String phone);
	
	List<Applicant>queryList(Map map);
    int countNum();
}
