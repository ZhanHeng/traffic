package com.traffic.model;

import java.util.Date;

/**
 * 新闻和标签 ，产生的中间实体
 * Created by ZhanHeng on 2016/11/12.
 */
public class NewsPublish {
    /**
     *  主键ID
     */
    private String newsId;
    /**
     * 关联的新闻实体
     */
    private NewsAndNotice newsAndNotice;
    /**
     * 关联的标签实体
     */
    private Tag tag;
    /**
     * 创建时间
     */
    private Date createTime ;

    public String getNewsId() {
        return newsId;
    }

    public void setNewsId(String newsId) {
        this.newsId = newsId;
    }

    public NewsAndNotice getNewsAndNotice() {
        return newsAndNotice;
    }

    public void setNewsAndNotice(NewsAndNotice newsAndNotice) {
        this.newsAndNotice = newsAndNotice;
    }

    public Tag getTag() {
        return tag;
    }

    public void setTag(Tag tag) {
        this.tag = tag;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
