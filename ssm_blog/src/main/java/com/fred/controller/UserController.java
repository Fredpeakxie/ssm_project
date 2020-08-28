package com.fred.controller;

import com.fred.bean.User;
import com.fred.service.UserService;
import com.fred.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.applet.resources.MsgAppletViewer_fr;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        if(userService.checkUsername(username)){
            return Msg.success().setMsg("验证成功");
        }else {
            return Msg.fail().setMsg("用户名重复，请更换");
        }
    }

    /**
     * 用户注册表单的校验 jsr303
     * 通过校验后发起注册
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/register")
    public Msg userRegister(@Valid User user, BindingResult result){
        if(result.hasErrors()){
            FieldError error = result.getFieldError();
            return Msg.fail().setMsg("请停止提交非法表单,"+error.getDefaultMessage());
        }else {
            boolean register = userService.register(user);
            if(!register){
                return Msg.fail().setMsg("注册失败，很巧,用户名在注册时被抢用");
            }
            return Msg.success();
        }
    }
}
