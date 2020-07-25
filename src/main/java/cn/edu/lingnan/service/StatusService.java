package cn.edu.lingnan.service;

import cn.edu.lingnan.pojo.ActStatus;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StatusService {

    List<ActStatus> getList(@Param("startaTime") String startaTime, @Param("endaTime") String endaTime);
    List<ActStatus> getAll();
    int getApplicantCount(String aSuper);
    int getActivityCount();
    int getExamineConut();
    int insertActStatus(@Param("aTime")String aTime ,@Param("aNum")int aNum,@Param("pNum")int pNum,@Param("uNum")int uNum);
    List<ActStatus> getAllAtime();
    int updateNum(@Param("aTime")String aTime,@Param("aNum")int aNum,@Param("uNum")int uNum,@Param("pNum")int pNum);
    int getTimeCount();
}
