package com.cn.hnust.service;

import java.util.List;

import com.cn.hnust.pojo.User;

public interface IUserService {
	public User getUserById(int userId);
	
    public List<User> selectAll();
    public List<User> selectLike(String p);
    public int delById(int id);
}
