package com.traffic.dao;

import com.traffic.model.NewsAndNotice;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * 新闻Dao的实现类
 * Created by ZhanHeng on 2016/11/11.
 */
@Repository
public class NewsAndNoticeDaoImpl extends HibernateDaoSupport implements NewsAndNoticeDao{

    @Resource
    private SessionFactory sessionFactory;

    @Autowired
    public void setMySessionFactory(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    private Session getCurrentSession() {
        return this.sessionFactory.openSession();
    }

    public NewsAndNotice findById(String id) {
        return (NewsAndNotice)getCurrentSession().get(NewsAndNotice.class,id);
    }

    public List<NewsAndNotice> findAll() {
        List<NewsAndNotice> list = getCurrentSession().createQuery("from NewsAndNotice").list();
        return list;
    }

    public Integer save(NewsAndNotice newsAndNotice) {
        return (Integer) getCurrentSession().save(newsAndNotice);
    }

    public void update(NewsAndNotice newsAndNotice) {
        getCurrentSession().saveOrUpdate(newsAndNotice);
    }

    public void delete(NewsAndNotice newsAndNotice) {
        getCurrentSession().delete(newsAndNotice);
    }
}
