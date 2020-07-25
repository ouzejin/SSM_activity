package cn.edu.lingnan.service;

import java.util.List;
import java.util.Map;

import cn.edu.lingnan.pojo.Examine;

public interface ExamineService {
	List<Examine> getAllExamine();
	int insertExamine(Examine examine);
	int insertResult(Examine examine);
	int deleteExamine(String sno,String applyTime);
	Examine findExamine(String sno,String applyTime);
	int intoActivity(Examine examine);
	List<Examine> searchExamine(String search,String searchType);
	List<Examine> getAllResult();
	List<Examine> userGetMyActivity(String sNo,String state);
	List<Examine> searchlResult(String search,String searchType);
	List<Examine>queryList(Map map);
    int countNum();
    List<Examine> queryResultList(Map map);    
	int countResultNum();
}
