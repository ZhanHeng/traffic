package com.traffic.dao;

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
    public Tag findById(long id) {
        return (Tag)getCurrentSession().get(Tag.class,id);
    }

    public List<Tag> findAll() {
        return getCurrentSession().createQuery("from Tag as t order by t.tagLevel,t.parentTag.tagId").list();
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

    public List<Tag> findByName(String name) {
        String hql = "from Tag where passFlag = 1 and  tagName = ? ";
        Query query = getCurrentSession().createQuery(hql) ;
        query.setString(0,name);
        return query.list();
    }
    public List<Tag> findByTagProperty(Tag tag){
        StringBuffer hql = new StringBuffer("from Tag as t where 1=1 ");
        if(tag!=null && !"".equals(tag.getTagName().trim())){
            hql.append("and t.tagName Like '%"+tag.getTagName().trim()+"%'") ;
        }
        if( tag!=null && tag.getTagLevel()!=-1){
            hql.append(" and t.tagLevel = '"+tag.getTagLevel()+"'");
        }
        if( tag!=null && tag.getPassFlag()!=-1){
            hql.append(" and t.passFlag = '"+tag.getPassFlag()+"'");
        }
        if( tag!=null && tag.getParentTag()!=null && tag.getParentTag().getTagId()!=-1){
            hql.append(" and t.parentTag.tagId = '"+tag.getParentTag().getTagId()+"'");
        }
        return getCurrentSession().createQuery(hql.toString()).list() ;
    }

    //批量删除
    public void bacthDeleteTag(List<String> newsList){
        if(newsList!=null){
            // 封装参数
            Object[] paramlist = new Object[newsList.size()];
            for (int i = 0; i < newsList.size(); i++) {
                paramlist[i] =Long.parseLong(newsList.get(i));
            }
            // 拼装sql语句
            String sql = "delete from Tag as n where n.tagId IN (:taglist)";
            // 执行sql语句
            Query query = getCurrentSession().createQuery(sql);
            //设置参数
            query.setParameterList("taglist",paramlist);
            query.executeUpdate();
        }
    }

    public List<Tag> findChildTagByparentIdAndLevel(int level, long parentId) {
        String hql = "from Tag as t where t.passFlag = 1 and  t.tagLevel = ?  and t.parentTag.tagId = ? ";
        Query query = getCurrentSession().createQuery(hql) ;
        query.setInteger(0,level);
        query.setLong(1,parentId);
        return query.list();
    }
}
