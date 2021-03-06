package com.traffic.service;

import com.traffic.model.NewsAndNotice;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

/**
 * Created by ZhanHeng on 2016/11/11.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class NewsAndNoticeServiceImplTest {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private NewsAndNoticeService newsAndNoticeService;

    @Test
    public void findById() throws Exception {
        String id = "2131";
        NewsAndNotice newsAndNotice = newsAndNoticeService.findById(id);
        logger.info("Title = "+newsAndNotice.getTitle());
    }

    @Test
    public void addNews() throws Exception {
        NewsAndNotice news = new NewsAndNotice();
        news.setAuthor("公路管理局");
    /*    String content = "2016年11月4日，市交通局农村候车亭竣工验收小组对新宾县19处、清原县11处新建农村候车亭进行现场验收。验收组成员为：市局规划处潘俊辉处长";
        news.setContent(content.getBytes());*/
        news.setTitle("今日头条");
        newsAndNoticeService.save(news);
    }
}