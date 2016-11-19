package com.traffic.dao;

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
    Tag findById(long id );

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


    /**
     * 根据名称查询
     */
    List<Tag> findByName(String name);

    /**
     * 根据实体属性多条件查询
     * @param tag
     * @return
     */
    public List<Tag> findByTagProperty(Tag tag);

    /**
     * 根据实体属性确定唯一
     * @param tag
     * @return
     */
    public List<Tag> findOnlyByTagProperty(Tag tag);
    /**
     * 批量删除
     * @param newsList
     */
    public void bacthDeleteTag(List<String> newsList);

    /**
     * 根据父菜单查询子菜单
     * @param level
     * @param parentId
     * @return
     */
    public List<Tag> findChildTagByparentIdAndLevel(int level , long parentId);
}
