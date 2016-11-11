package com.traffic.model;

/**
 *  二级新闻实体类
 * Created by ZhanHeng on 2016/11/11.
 */
public class NewsAndNoticeCategory {

    private int categoryId;
    private String categoryName;
    private ParentCategory parentCategory;
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public ParentCategory getParentCategory() {
        return parentCategory;
    }

    public void setParentCategory(ParentCategory parentCategory) {
        this.parentCategory = parentCategory;
    }

    @Override
    public String toString() {
        return "NewsAndNoticeCategory{" +
                "categoryId=" + categoryId +
                ", categoryName='" + categoryName + '\'' +
                ", parentCategory=" + parentCategory +
                '}';
    }
}

