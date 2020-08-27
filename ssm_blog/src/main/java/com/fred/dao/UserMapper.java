package com.fred.dao;

import com.fred.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @auther fred
 * @create 2020-08-26 11:19
 */
public interface UserMapper {

    int insertSelective(User user);

    User selectUserByPrimaryKey(Long userId);

    List<User> selectUser();

    Long selectUserByUsername(@Param("username") String username);

}
