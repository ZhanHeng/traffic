package com.traffic.enums;

/**
 * 用户状态枚举类，描述常量数据字典
 * Created by lenovo on 2016/11/11.
 */
public enum LoginEnum {
    LOGIN_SUCCESS(1,"登录成功"),
    INSERT_SUCCESS(0,"添加成功"),
    UPDATE_SUCCESS(2,"修改成功"),
    DELETE_SUCCESS(3,"删除成功"),
    LOGIN_ERROR(-1,"用户名/密码错误"),
    INNER_ERROR(-2,"系统异常"),
    REPEAT_NAME(-3,"该名称已被占用"),
    REPEAT_TAG(-4,"该标签已存在");
    private int state ;
    private String stateInfo ;

    LoginEnum(int state, String stateInfo) {
        this.state = state;
        this.stateInfo = stateInfo;
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

    public static LoginEnum stateOf(int index){
        for (LoginEnum state : values()){
            if (state.getState() == index ){
                return state ;
            }
        }
        return null;
    }
}
