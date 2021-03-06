package com.fred.test;

import com.fred.bean.User;
import com.fred.dao.UserMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @auther fred
 * @create 2020-08-26 13:41
 */
@RunWith(value = SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    UserMapper userMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void testUserMapper(){
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//        System.out.println(mapper);
//        mapper.insertSelective(new User("谢宇峰","QweAsdZxc123","347667675@qq.com"));
//        User user = mapper.selectUserByPrimaryKey(2L);
        List<User> users = mapper.selectUser();

        System.out.println(mapper.selectUserByUsername("谢宇峰"));

//        User user = mapper.selectUserByPrimaryKey(1L);
//        System.out.println(user);
//        System.out.println(users);
    }
}
