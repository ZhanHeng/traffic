package com.traffic.service;

import com.traffic.dto.Execution;
import com.traffic.exception.DataAccessException;
import com.traffic.model.Tag;

import java.util.List;

/**
 * 菜单Service接口
 * Created by ZhanHeng on 2016/11/12.
 */
public interface TagService {
    /**
     * 根据主键查
     * @return
     */
    Tag findById(long id);
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
    Execution update(Tag userInfo) throws DataAccessException;

    /**
     * 查询某级菜单
     * @param level
     * @return
     */
    public List<Tag> findByLevel(int level);

    /**
     * 根据实体属性多条件查询
     * @param tag
     * @return
     */
    public List<Tag> findByTagProperty(Tag tag);


    /**
     * 批量删除
     * @param newsList
     * @throws DataAccessException
     */
    public void bacthDeleteTag(List<String> newsList) throws DataAccessException;

    /**
     * 根据父菜单查询子菜单
     * @param level
     * @param parentId
     * @return
     */
    public List<Tag> findChildTagByparentIdAndLevel(int level , long parentId) throws DataAccessException;

}
