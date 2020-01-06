package cn.edu.lingnan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.lingnan.mapper.UserMapper;
import cn.edu.lingnan.pojo.User;
import cn.edu.lingnan.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
    private UserMapper userMapper;
	public User login(String sno, String password) {
		// TODO Auto-generated method stub
		return userMapper.login(sno,password);
	}

}
