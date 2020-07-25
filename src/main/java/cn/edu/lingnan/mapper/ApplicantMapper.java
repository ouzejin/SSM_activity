package cn.edu.lingnan.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import cn.edu.lingnan.pojo.Applicant;


@Mapper
@Repository
public interface ApplicantMapper {
	List<Applicant> getAllApplicant();
	int deleteBySno(@Param("sNo") String sNo);
	Applicant getBySno(@Param("sNo") String sNo);
	int updateBySno(Applicant applicant);
	int insertApplicant(Applicant applicant);
	List<Applicant> searchApplicant(@Param("search") String search,@Param("searchType") String searchType);
	Applicant login(@Param("sNo") String sNo, @Param("password") String password);
	Applicant getByPhone(String phone);
	String getApplicantName(String sNo);
	String getApplicantSuper(String sNo);
	int updateUserInfo(@Param("sNo") String sNo, @Param("grade") String grade, @Param("cName") String cName, @Param("phone") String phone);
	Applicant findBySnoPhone(@Param("sNo") String sNo, @Param("phone") String phone);
	List<Applicant>queryList(Map map);
    int countNum();
}
