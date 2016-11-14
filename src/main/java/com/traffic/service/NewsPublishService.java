package com.traffic.service;

import com.traffic.model.NewsPublish;

/**
 * Created by lenovo on 2016/11/14.
 */
public interface NewsPublishService {
    /**
     * 根据主键查询
     * @param id
     * @return
     */
    NewsPublish findById(String id);

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
