package com.traffic.dao;

import com.traffic.model.NewsAndNotice;
import com.traffic.model.NewsAndNoticeCategory;

import java.util.List;

/**
 * 新闻Dao接口
 * Created by ZhanHeng on 2016/11/11.
 */
public interface NewsAndNoticeDao {
    /**
     * 根据主键查询新闻实体
     * @param id
     * @return
     */
    NewsAndNotice findById(String id );

    /**
     * 返回所有的新闻列表
     * @return
     */
    List<NewsAndNotice> findAll();

    /**
     * 添加保存一个新闻
     * @param newsAndNotice
     * @return
     */
    void save(NewsAndNotice newsAndNotice);

    /**
     * 修改一个新闻
     * @param newsAndNotice
     */
    void update(NewsAndNotice newsAndNotice);

    /**
     * 删除一个新闻
     * @param newsAndNotice
     */
    void delete(NewsAndNotice newsAndNotice);

    /**
     * 返回某一类的新闻列表
     * @return
     */
    List<NewsAndNotice> findByCategoryId(String categoryId);

    /**
     * 多条件查询
     * @param categoryId
     * @param queryNewsTitle
     * @param queryNewsAuthor
     * @param queryTime1
     * @param queryTime2
     * @return
     */
     List<NewsAndNotice> queryInfo(int categoryId, String queryNewsTitle,String queryNewsAuthor, String queryTime1, String queryTime2);

    /**
     * 查出所有焦点图新闻
     * @return
     */
     List<NewsAndNotice> showFocusPicture();

    /**
     * 查询某个一级菜单下的新闻
     * @param parentCategoryId
     * @return
     */
     List<NewsAndNotice> showNewsList(int parentCategoryId);

    /**
     * 获取焦点图的数量
     * @return
     */
     int getCountNumber();

    /**
     * 批量删除新闻
     * @param newsList
     */
    void bacthDeleteNewsAndNotice(List<String> newsList);

    /**
     * 列出所有的二级菜单
     * @return
     */
     List<NewsAndNoticeCategory> getCategoryTab();

    /**
     * 列出所有的一级菜单
     * @return
     */
     List<NewsAndNoticeCategory> getParentCategory();

    /**
     * 列出某一级菜单下的所有二级菜单
     * @param parentCategoryId
     * @return
     */
     List<NewsAndNoticeCategory> showMenuList(int parentCategoryId);
}
