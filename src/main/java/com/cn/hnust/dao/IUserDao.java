package com.cn.hnust.dao;

import com.cn.hnust.pojo.User;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public interface IUserDao {
    int insert(User record);

    int insertSelective(User record);
}