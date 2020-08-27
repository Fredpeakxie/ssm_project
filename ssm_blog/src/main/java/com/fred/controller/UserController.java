package com.fred.controller;

import com.fred.bean.User;
import com.fred.service.UserService;
import com.fred.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @auther fred
 * @create 2020-08-26 15:02
 */
@Controller
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping("/users")
    public String getUsers(Model model){
        List<User> allUser = userService.getAllUser();
        System.out.println(allUser);
        model.addAttribute("allUser",allUser);
        return "success";
    }

    /**
     * 检验username是否重复
     * @param username
     * @return
     */
    @ResponseBody
    @RequestMapping("/userCheck")
    public Msg usernameCheck(@RequestParam("username") String username){
        System.out.println("userCheck" + username);
        if(userService.checkUsername(username)){
            return Msg.success().setMsg("验证成功");
        }else {
            return Msg.fail().setMsg("用户名重复，请更换");
        }
    }

    @ResponseBody
    @RequestMapping("/register")
    public Msg userRegister(User user){
        System.out.println("userRegister");
        return Msg.success();
    }
}
