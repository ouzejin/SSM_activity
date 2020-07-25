package cn.edu.lingnan.mapper;

import cn.edu.lingnan.pojo.Activity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Mapper
@Repository
public interface ActivityMapper {

    List<Activity> getAllActivity();
    int updateActivityByAno(Activity activity);
    Activity getByAno(int aNo);
    int deleteActivityByAno(Integer aNo);
    int insertActivity(Activity activity);
    List<Activity> searchActivity(@Param("aName")String aName,@Param("aTime")String aTime);
    List<Activity>queryList(Map map);
    int countNum();
}
