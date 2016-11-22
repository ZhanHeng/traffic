package com.traffic.model;

/**
 * 菜单的实体类
 * Created by ZhanHeng on 2016/11/12.
 */
public class Tag {
    /**
     * 主键ID，递增
     */
    private long tagId;
    /**
     * 菜单名称
     */
    private String tagName;
    /**
     * 菜单等级
     */
    private int tagLevel;

    /**
     * 父亲菜单 (用来表示 菜单之间的关联关系)
     */
    private Tag parentTag;

    /**
     * 菜单位置 0 初始 1上 2左下 3 右下
     */
    private int position;


    /**
     * 权重 排序用 0 初始 越大越靠左 靠上
     */
    private int weight;





    /**
     * 菜单是否可用，0:不可用 , 1:可用
     */
    private int passFlag;

    public Tag() {
        this.tagName="";
        this.tagLevel=1;
        this.passFlag=1;
        this.position=0;
        this.weight=0;
        this.parentTag = null;
    }

    public Tag(String tagName, int tagLevel, int passFlag ,int position,int weight) {
        this.tagName = tagName;
        this.tagLevel = tagLevel;
        this.passFlag = passFlag;
        this.position = position;
        this.weight = weight;
    }

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

    public Tag getParentTag() {
        return parentTag;
    }

    public void setParentTag(Tag parentTag) {
        this.parentTag = parentTag;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }
}
