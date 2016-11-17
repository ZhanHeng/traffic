package com.traffic.dao;

import com.traffic.dto.Page;
import com.traffic.model.NewsAndNotice;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * pageDao的实现类
 * Created by ZhanHeng on 2016/11/16.
 */
@Repository
public class PageDaoImpl extends HibernateDaoSupport implements PageDao {
    @Resource
    private SessionFactory sessionFactory;

    @Autowired
    public void setMySessionFactory(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    private Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }

    public List<NewsAndNotice> findPageByProperty(NewsAndNotice news, Page page ,String tagPath) {
        String hql = modelToSql(news,tagPath);
        logger.info("+++++++++++++ hql = "+hql);
        Query query = getCurrentSession().createQuery(hql);
        //设置查到的所有数据
        page.setRecordCount(query.list().size());
        //重新计算分页
        page.freshPage();
        //设置查询的第一条记录位置,即偏移量
        query.setFirstResult((page.getCurPage() - 1) * page.getPageSize());
        //设置要查询的页的大小
        query.setMaxResults(page.getPageSize());
        return query.list();
    }

    public String modelToSql(NewsAndNotice news ,String tagPath) {
        StringBuffer hql = new StringBuffer("from NewsAndNotice as t where 1=1 ");
        if(news!=null && !"".equals(news.getTitle())){
            hql.append("and t.title Like '%"+news.getTitle()+"%'") ;
        }
        if(news!=null && !"".equals(news.getAuthor())){
            hql.append(" and t.author Like '%"+news.getAuthor()+"%'");
        }
        if( news!=null &&!"".equals(news.getTime()) ){
            hql.append(" and t.time = '"+news.getTime()+"'");
        }
        if( news!=null &&!"none".equals(news.getFocusFlag())){
            hql.append(" and t.focusFlag = '"+news.getFocusFlag()+"'");
        }
        if(tagPath!=null&&!"".equals(tagPath)){
            hql.append(" and t.tagPath = '"+tagPath+"'");
        }
        hql.append(" order by t.time desc");
        return hql.toString();
    }
}
