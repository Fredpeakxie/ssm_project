package com.fred.bean;

import javax.validation.constraints.Pattern;

/**
 * @auther fred
 * @create 2020-08-26 11:17
 */
public class User {
    private Long userId;
    @Pattern(regexp = "^[a-zA-z0-9_-]{6,16}$",
            message = "用户名必须是6-16位英文和数组的组合")
    private String username;
    @Pattern(regexp = "^[a-zA-z0-9_-]{6,16}$",
            message = "密码必须是6-16位英文和数组的组合")
    private String password;

    @Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
            ,message = "邮箱格式不正确")
    private String email;

    public User() {
    }

    public User(String username, String password, String email) {
        this.username = username;
        this.password = password;
        this.email = email;
    }

    public User(Long userId, String username, String password, String email) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.email = email;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
