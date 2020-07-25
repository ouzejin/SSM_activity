package cn.edu.lingnan.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.edu.lingnan.pojo.Examine;

public interface ExamineMapper {

	List<Examine> getAllExamine();

	int insertExamine(Examine examine);

	int insertResult(Examine examine);

	int deleteExamine(@Param("sNo") String sNo, @Param("applyTime") String applyTime);

	Examine findExamine(@Param("sNo") String sNo, @Param("applyTime") String applyTime);

	int intoActivity(Examine examine);

	List<Examine> searchExamine(@Param("search") String search,@Param("searchType") String searchType);

	List<Examine> getAllResult();
	
	List<Examine> searchResult(@Param("search") String search,@Param("searchType") String searchType);

	List<Examine> userGetMyActivity(@Param("sNo") String sNo,@Param("state") String state);
	
	List<Examine>queryList(Map map);
    
	int countNum();
	
	List<Examine> queryResultList(Map map);
    
	int countResultNum();
}
