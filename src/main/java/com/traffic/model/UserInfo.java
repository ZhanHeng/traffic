package com.traffic.model;

/**
 * 用户实体类
 * Created by ZhanHeng on 2016/11/11.
 */
public class UserInfo {
    private long userId;
    private String userName;
    private String passWord;

    public UserInfo() {
    }

    public UserInfo(String userName, String passWord) {
        this.userName = userName;
        this.passWord = passWord;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
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
