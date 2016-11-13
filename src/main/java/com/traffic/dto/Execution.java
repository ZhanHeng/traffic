package com.traffic.dto;

import com.traffic.enums.LoginEnum;
import com.traffic.model.UserInfo;

/**
 * Created by lenovo on 2016/11/11.
 */
public class Execution {

    /**
     * 状态码
     */
    private int state;
    /**
     * 状态信息
     */
    private String stateInfo;

    private UserInfo userInfo;

    public Execution( LoginEnum loginEnum) {
        this.state = loginEnum.getState();
        this.stateInfo = loginEnum.getStateInfo();
    }

    public Execution(LoginEnum loginEnum, UserInfo userInfo) {
        this.state = loginEnum.getState();
        this.stateInfo = loginEnum.getStateInfo();
        this.userInfo = userInfo;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    public void setStateInfo(String stateInfo) {
        this.stateInfo = stateInfo;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }
}
