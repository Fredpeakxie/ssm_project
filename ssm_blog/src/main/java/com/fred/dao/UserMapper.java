package com.fred.dao;

import com.fred.bean.User;

/**
 * @auther fred
 * @create 2020-08-26 11:19
 */
public interface UserMapper {

    int insertSelective(User user);

}
