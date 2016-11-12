package com.traffic.model;

/**
 * 用户实体类
 * Created by ZhanHeng on 2016/11/11.
 */
public class UserInfo {
    private String userId;
    private String userName;
    private String passWord;

    public UserInfo() {
    }

    public UserInfo(String userName, String passWord) {
        this.userName = userName;
        this.passWord = passWord;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserId() {
        return userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "userId='" + userId + '\'' +
                ", userName='" + userName + '\'' +
                ", passWord='" + passWord + '\'' +
                '}';
    }
}
