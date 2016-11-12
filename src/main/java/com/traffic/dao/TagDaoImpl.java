package com.traffic.dao;

import com.traffic.model.ParentCategory;
import com.traffic.model.Tag;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * 标签菜单Dao的实现类
 * Created by ZhanHeng on 2016/11/12.
 */
@Repository
public class TagDaoImpl extends HibernateDaoSupport implements TagDao {
    @Resource
    private SessionFactory sessionFactory;

    @Autowired
    public void setMySessionFactory(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    private Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }
    public Tag findById(String id) {
        return (Tag)getCurrentSession().get(Tag.class,id);
    }

    public List<Tag> findAll() {
        return getCurrentSession().createQuery("from ParentCategory").list();
    }

    public void save(Tag tag) {
        getCurrentSession().save(tag);
    }

    public void update(Tag tag) {
        getCurrentSession().update(tag);
    }

    public void delete(Tag tag) {
        getCurrentSession().delete(tag);
    }

    public List<Tag> findByLevel(int level) {
        String hql = "from Tag where passFlag = 1 and  tagLevel = ? ";
        Query query = getCurrentSession().createQuery(hql) ;
        query.setInteger(0,level);
        return query.list();
    }
}
