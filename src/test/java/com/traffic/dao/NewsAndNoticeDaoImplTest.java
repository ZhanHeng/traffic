package com.traffic.dao;

import com.traffic.model.NewsAndNotice;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

/**
 * 新闻类测试
 * Created by ZhanHeng on 2016/11/11.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class NewsAndNoticeDaoImplTest {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private  NewsAndNoticeDao newsAndNoticeDao;

    @Test
    public void findById() throws Exception {

    }

    @Test
    public void findAll() throws Exception {
        List<NewsAndNotice> list = newsAndNoticeDao.findAll();
        for (NewsAndNotice news:list){
            logger.info(news.getId()+"  "+news.getTitle());
        }
    }

    @Test
    public void save() throws Exception {

    }

    @Test
    public void update() throws Exception {

    }

    @Test
    public void delete() throws Exception {

    }

}