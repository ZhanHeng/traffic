package com.traffic.model;

/**
 * 标签的实体类
 * Created by ZhanHeng on 2016/11/12.
 */
public class Tag {
    /**
     * 主键ID，递增
     */
    private long tagId;
    /**
     * 标签名称
     */
    private String tagName;
    /**
     * 标签等级
     */
    private int tagLevel;
    /**
     * 标签是否可用，0:不可用 , 1:可用
     */
    private int passFlag;

    public long getTagId() {
        return tagId;
    }

    public void setTagId(long tagId) {
        this.tagId = tagId;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public int getTagLevel() {
        return tagLevel;
    }

    public void setTagLevel(int tagLevel) {
        this.tagLevel = tagLevel;
    }

    public int getPassFlag() {
        return passFlag;
    }

    public void setPassFlag(int passFlag) {
        this.passFlag = passFlag;
    }
}
