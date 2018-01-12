package com.cn.hnust.dao;

import com.cn.hnust.pojo.Post;
import org.springframework.stereotype.Repository;

@Repository("postDao")
public interface IPostDao {
    int deleteByPrimaryKey(String pId);

    int insert(Post record);

    int insertSelective(Post record);

    Post selectByPrimaryKey(String pId);

    int updateByPrimaryKeySelective(Post record);

    int updateByPrimaryKey(Post record);
}