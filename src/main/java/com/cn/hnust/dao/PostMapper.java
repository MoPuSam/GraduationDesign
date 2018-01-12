package com.cn.hnust.dao;

import com.cn.hnust.pojo.Post;

public interface PostMapper {
    int deleteByPrimaryKey(String pId);

    int insert(Post record);

    int insertSelective(Post record);

    Post selectByPrimaryKey(String pId);

    int updateByPrimaryKeySelective(Post record);

    int updateByPrimaryKey(Post record);
}