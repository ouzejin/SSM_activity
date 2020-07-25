package cn.edu.lingnan.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.edu.lingnan.mapper.ApplicantMapper;
import cn.edu.lingnan.pojo.Applicant;
import cn.edu.lingnan.service.ApplicantService;

@Service
public class ApplicantServiceImpl implements ApplicantService{
	@Autowired
    private ApplicantMapper applicantMapper;
	public List<Applicant> getAllApplicant() {
		// TODO Auto-generated method stub
		return applicantMapper.getAllApplicant();
	}
	
	public int deleteBySno(String sNo) {
		// TODO Auto-generated method stub
		return applicantMapper.deleteBySno(sNo);
	}

	public Applicant getBySno(String sno) {
		// TODO Auto-generated method stub
		return applicantMapper.getBySno(sno);
	}

	public int updateBySno(Applicant applicant) {
		// TODO Auto-generated method stub
		return applicantMapper.updateBySno(applicant);
	}

	public int insertApplicant(Applicant applicant) {
		// TODO Auto-generated method stub
		return applicantMapper.insertApplicant(applicant);
	}

	public List<Applicant> searchApplicant(String search,String searchType) {
		// TODO Auto-generated method stub
		return applicantMapper.searchApplicant(search,searchType);
	}

	public Applicant login(String sno, String password) {
		// TODO Auto-generated method stub
		return applicantMapper.login(sno,password);
	}

	public Applicant getByPhone(String phone) {
		// TODO Auto-generated method stub
		return applicantMapper.getByPhone(phone);
	}

	public String getApplicantName(String sno) {
		// TODO Auto-generated method stub
		return applicantMapper.getApplicantName(sno);
	}

	public String getApplicantSuper(String sno) {
		// TODO Auto-generated method stub
		return applicantMapper.getApplicantSuper(sno);
	}

	public int updateUserInfo(String sNo, String grade, String cName, String phone) {
		// TODO Auto-generated method stub
		return applicantMapper.updateUserInfo(sNo,grade,cName,phone);
	}

	public Applicant findBySnoPhone(String sNo, String phone) {
		// TODO Auto-generated method stub
		return applicantMapper.findBySnoPhone(sNo,phone);
	}

	public List<Applicant> queryList(Map map) {
		// TODO Auto-generated method stub
		return applicantMapper.queryList(map);
	}

	public int countNum() {
		// TODO Auto-generated method stub
		return applicantMapper.countNum();
	}

}
