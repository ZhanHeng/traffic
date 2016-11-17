package com.traffic.dto;

import com.traffic.model.NewsAndNotice;
import com.traffic.model.Tag;

import java.util.List;

/**
 * 新闻辅助显示类
 * Created by ZhanHeng on 2016/11/17.
 */
public class NewsUtil {

    private NewsAndNotice news;
    private List<Tag> tagList;

    public NewsAndNotice getNews() {
        return news;
    }

    public void setNews(NewsAndNotice news) {
        this.news = news;
    }

    public List<Tag> getTagList() {
        return tagList;
    }

    public void setTagList(List<Tag> tagList) {
        this.tagList = tagList;
    }

}
