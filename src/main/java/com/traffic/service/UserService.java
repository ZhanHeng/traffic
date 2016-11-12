package com.traffic.service;

import com.traffic.dto.Execution;
import com.traffic.exception.DataAccessException;
import com.traffic.model.UserInfo;

import java.util.List;

/**
 * 用户Service接口
 * Created by lenovo on 2016/11/11.
 */
public interface UserService {


    /**
     * 根据用户名 查用户
     * @return
     */
    List<UserInfo> findByName(String name);
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
    Execution add(UserInfo userInfo) throws DataAccessException;

    /**
     * 删除用户
     * @param userInfo
     */
    void delete(UserInfo userInfo) throws DataAccessException;

    /**
     * 更新用户信息
     * @param userInfo
     */
    void update(UserInfo userInfo) throws DataAccessException;

    /**
     * 登录验证
     * @param userInfo
     * @return
     * @throws DataAccessException
     */
    Execution validateUser(UserInfo userInfo) throws DataAccessException;
}
