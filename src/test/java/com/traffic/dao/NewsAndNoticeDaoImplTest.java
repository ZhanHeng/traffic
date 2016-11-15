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
        NewsAndNotice newsAndNotice = new NewsAndNotice();
        newsAndNotice.setTitle("新宾县、清原县农村便民候车亭顺利通过市交通局验收");
        newsAndNotice.setAuthor("市公路运输管理处");
        newsAndNotice.setTime("2016-11-09");
        newsAndNoticeDao.save(newsAndNotice);
    }

    @Test
    public void update() throws Exception {
        NewsAndNotice newsAndNotice = newsAndNoticeDao.findById("f64aaa7c5868fc28015868fc2cb40000");
        String content = " 2016年11月4日，市交通局农村候车亭竣工验收小组对新宾县19处、清原县11处新建农村候车亭进行现场验收。验收组成员为：市局规划处潘俊辉处长、财务处张玉飞、市运管处吕万民副处长、计统科张艳；新宾县交通局肇旭副局长、岳有新副局长、清原县白荣杰所长。\n" +
                "    经现场验收，两县交通局按照《施工设计图》全部完成候车亭的工程建设，该建设工程符合设计标准和安全停发车要求，可以交付使用。同时，要求相关单位做好候车亭交付使用后的维护管理工作。\n" +
                "    在两县公路沿线建设农村候车亭，投资少，利用价值高，利民便民，为沿途百姓乘降长途班车提供了极大的方便。";
        newsAndNotice.setContent(content.getBytes());
        newsAndNoticeDao.update(newsAndNotice);
    }

    @Test
    public void delete() throws Exception {

    }

}