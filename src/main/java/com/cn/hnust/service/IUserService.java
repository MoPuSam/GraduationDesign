package com.cn.hnust.service;

import com.cn.hnust.pojo.User;
import org.springframework.stereotype.Service;


public interface IUserService {
	public User getUserById(int userId);
}
