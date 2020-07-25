package cn.edu.lingnan.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.lingnan.mapper.ApplyMapper;
import cn.edu.lingnan.pojo.Apply;
import cn.edu.lingnan.service.ApplyService;

@Service
public class ApplyServiceImpl implements ApplyService {
	
	@Autowired
	private ApplyMapper applyMapper; 
	
	public List<Apply> findMyApply(String sNo) {
		// TODO Auto-generated method stub
		return applyMapper.findMyApply(sNo);
	}

	public int applyActivity(Apply apply) {
		// TODO Auto-generated method stub
		return applyMapper.applyActivity(apply);
	}

	public Apply findApply(String sNo, String applyTime) {
		// TODO Auto-generated method stub
		return applyMapper.findApply(sNo,applyTime);
	}

	public int changeState(String sNo,String applyTime,String state) {
		// TODO Auto-generated method stub
		return applyMapper.changeState(sNo,applyTime,state);
	}

	public List<Apply> queryList(Map map) {
		// TODO Auto-generated method stub
		return applyMapper.queryList(map);
	}

	public int countNum() {
		// TODO Auto-generated method stub
		return applyMapper.countNum();
	}

}
