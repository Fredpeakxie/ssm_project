package com.fred.service;

import com.fred.bean.User;
import com.fred.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @auther fred
 * @create 2020-08-26 13:40
 */
@Service
public class UserService {

    @Autowired
    UserMapper userMapper;

    public boolean register(User user){
        Long l = userMapper.selectUserByUsername(user.getUsername());
        if(l != 0){
            return false;
        }
        int i = userMapper.insertSelective(user);
        if(i != 0){
            return true;
        }else {
            return false;
        }
    }

    public List<User> getAllUser(){
        return userMapper.selectUser();
    }

    public boolean checkUsername(String username){
        Long l = userMapper.selectUserByUsername(username);
        if(l==0){
            return true;
        }else {
            return false;
        }
    }
}
