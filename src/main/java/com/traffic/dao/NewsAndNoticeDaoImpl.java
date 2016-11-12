package com.traffic.dao;

import com.traffic.model.NewsAndNotice;
import com.traffic.model.NewsAndNoticeCategory;
import com.traffic.model.ParentCategory;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
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
    //查单个新闻
    public NewsAndNotice findById(String id) {
        return (NewsAndNotice)getCurrentSession().get(NewsAndNotice.class,id);
    }
    //查出所有新闻
    public List<NewsAndNotice> findAll() {
        List<NewsAndNotice> list = getCurrentSession().createQuery("from NewsAndNotice").list();
        return list;
    }
    ////查询某个二级菜单的新闻
    public List<NewsAndNotice> findByCategoryId(String categoryId) {
        String hql = "from NewsAndNotice  where category.categoryId = ? order by time desc,orderTime desc";
        return getCurrentSession().createQuery(hql).setString(0,categoryId).list() ;
    }

    public void save(NewsAndNotice newsAndNotice) {
        getCurrentSession().save(newsAndNotice);
    }

    public void update(NewsAndNotice newsAndNotice) {
        getCurrentSession().saveOrUpdate(newsAndNotice);
    }

    public void delete(NewsAndNotice newsAndNotice) {
        getCurrentSession().delete(newsAndNotice);
    }


    public List<NewsAndNotice> queryInfo(int categoryId, String queryNewsTitle,String queryNewsAuthor, String queryTime1, String queryTime2) {
        String hql = "from NewsAndNotice where 1=1";
        if (!"".equals(queryNewsTitle) && queryNewsTitle != null) {
            hql += " and title like '%" + queryNewsTitle + "%'";
        }
        if (!"".equals(queryNewsAuthor) && queryNewsAuthor != null) {
            hql += " and author like '%" + queryNewsAuthor + "%'";
        }
        if (!"".equals(queryTime1) && queryTime1 != null) {
            hql += " and time >='" + queryTime1 + "'";
        }
        if (!"".equals(queryTime2) && queryTime2 != null) {
            hql += " and time <='" + queryTime2 + "'";
        }
        if( categoryId != -1){
            hql += "  and category.categoryId =" + categoryId+ " order by time desc";
        }
        return getCurrentSession().createQuery(hql).list();
    }

    // TODO Auto-generated method stub
/*    public PageBean queryForPage(int categoryId, String queryNewsTitle,
                                 String queryNewsAuthor, String queryTime1, String queryTime2,
                                 int pageSize, int page) {
        List list;
        int totalPage, length, currentPage, offset;//
        String hql = "from NewsAndNotice where 1=1";
        if (!"".equals(queryNewsTitle) && queryNewsTitle != null) {
            hql += " and title like '%" + queryNewsTitle + "%'";
        }
        if (!"".equals(queryNewsAuthor) && queryNewsAuthor != null) {
            hql += " and author like '%" + queryNewsAuthor + "%'";
        }
        if (!"".equals(queryTime1) && queryTime1 != null) {
            hql += " and time >='" + queryTime1 + "'";
        }
        if (!"".equals(queryTime2) && queryTime2 != null) {
            hql += " and time <='" + queryTime2 + "'";
        }
        hql += "  and category.categoryId =" + categoryId
                + " order by time desc";
        int allRow = newsAndNoticeDao.getAllRowCount(hql);

        if (allRow != 0) {
            totalPage = PageBean.countTotalPage(pageSize, allRow);
            length = pageSize;
            currentPage = PageBean.countCurrentPage(page, totalPage);
            offset = PageBean.countOffset(pageSize, currentPage);
            list = newsAndNoticeDao.queryNewsForPage(hql, offset, length);
        } else {
            totalPage = 0;
            length = pageSize;
            currentPage = 0;
            list = null;
        }

        PageBean pageBean = new PageBean();
        pageBean.setPageSize(pageSize);
        pageBean.setCurrentPage(currentPage);
        pageBean.setAllRow(allRow);
        pageBean.setTotalPage(totalPage);
        pageBean.setList(list);

        pageBean.init();
        return pageBean;
    }*/

    //查出所有焦点图的新闻
    public List<NewsAndNotice> showFocusPicture(){
        String hql = "from NewsAndNotice as e where e.focusFlag='YES' ";
        return getCurrentSession().createQuery(hql).list();
    }
    //查询某个一级菜单下的新闻
    public List<NewsAndNotice> showNewsList(int parentCategoryId){
        String hql = "from NewsAndNotice as e where e.category.parentCategory.parentCategoryId= ? order by time desc,orderTime desc";
        return getCurrentSession().createQuery(hql).setInteger(0,parentCategoryId).list() ;
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
            Query query = getCurrentSession().createQuery(sql);
            //设置参数
            query.setParameterList("userIdList",paramlist);
            query.executeUpdate();
        }
    }
    //所有的二级菜单
    public List<NewsAndNoticeCategory> getCategoryTab() {
        return getCurrentSession().createQuery("from NewsAndNoticeCategory").list();
    }
    //所有的一级菜单
    public List<NewsAndNoticeCategory> getParentCategory() {
        return getCurrentSession().createQuery("from ParentCategory").list();
    }

    //列出某一级菜单下的所有二级菜单
    public List<NewsAndNoticeCategory> showMenuList(int parentCategoryId){
        String hql = " from NewsAndNoticeCategory as e where  e.parentCategory.parentCategoryId = ? ";
        return getCurrentSession().createQuery(hql).setInteger(0,parentCategoryId).list() ;
    }
}
