package com.fred.controller;

import com.fred.bean.User;
import com.fred.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
