package com.traffic.dao;

import com.traffic.model.NewsAndNotice;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 新闻Dao的实现类
 * Created by ZhanHeng on 2016/11/11.
 */
@Repository
@Transactional
public class NewsAndNoticeDaoImpl extends HibernateDaoSupport implements NewsAndNoticeDao{

    @Resource
    private SessionFactory sessionFactory;

    @Autowired
    public void setMySessionFactory(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    private Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }
    //查单个新闻
    public NewsAndNotice findById(String id) {
        return (NewsAndNotice)getCurrentSession().get(NewsAndNotice.class,id);
    }
    //查出所有新闻
    public List<NewsAndNotice> findAll() {
        List<NewsAndNotice> list = getCurrentSession().createQuery("from NewsAndNotice order by time desc").list();
        return list;
    }
    public List<NewsAndNotice> findNewsByTag(String tagPath){
        List<NewsAndNotice> list = getCurrentSession().createQuery("from NewsAndNotice  where tagPath ='"+tagPath+"' order by time desc").list();
        return list;
    }

    public void save(NewsAndNotice newsAndNotice) {
//        newsAndNotice.setBlob(Hibernate.getLobCreator(getCurrentSession()).createBlob(newsAndNotice.getContent()));
        getCurrentSession().clear();
        getCurrentSession().save(newsAndNotice);
    }

    public void update(NewsAndNotice newsAndNotice) {
        getCurrentSession().clear();
        getCurrentSession().update(newsAndNotice);
    }

    public void delete(NewsAndNotice newsAndNotice) {
        getCurrentSession().delete(newsAndNotice);
    }

    //查出所有焦点图的新闻
    public List<NewsAndNotice> showFocusPicture(){
        String hql = "from NewsAndNotice as e where e.focusFlag='YES'order by time desc ";
        return getCurrentSession().createQuery(hql).list();
    }
    //获取焦点图的数量
    public int getCountNumber() {
        return getCurrentSession().createQuery("from NewsAndNotice as e where e.focusFlag ='YES' ").list().size();
    }

    //批量删除新闻
    public void bacthDeleteNewsAndNotice(List<String> newsList){
        if(newsList!=null){
            // 封装参数
            Object[] paramlist = new Object[newsList.size()];
            for (int i = 0; i < newsList.size(); i++) {
                paramlist[i] = newsList.get(i);
            }
            // 拼装sql语句
            String sql = "delete from NewsAndNotice as n where n.id IN (:userIdList)";
            // 执行sql语句
            getCurrentSession().clear();
            Query query = getCurrentSession().createQuery(sql);
            //设置参数
            query.setParameterList("userIdList",paramlist);
            query.executeUpdate();
        }
    }

}
