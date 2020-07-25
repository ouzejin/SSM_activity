package cn.edu.lingnan.mapper;

import cn.edu.lingnan.pojo.ActStatus;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Mapper
@Repository
public interface StatusMapper {

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
