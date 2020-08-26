package com.fred.dao;

import com.fred.bean.User;

import java.util.List;

/**
 * @auther fred
 * @create 2020-08-26 11:19
 */
public interface UserMapper {

    int insertSelective(User user);

    User selectUserByPrimaryKey(Long userId);

    List<User> selectUser();

}
