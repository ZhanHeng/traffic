package com.traffic.dao;

import com.traffic.model.ParentCategory;

import java.util.List;

/**
 * 一级菜单类别Dao
 * Created by ZhanHeng on 2016/11/12.
 */
public interface ParentCategoryDao {
    /**
     * 根据主键查询
     * @param id
     * @return
     */
    ParentCategory findById(String id );

    /**
     * 返回所有
     * @return
     */
    List<ParentCategory> findAll();

    /**
     * 添加保存
     * @param parentCategory
     * @return
     */
    void save(ParentCategory parentCategory);

    /**
     * 修改
     * @param parentCategory
     */
    void update(ParentCategory parentCategory);

    /**
     * 删除
     * @param parentCategory
     */
    void delete(ParentCategory parentCategory);

}
