package com.traffic.dao;

import com.traffic.model.ParentCategory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * 一级菜单Dao的实现类
 * Created by ZhanHeng on 2016/11/12.
 */
@Repository
public class ParentCategoryDaoImpl extends HibernateDaoSupport implements ParentCategoryDao {
    @Resource
    private SessionFactory sessionFactory;

    @Autowired
    public void setMySessionFactory(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    private Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }
    public ParentCategory findById(String id) {
        return (ParentCategory)getCurrentSession().get(ParentCategory.class,id);
    }

    public List<ParentCategory> findAll() {
        return getCurrentSession().createQuery("from ParentCategory").list();
    }

    public void save(ParentCategory parentCategory) {
        getCurrentSession().save(parentCategory);
    }

    public void update(ParentCategory parentCategory) {
        getCurrentSession().update(parentCategory);
    }

    public void delete(ParentCategory parentCategory) {
        getCurrentSession().delete(parentCategory);
    }
}
