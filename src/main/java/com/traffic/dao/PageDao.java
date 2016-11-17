package com.traffic.dao;

import com.traffic.dto.Page;
import com.traffic.model.NewsAndNotice;

import java.util.List;

/**
 * Created by ZhanHeng on 2016/11/16.
 */
public interface PageDao {
    /**
     * 多条件查询，返回分页结果
     * @param news
     * @param page
     * @return
     */
    List<NewsAndNotice> findPageByProperty(NewsAndNotice news , Page page , String tagPath);

    /**
     * 根据实体属性拼装成hql语句
     * @param newsAndNotice
     * @return
     */
    String modelToSql(NewsAndNotice newsAndNotice,String tagPath);
}
