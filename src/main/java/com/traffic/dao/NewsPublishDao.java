package com.traffic.dao;

import com.traffic.model.NewsPublish;

import java.util.List;

/**
 * 新闻结果表
 * Created by ZhanHeng on 2016/11/12.
 */
public interface NewsPublishDao {

    /**
     * 根据主键查询
     * @param newsPublishId
     * @return
     */
    NewsPublish findById(String newsPublishId);

    /**
     * 添加保存
     * @param newsPublish
     * @return
     */
    void save(NewsPublish newsPublish);

    /**
     * 修改
     * @param newsPublish
     */
    void update(NewsPublish newsPublish);

    /**
     * 删除
     * @param newsPublish
     */
    void delete(NewsPublish newsPublish);

}
