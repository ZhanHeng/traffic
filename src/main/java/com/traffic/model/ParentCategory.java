package com.traffic.model;

/**
 * 一级新闻实体类
 * Created by ZhanHeng on 2016/11/11.
 */
public class ParentCategory {
    private int parentCategoryId;
    private String parentCategoryName;

    public int getParentCategoryId() {
        return parentCategoryId;
    }
    public void setParentCategoryId(int parentCategoryId) {
        this.parentCategoryId = parentCategoryId;
    }
    public String getParentCategoryName() {
        return parentCategoryName;
    }
    public void setParentCategoryName(String parentCategoryName) {
        this.parentCategoryName = parentCategoryName;
    }

    @Override
    public String toString() {
        return "ParentCategory{" +
                "parentCategoryId=" + parentCategoryId +
                ", parentCategoryName='" + parentCategoryName + '\'' +
                '}';
    }
}

