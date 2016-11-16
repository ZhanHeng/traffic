package com.traffic.model;

import java.sql.Blob;
import java.util.Arrays;

/**
 * 新闻实体类
 * Created by ZhanHeng on 2016/11/11.
 */
public class NewsAndNotice {
    private String id;						// 主键
    private String title;					// 标题
    private byte[] content; 			    // 内容,在数据库中以blob的格式存储
    private String time;					// 发布时间
    private String author;					// 作者
    private String path;					// 焦点图的图片存储路径
    private String tagPath;                 // 标签的存储路径
    private String focusFlag;				// 是否是焦点图新闻的标志位
    private String htmlPath;				// 静态Html页的存储地址
    private String orderTime;				// 系统排序时间


    public NewsAndNotice() {
    }

    public NewsAndNotice(String id, String title, byte[] content, String time, String author, String path, String tagPath, String focusFlag, String htmlPath, String orderTime) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.time = time;
        this.author = author;
        this.path = path;
        this.tagPath = tagPath;
        this.focusFlag = focusFlag;
        this.htmlPath = htmlPath;
        this.orderTime = orderTime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public byte[] getContent() {
        return content;
    }

    public void setContent(byte[] content) {
        this.content = content;
    }

    public String getContentStr() {
        return new String(getContent());
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getFocusFlag() {
        return focusFlag;
    }

    public void setFocusFlag(String focusFlag) {
        this.focusFlag = focusFlag;
    }

    public String getHtmlPath() {
        return htmlPath;
    }

    public void setHtmlPath(String htmlPath) {
        this.htmlPath = htmlPath;
    }

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    public String getTagPath() {
        return tagPath;
    }

    public void setTagPath(String tagPath) {
        this.tagPath = tagPath;
    }
}
