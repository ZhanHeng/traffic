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
     * 添加保存一个新闻
     * @param newsAndNotice
     * @return
     */
    Integer save(NewsAndNotice newsAndNotice) throws DataAccessException;

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
     * 返回某一类的新闻列表
     * @return
     */
    List<NewsAndNotice> findByCategoryId(String categoryId);
}
