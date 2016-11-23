package com.traffic.service;

import com.traffic.exception.DataAccessException;
import com.traffic.model.NewsAndNotice;

import java.util.List;

/**
 * Created by ZhanHeng on 2016/11/11.
 */
public interface NewsAndNoticeService {
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
     * 返回Tag下所有新闻
     */
    List<NewsAndNotice> findNewsByTag(String tagPath);


    /**
     * 添加保存一个新闻
     * @param newsAndNotice
     * @return
     */
    void save(NewsAndNotice newsAndNotice) throws DataAccessException;

    /**
     * 修改一个新闻
     * @param newsAndNotice
     */
    void update(NewsAndNotice newsAndNotice) throws DataAccessException;

    /**
     * 删除一个新闻
     * @param newsAndNotice
     */
    void delete(NewsAndNotice newsAndNotice) throws DataAccessException;

    /**
     * 查出所有焦点图新闻
     * @return
     */
    List<NewsAndNotice> showFocusPicture();


    /**
     * 获取焦点图的数量
     * @return
     */
    int getCountNumber();

    /**
     * 批量删除新闻
     * @param newsList
     */
    void bacthDeleteNewsAndNotice(List<String> newsList) throws DataAccessException ;

}
