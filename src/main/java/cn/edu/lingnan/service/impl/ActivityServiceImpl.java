package cn.edu.lingnan.service.impl;

import cn.edu.lingnan.mapper.ActivityMapper;
import cn.edu.lingnan.pojo.Activity;
import cn.edu.lingnan.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class ActivityServiceImpl implements ActivityService {

    @Autowired
    private ActivityMapper activityMapper;

    public List<Activity> getAllActivity() {
        return activityMapper.getAllActivity();
    }

    public int deleteActivityByAno(Integer aNo) {
        return activityMapper.deleteActivityByAno(aNo);
    }

    public int insertActivity(Activity activity) {
        return activityMapper.insertActivity(activity);
    }

    public List<Activity> searchActivity(String aName, String aTime) {
        return activityMapper.searchActivity(aName,aTime);
    }

    public int updateActivityByAno(Activity activity) {
        return activityMapper.updateActivityByAno(activity);
    }


    public Activity getByAno(int aNo) {
        return activityMapper.getByAno(aNo);
    }

	public List<Activity> queryList(Map map) {
		// TODO Auto-generated method stub
		return activityMapper.queryList(map);
	}

	public int countNum() {
		// TODO Auto-generated method stub
		return activityMapper.countNum();
	}
}
