package com.traffic.service;

import com.traffic.dto.Execution;
import com.traffic.exception.DataAccessException;
import com.traffic.model.Tag;

import java.util.List;

/**
 * 标签Service接口
 * Created by ZhanHeng on 2016/11/12.
 */
public interface TagService {
    /**
     * 根据主键查
     * @return
     */
    Tag findById(String id);
    /**
     * 查询
     * @return
     */
    List<Tag> findAll();

    /**
     * 添加
     * @param userInfo
     * @return
     */
    Execution add(Tag userInfo) throws DataAccessException;

    /**
     * 删除
     * @param userInfo
     */
    void delete(Tag userInfo) throws DataAccessException;

    /**
     * 更新信息
     * @param userInfo
     */
    void update(Tag userInfo) throws DataAccessException;

    /**
     * 查询某级标签
     * @param level
     * @return
     */
    public List<Tag> findByLevel(int level);

}
