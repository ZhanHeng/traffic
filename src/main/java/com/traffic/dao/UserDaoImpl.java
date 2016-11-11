package com.traffic.dao;

import com.traffic.model.UserInfo;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * UserDao实现类
 * Created by lenovo on 2016/11/11.
 */
@Repository
public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

    @Resource
    private SessionFactory sessionFactory;

    @Autowired
    public void setMySessionFactory(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    private Session getCurrentSession() {
        return this.sessionFactory.openSession();
    }

    public List<UserInfo> findAll() {
        return getCurrentSession().createQuery("from UserInfo").list();
    }

    public int add(UserInfo userInfo) {
        return (Integer) getCurrentSession().save(userInfo);
    }

    public void delete(UserInfo userInfo) {
        getCurrentSession().delete(userInfo);
    }

    public void update(UserInfo userInfo) {
        getCurrentSession().saveOrUpdate(userInfo);
    }

    public List<UserInfo> findByNameAndPassword(String name, String md5) {
        String hql = "from UserInfo user where userName = ?  and passWord = ? ";
        Query query = getCurrentSession().createQuery(hql) ;
        query.setString(0,name);
        query.setString(1,md5);
        return query.list();
    }
}
