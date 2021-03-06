package com.cn.hnust.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.cn.hnust.dao.IUserDao;
import com.cn.hnust.pojo.User;
import com.cn.hnust.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {
	@Resource
	private IUserDao userDao;
	public User getUserById(int userId) {
		// TODO Auto-generated method stub
		return this.userDao.selectByPrimaryKey(userId);
	}

	@Override
//	@Cacheable(value="selectAll")
	public List<User> selectAll() {
		 return	userDao.selectAll();
	}



	@Override
	//@Cacheable(value="selectLike")
	public List<User> selectLike(String p) {
		// TODO Auto-generated method stub
		return userDao.selectLike(p);
	}

	@Override
	public int delById(int id) {
		// TODO Auto-generated method stub
		return userDao.deleteByPrimaryKey(id);
	}	

}
