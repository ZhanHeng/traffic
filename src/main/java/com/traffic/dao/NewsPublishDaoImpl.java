package com.traffic.dao;

import com.traffic.model.NewsPublish;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ZhanHeng on 2016/11/12.
 */
@Repository
public class NewsPublishDaoImpl extends HibernateDaoSupport implements NewsPublishDao {
    @Resource
    private SessionFactory sessionFactory;

    @Autowired
    public void setMySessionFactory(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    private Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }


    public void save(NewsPublish newsPublish) {
        getCurrentSession().save(newsPublish);
    }

    public void update(NewsPublish newsPublish) {
        getCurrentSession().update(newsPublish);
    }

    public void delete(NewsPublish newsPublish) {
        getCurrentSession().delete(newsPublish);
    }

    public NewsPublish findById(String newsPublishId) {
        return (NewsPublish)getCurrentSession().get(NewsPublish.class,newsPublishId);
    }

}
