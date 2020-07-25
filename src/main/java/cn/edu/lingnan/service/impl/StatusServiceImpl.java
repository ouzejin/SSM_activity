package cn.edu.lingnan.service.impl;

import cn.edu.lingnan.mapper.StatusMapper;
import cn.edu.lingnan.pojo.ActStatus;
import cn.edu.lingnan.service.StatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StatusServiceImpl implements StatusService {
    @Autowired
    private StatusMapper statusMapper;

	public List<ActStatus> getList(String startaTime, String endaTime) {
		// TODO Auto-generated method stub
		return statusMapper.getList(startaTime, endaTime);
	}

	
	public List<ActStatus> getAll() {
		return statusMapper.getAll();
	}

	
	
	
	public int getActivityCount() {
		return statusMapper.getActivityCount();
	}

	
	public int getExamineConut() {
		return statusMapper.getExamineConut();
	}

	
	public int insertActStatus(String aTime, int aNum, int pNum, int uNum) {
		return statusMapper.insertActStatus(aTime, aNum, pNum, uNum);
	}

	
	public List<ActStatus> getAllAtime() {
		return statusMapper.getAllAtime();
	}

	
	public int updateNum(String aTime, int aNum, int uNum, int pNum) {
		return statusMapper.updateNum(aTime, aNum, uNum, pNum);
	}


	
	public int getTimeCount() {
		return statusMapper.getTimeCount();
	}


	public int getApplicantCount(String aSuper) {
		// TODO Auto-generated method stub
		return statusMapper.getApplicantCount(aSuper);
	}


}

