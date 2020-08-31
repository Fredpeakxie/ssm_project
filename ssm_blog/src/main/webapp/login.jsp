<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/8/27
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
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
            <h1>Login</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-2">
            <form id="loginForm">
                <div class="form-group">
                    <label for="usernameInput">Username</label>
                    <div class="col-md-12">
                        <input type="text" name="username" class="form-control" id="usernameInput" placeholder="username">
                        <span id="usernameCheck" class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="passwordInput">Password</label>
                    <div class="col-md-12">
                        <input type="password" name="password" class="form-control" id="passwordInput" placeholder="password">
                        <span id="passwordCheck" class="help-block"></span>
                    </div>
                </div>
                <button type="button" id="loginBtn" class="btn btn-login">登录</button>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">

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

    function validate_login_form(){
        var result = {
            code:100,
            msg:""
        };
        var username = $("#usernameInput").val();
        if(username === ""){
            result.msg = "用户名为空";
            result.code = 200;
            show_validate_msg("#usernameInput",result);
            return false;
        }else {
            result.code = 100;
            result.msg = "";
            show_validate_msg("#usernameInput",result);
        }

        var password = $("#passwordInput").val();
        if(password === ""){
            result.msg = "密码为空";
            result.code = 200;
            show_validate_msg("#passwordInput",result);
            return false;
        }else {
            result.code = 100;
            result.msg = "";
            show_validate_msg("#passwordInput",result);
        }

        return true;
    }


    $("#loginBtn").click(function () {
        var resultCode;
        if(!validate_login_form()){
            return false;
        }
        //先发送ajax异步请求 根据结果进行跳转
        $.ajax({
            url:"${APP_PATH}/login",
            type:"POST",
            data:$("#container form").serialize(),
            success:function (result) {
                console.log(result);
                resultCode = result.code;
                if(result.code==200){
                    alert(result.msg);
                }else {
                    window.location.href="${APP_PATH}/index.jsp";
                }
            }
        });


    })
</script>
</body>
</html>
