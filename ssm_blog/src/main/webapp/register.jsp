<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/8/27
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <%--    引入JQuery--%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <%--    引入样式--%>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <title>Title</title>
</head>
<body>
    <div class="container" id="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-0">
                <h1>Mocker</h1>
            </div>
            <div class="col-md-4 col-md-offset-2">
                <h1>Register</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-2">
                <form id="registerForm">
                    <div class="form-group">
                        <label for="usernameInput">Username</label>
                        <div class="col-sm-10">
                            <input type="text" name="username" class="form-control" id="usernameInput" placeholder="username">
                            <span id="usernameCheck" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="emailInput">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="emailInput" placeholder="email">
                            <span id="emailCheck" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="passwordInput">Password</label>
                        <div class="col-sm-10">
                            <input type="password" name="password" class="form-control" id="passwordInput" placeholder="password">
                            <span id="passwordCheck" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="passwordRInput">Password Repeat</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="passwordRInput" placeholder="repeat password">
                            <span id="passwordRCheck" class="help-block"></span>
                        </div>
                    </div>
                    <button type="button" id="registerBtn" class="btn btn-register">注册</button>
                </form>
            </div>
        </div>
    </div>
<script type="text/javascript">
    $("#usernameInput").change(function () {
        var username = this.value;
        $.ajax({
            url:"${APP_PATH}/userCheck",
            data:"username="+username,
            type:"POST",
            success:function (result) {
                console.log(result);
                show_validate_msg("#usernameInput",result);
            }
        })
    });

    /**
     * 用于修改表单颜色，提示文字
     * @param ele
     * @param result
     */
    function show_validate_msg(ele,result) {
        //清空元素之前的样式
        $(ele).parent().removeClass("has-success has-error");
        if(result.code==100){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(result.msg);
        }else if(result.code == 200){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(result.msg);
        }
    }

    /**
     * 表单数据验证
     * @returns {boolean}
     */
    function validate_register_form(){

        //获取要校验的数据 使用正则表达式
        var username = $("#usernameInput").val();
        // var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        var regName = /^[a-zA-z0-9_-]{6,16}$/;
        var result = {
            code:100,
            msg:""
        };
        if(!regName.test(username)){
            // alert("用户名可以式6-16位英文或者数字的组合");
            result.msg = "用户名可以式6-16位英文或者数字的组合";
            result.code = 200;
            show_validate_msg("#usernameInput",result);
            return false;
        }else {
            result.code = 100;
            result.msg = "";
            show_validate_msg("#empName_add_input",result);
        }

        var password = $("#passwordInput").val();
        if(!regName.test(password)){
            result.msg = "密码可以式6-16位英文或者数字的组合";
            result.code = 200;
            show_validate_msg("#passwordInput",result);
            return false;
        }else {
            result.code = 100;
            result.msg = "";
            show_validate_msg("#passwordInput",result);
        }

        var passwordR = $("#passwordRInput").val();
        if(password === passwordR){
            result.code = 100;
            result.msg = "";
            show_validate_msg("#passwordRInput",result);
        }else {
            result.msg = "两次密码输入不一致";
            result.code = 200;
            show_validate_msg("#passwordRInput",result);
            return false;
        }

        var email = $("#emailInput").val();
        var regEmail = /^([a-zA-Z0-9_\.-]+)@([\da-zA-Z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            result.code=200;
            result.msg="邮箱格式不正确";
            show_validate_msg("#emailInput",result);
            return false;
        }else{
            result.code=100;
            result.msg="";
            show_validate_msg("#emailInput",result);
        }

        return true;
    }

    /**
     * 点击按钮执行表单检验
     * 检验正确后 表单提交
     */
    $("#registerBtn").click(function () {
        var resultCode;
        if(!validate_register_form()){
            return false;
        }
        //这部分代码与之前相同可以抽取成一个函数
        var username = this.value;
        $.ajax({
            url:"${APP_PATH}/userCheck",
            data:"username="+username,
            type:"POST",
            success:function (result) {
                show_validate_msg("#usernameInput",result);
                resultCode = result.code;
            }
        });


        if (resultCode==200){
            return false;
        }
        console.log($("#container form").serialize());
        //先发送ajax异步请求 根据结果进行跳转
        $.ajax({
            url:"${APP_PATH}/register",
            type:"POST",
            data:$("#container form").serialize(),
            success:function (result) {
                console.log(result);
            }
        });
        return false;
    })
</script>
</body>
</html>
