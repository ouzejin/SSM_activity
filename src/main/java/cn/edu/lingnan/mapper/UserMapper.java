package cn.edu.lingnan.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import cn.edu.lingnan.pojo.User;

@Mapper
@Repository
public interface UserMapper {
	User login(@Param("sno") String sno, @Param("password") String password);
}
