package com.traffic.dao;

import com.traffic.model.UserInfo;

import java.util.List;

/**
 * 用户Dao
 * Created by lenovo on 2016/11/11.
 */
public interface UserDao {

    /**
     * 查询所有用户
     * @return
     */
    List<UserInfo> findAll();

    /**
     * 添加用户
     * @param userInfo
     * @return
     */
    void add(UserInfo userInfo);

    /**
     * 删除用户
     * @param userInfo
     */
    void delete(UserInfo userInfo);

    /**
     * 更新用户信息
     * @param userInfo
     */
    void update(UserInfo userInfo);

    /**
     * 根据用户名&密码进行验证，MD5加密
     * @param name
     * @param md5
     * @return
     */
    List<UserInfo> findByNameAndPassword(String name ,String md5);

    /**
     * 根据用户名查询 用户是否已存在(保证用户名唯一)
     * @param name
     * @return
     */
    public List<UserInfo> findByName(String name);


}
