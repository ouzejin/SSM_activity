package cn.edu.lingnan.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import cn.edu.lingnan.pojo.Apply;


@Mapper
@Repository
public interface ApplyMapper {

	List<Apply> findMyApply(@Param("sNo") String sNo);

	int applyActivity(Apply apply);

	Apply findApply(@Param("sNo") String sNo, @Param("applyTime") String applyTime);

	int changeState(@Param("sNo") String sNo,@Param("applyTime") String applyTime,@Param("state") String state);
	
	List<Apply>queryList(Map map);
	
    int countNum();
}
