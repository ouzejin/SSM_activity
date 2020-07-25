package cn.edu.lingnan.service;

import java.util.List;
import java.util.Map;

import cn.edu.lingnan.pojo.Apply;

public interface ApplyService {
	//按学号查找申请的活动
	List<Apply> findMyApply(String sNo);
	//申请活动,插入到申请活动表里
	int applyActivity(Apply apply);
	//根据申请时间和学号查找申请的活动
	Apply findApply(String sNo,String applyTime);
	//修改申请活动的审核状态
	int changeState(String sNo,String applyTime, String state);
	List<Apply> queryList(Map map);
    int countNum();
}
