package cn.edu.lingnan.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.lingnan.mapper.ExamineMapper;
import cn.edu.lingnan.pojo.Examine;
import cn.edu.lingnan.service.ExamineService;

@Service
public class ExamineServiceImpl implements ExamineService {
	@Autowired
    private ExamineMapper examineMapper;
	
	public List<Examine> getAllExamine() {
		// TODO Auto-generated method stub
		return examineMapper.getAllExamine();
	}

	public int insertExamine(Examine examine) {
		// TODO Auto-generated method stub
		return examineMapper.insertExamine(examine);
	}

	public int insertResult(Examine examine) {
		// TODO Auto-generated method stub
		return examineMapper.insertResult(examine);
	}

	public int deleteExamine(String sno, String applyTime) {
		// TODO Auto-generated method stub
		return examineMapper.deleteExamine(sno,applyTime);
	}

	public Examine findExamine(String sno, String applyTime) {
		// TODO Auto-generated method stub
		return examineMapper.findExamine(sno,applyTime);
	}

	public int intoActivity(Examine examine) {
		// TODO Auto-generated method stub
		return examineMapper.intoActivity(examine);
	}

	public List<Examine> searchExamine(String search, String searchType) {
		// TODO Auto-generated method stub
		return examineMapper.searchExamine(search,searchType);
	}

	public List<Examine> getAllResult() {
		// TODO Auto-generated method stub
		return examineMapper.getAllResult();
	}

	public List<Examine> searchlResult(String search, String searchType) {
		// TODO Auto-generated method stub
		return examineMapper.searchResult(search,searchType);
	}

	public List<Examine> userGetMyActivity(String sNo,String state) {
		// TODO Auto-generated method stub
		return examineMapper.userGetMyActivity(sNo,state);
	}

	public List<Examine> queryList(Map map) {
		// TODO Auto-generated method stub
		return examineMapper.queryList(map);
	}

	public int countNum() {
		// TODO Auto-generated method stub
		return examineMapper.countNum();
	}

	public List<Examine> queryResultList(Map map) {
		// TODO Auto-generated method stub
		return examineMapper.queryResultList(map);
	}

	public int countResultNum() {
		// TODO Auto-generated method stub
		return examineMapper.countResultNum();
	}
	
}
