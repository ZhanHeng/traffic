package com.traffic.enums;

/**
 * 数据状态
 * Created by lenovo on 2016/11/12.
 */
public enum DataEnum {
    DATA_ERROR(-1,"数据异常"),
    DATA_REWRITE(-2,"数据篡改");
    private int state ;
    private String stateInfo ;

    DataEnum(int state, String stateInfo) {
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

    public static DataEnum stateOf(int index){
        for (DataEnum state : values()){
            if (state.getState() == index ){
                return state ;
            }
        }
        return null;
    }
}
