package com.traffic.dao;

import com.traffic.model.ParentCategory;
import com.traffic.model.Tag;

import java.util.List;

/**
 * 一级菜单类别Dao
 * Created by ZhanHeng on 2016/11/12.
 */
public interface TagDao {
    /**
     * 根据主键查询
     * @param id
     * @return
     */
    Tag findById(String id );

    /**
     * 返回所有
     * @return
     */
    List<Tag> findAll();

    /**
     * 添加保存
     * @param tag
     * @return
     */
    void save(Tag tag);

    /**
     * 修改
     * @param tag
     */
    void update(Tag tag);

    /**
     * 删除
     * @param tag
     */
    void delete(Tag tag);

    /**
     * 根据级别查询
     */
    List<Tag> findByLevel(int level);
}
