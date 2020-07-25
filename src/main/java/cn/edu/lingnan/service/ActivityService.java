package cn.edu.lingnan.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.edu.lingnan.pojo.Activity;

public interface ActivityService {

    List<Activity> getAllActivity();
    int updateActivityByAno(Activity activity);
    Activity getByAno(int aNo);
    int deleteActivityByAno(Integer aNo);
    int insertActivity(Activity activity);
    List<Activity> searchActivity(@Param("aName")String aName,@Param("aTime")String aTime);
    List<Activity> queryList(Map map);
    int countNum();
}
